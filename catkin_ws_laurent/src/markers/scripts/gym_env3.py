#!/usr/bin/env python3
import sys
import os
import ast
import rospy
import moveit_commander
import geometry_msgs.msg
from geometry_msgs.msg import Pose
import tf
import math
import numpy as np
from sensor_msgs.msg import JointState
from markers.msg import obstacle
from actionlib_msgs.msg import GoalStatus
from bioin_tacto.msg import raw_barometer
from stable_baselines3 import PPO
import gym


import gym
from gym import spaces
import numpy as np

###global variable z that is generated by the RL algorithm and used to adjust the robot position
delta = 0.0
go = False
done = False

moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('move_arm_sensor_pose', anonymous = True)
robot = moveit_commander.RobotCommander()


temp = open('poses_test.txt','r').read().splitlines()
traject_poses = ast.literal_eval(temp[0])
### Sort based on Y-axis
traject_poses = sorted(traject_poses, key = lambda x: x[1], reverse = False)
### Create groups of poses so that the manipulator walks in the +X direction
### If I = 3 and samplesize = 5 then the number of points in one +X sweep is (3-1)*(5-1) = 8
### If J = 4 and samplesize = 5 then the number of points in one +Y sweep is (4-1)*(5-1) = 12
n_i = 8
n_j = 8
traject_poses_adjusted = []

for idx, pose in enumerate(traject_poses):

    if idx % n_i == 0:

        list_ = traject_poses[idx: idx + n_j]
        ordered_list = sorted(list_, key = lambda x : x[0], reverse = False)
        for item in ordered_list:

            traject_poses_adjusted.append(item)

for idx, item in enumerate(traject_poses_adjusted):

    if idx != 0:

        if item == traject_poses_adjusted[idx - 1]:

            del traject_poses_adjusted[idx]
        else:

            print(item)
print(type(traject_poses[0]))
print(type(traject_poses[0][0]))

class RobotEnv(gym.Env):

    metadata = {"render_modes": ["human", "rgb_array"], "render_fps": 4}

    def __init__(self, render_mode=None):

        self.mov = Movement()
        self.observation_space = spaces.Dict(
            {
                "pressure": spaces.Box(low = np.array([0]), high = np.array([1]), dtype = np.float32 ),
                #"position": spaces.Box(low = np.array([-1,-1,-1]), high = np.array([1,1,1]), dtype = np.float32 ),
                "orientation": spaces.Box(low = np.array([-1,-1,-1,-1]), high = np.array([1,1,1,1]), dtype = np.float32 ),
            }
        )
        print(self.observation_space.sample()['orientation'])
        # We have 4 actions, corresponding to "right", "up", "left", "down"
        self.action_space = spaces.Box(low = np.array([-1]), high = np.array([1]))
        self.rand_idx = 0
        self.window = None
        self.clock = None
        self.poses = traject_poses_adjusted
        rospy.loginfo("There are %s poses to verify.", len(self.poses))
        self.current_step = 0
        self.idx = 0

    def reset(self, seed=None, options=None):
        self.current_step = 0
        self.mov.move_home_pose()
        ## In the reset step the robot first moves to home pose and then randomly
        ## selects a first pose to start from
        collision = True
        while collision:

            self.rand_idx = np.random.randint(0, len(self.poses))
            goal_pose = self.poses[self.rand_idx]
            rospy.loginfo("Moving to position %s.", self.rand_idx)
            c_p, collision = self.mov.move([goal_pose[0],goal_pose[1],goal_pose[2]+0.03])
            if collision:
                rospy.loginfo("Collision, resetting from a different position.")

        self.mov.move(goal_pose)
        rospy.sleep(0.5)
        return self._get_obs()


    def _take_action(self, action, position):

        pose = self.mov.arm_group.get_current_pose().pose
        orientation = [pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w]
        normal = self.mov.qv_mult(orientation, [-1,0,0])
        normal = np.array([-normal[0], -normal[1], normal[2]])
        position = np.array(position)
        print(normal)
        # current_position = [current_pose.position.x, current_pose.position.y, current_pose.position.z]
        delta = action[0]*0.005
        goal = position + delta*normal
        # goal = [position[0], position[1], position[2] + delta]
        rospy.loginfo("Taking action...")
        c_p, collision = self.mov.move(goal)
        if collision:

            obs = self.reset()
        else:
            rospy.sleep(0.5)
            obs = self._get_obs()
        return obs

    def _get_obs(self):

        pose = self.mov.arm_group.get_current_pose().pose
        orientation = [pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w]
        orientation = (np.array(orientation)-np.array([-1,-1,-1,-1]))/np.array([2,2,2,2])
        pressure = (np.array(self.mov.baro)-(-4))/(750 + 4)
        obs = {"pressure":pressure,
                    "orientation":orientation}
        return obs

    def step(self, action):


        done = False

        rospy.loginfo("Current step is: %s", self.current_step)
        position = self.poses[self.rand_idx]
        obs1 = self._get_obs()
        pressure = obs1['pressure']
        pose = self.mov.arm_group.get_current_pose().pose
        orientation = [pose.orientation.x, pose.orientation.y, pose.orientation.z, pose.orientation.w]

        ## denormalizing observation
        pressure = pressure*(750 + 4) -4
        rospy.loginfo("The current pressure before action is: %s", pressure)
        obs2 = self._take_action(action, position)
        pressure2 = obs2['pressure']
        pressure2 = pressure2*(750 + 4) -4
        rospy.loginfo("The current pressure after action is: %s", pressure2)
        self.current_step += 1
        if pressure2 >= 400:

            reward = (-pressure2/50 + 9)
        if pressure2 < 400:

            reward = (pressure2/50 - 7)
        if 390 > pressure2 > 410:

            reward = 10

        if (pressure2 > 670) or (pressure2 < 0) or (orientation[3] <= 0.4):

            done = True
            reward = -10

        if self.current_step >= 50:

            done = True
        ## normalizing reward using min max:
        reward_n = (reward + 10)/(10 - (-10))/self.current_step
        # rospy.loginfo(obs2)
        print(reward_n)
        return obs2, reward_n, done, {}

class Movement(object):

    def callback(self,data):

        self.joint2_position = data.position[1]
        self.joint4_position = data.position[3]

    def move_home_pose(self):

        current_pose = self.arm_group.get_current_pose().pose
        if current_pose.position.z <= 0.05:
            goal = current_pose
            goal.position.x = position[0]
            goal.position.y = position[1]
            goal.position.z = position[2] + 0.02
            goal.orientation.w = 1 ## mantain actual orientation
            self.arm_group.set_joint_value_target(goal, "end_effector_link", True)
            plan1 = self.arm_group.plan()
            self.arm_group.go()
            rospy.sleep(0.3)
        self.arm_group.set_joint_value_target([0, 0, -0.17, 1.6])
        plan1 = self.arm_group.plan()
        self.arm_group.go()
        rospy.sleep(1)

    def check_collision(self):

        #Prevents robot from going to bad positions
        value1 = self.joint2_position
        value2 = self.joint4_position
        print(value1)
        print(value2)
        if (-0.6 < value1 < 0.6) or (0.7 < value2 < 1.7):
            #no collision
            condition = False
        else:
            #collision
            condition = True
        return condition

    def fix_orientation(self, pose, orientation_goal):

        if not self.check_collision():



            pose.orientation = orientation_goal
            self.arm_group.set_joint_value_target(pose, "end_effector_link", True)
            plan1 = self.arm_group.plan()
            self.arm_group.go()
            self.arm_group.clear_pose_targets()
            rospy.loginfo("fixing orientation")
            rospy.sleep(0.3)
            ## Check if orientation of sensor has changed
            ## if yes, then there was a collision
            if abs(self.data.orientation.w - pose.orientation.w) > 0.2:

                rospy.loginfo("Sensor orientation changed during correction. Collision")
                return True
            else:
                return False

        else:

            return True

    def callback_sp(self,data):

        # current_pose = self.arm_group.get_current_pose()
        self.data = data
        # self.sp.position = self.ex_pose.pose.position

    def callback_traj(self, data):

        self.status = data.status_list.status

    def qv_mult(self,q1, v1):
        ## Function to apply a rotation quaternion to a vector and rotate it.
        ## For active rotation
        q2 = list(v1)
        q2.append(0.0)
        return tf.transformations.quaternion_multiply(
            tf.transformations.quaternion_conjugate(q1),
            tf.transformations.quaternion_multiply(q2,q1)
            )[:3]

    def check_distance(self,position, goal, threshold = 0.01):

        dist = math.sqrt(pow(position[0] - goal[0], 2) + pow(position[1] - goal[1], 2) + pow(position[2] - goal[2], 2))

        if (dist >= threshold):

            return True

        else:

            return False

    def move(self, position):

        if not self.check_collision():
            #get current pose
            current_pose = self.arm_group.get_current_pose().pose
            #copy current pose format and orientation to goal
            goal = current_pose
            #copy goal position to goal
            current_position = current_pose.position

            dist = self.check_distance([current_position.x, current_position.y, current_position.z], position)

            goal.position.x = position[0]
            goal.position.y = position[1]
            goal.position.z = position[2]
            goal.orientation.w = 1 ## mantain actual orientation
            self.arm_group.set_joint_value_target(goal, "end_effector_link", True)
            plan1 = self.arm_group.plan()
            if self.arm_group.go(wait=True):

                collision = self.fix_orientation(goal, self.data.orientation)

            else:
                collision = True
                rospy.loginfo("Couldn't reach position. Collision")

            rospy.sleep(0.2)
        else:

            collision = True

        return self.arm_group.get_current_pose().pose, collision

    def callback_raw_baro(self, msg):

        self.baro = msg.baro_level

    def __init__(self):


        self.robot = moveit_commander.RobotCommander()


        self.arm_group = moveit_commander.MoveGroupCommander('arm')
        self.arm_group.set_pose_reference_frame("end_effector_link")
        self.arm_group.set_goal_position_tolerance(0.0001)
        # self.arm_group.set_goal_orientation_tolerance(0.01)
        self.ex_pose = self.arm_group.get_current_pose()
        rospy.loginfo(self.ex_pose)
        self.joint1_position = 0.0
        self.joint3_position = 0.0
        self.data = Pose()
        self.status = 3 ## movegroup status
        self.joint_pub = rospy.Publisher("/obstacle", obstacle, queue_size = 2)
        self.joint_sub = rospy.Subscriber("joint_states", JointState, self.callback)
        self.sensor_sub = rospy.Subscriber("sensor_pose", Pose, self.callback_sp)
        self.trajectory_sub = rospy.Subscriber("move_group/status", GoalStatus, self.callback_traj)
        self.teensy_baro_sub = rospy.Subscriber("raw_barometers_teensy", raw_barometer, self.callback_raw_baro)
        self.rate = rospy.Rate(10)
        self.baro = 0.0

if __name__ == '__main__':
    robot_env = RobotEnv()
    if os.path.exists('model_dump_final.zip'):
        print("Loading the saved model...")
        model = PPO.load('model_dump_final.zip', robot_env, verbose = 1)
    else:
        model = PPO("MultiInputPolicy", robot_env, verbose = 1)


    # model = PPO("MultiInputPolicy", robot_env, verbose=1)
    # moveit_commander.roscpp_initialize(sys.argv)
    # rospy.init_node('move_arm_sensor_pose', anonymous = True)
    #robot = moveit_commander.RobotCommander()
    # movement_object = Movement()
    try:
        model.learn(total_timesteps=200)

        # movement_object.start()
    except rospy.ROSInterruptException:
        pass
    rospy.loginfo("Saving the model...")
    model.save('model_dump_final.zip')
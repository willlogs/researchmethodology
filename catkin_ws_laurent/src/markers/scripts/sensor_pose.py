#!/usr/bin/env python3
import sys
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

temp = open('./poses_test.txt','r').read().splitlines()
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

        list = traject_poses[idx: idx + n_j]
        ordered_list = sorted(list, key = lambda x : x[0], reverse = False)
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

moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('move_arm_sensor_pose', anonymous = True)
robot = moveit_commander.RobotCommander()

class Movement(object):

    def callback(self,data):

        self.joint3_effort = data.effort[3]
        self.joint2_effort = data.effort[2]

    def calc_quaternion(self,u,v):

        d = np.dot(u,v)
        w = np.cross(u,v)
        return tf.transformations.quaternion_about_axis(1+d, w)

    def move_home_pose(self):

        self.arm_group.set_joint_value_target([-0.17, 0, -0.17, 1.7])
        plan1 = self.arm_group.plan()
        self.arm_group.go(wait=True)

    def fix_orientation(self, pose, orientation_goal):

        pose.orientation = orientation_goal
        self.arm_group.set_joint_value_target(pose, "end_effector_link", True)
        plan1 = self.arm_group.plan()
        self.arm_group.go()
        self.arm_group.clear_pose_targets()
        rospy.loginfo("fixing orientation")
        rospy.sleep(0.1)

    def callback_sp(self,data):

        # current_pose = self.arm_group.get_current_pose()
        self.data = data
        # self.sp.position = self.ex_pose.pose.position

    def callback_traj(self, data):

        self.status = data.status_list.status

    def check_distance(self,position, goal, threshold = 0.02):

        dist = math.sqrt(pow(position[0] - goal[0], 2) + pow(position[1] - goal[1], 2) + pow(position[2] - goal[2], 2))

        if (dist >= threshold):

            return True

        else:

            return False

    def scan(self, positions):

        self.move_home_pose()
        rospy.sleep(1)
        quat = self.calc_quaternion(np.array([1,0,0]), np.array([0, 0, -1]))
        print(quat)
        for idx, position in enumerate(positions):
            rospy.loginfo(position)
            self.current_pose = self.arm_group.get_current_pose().pose
            self.sp = self.current_pose
            dist = self.check_distance([self.current_pose.position.x, self.current_pose.position.y, self.current_pose.position.z], position, 0.04)
            self.sp.position.x = position[0]
            self.sp.position.y = position[1]
            self.sp.position.z = position[2]
            self.sp.orientation.w = 1
            rospy.loginfo("Moving to position %s.", idx)
            if idx == 0:


                self.arm_group.set_joint_value_target(self.sp, "end_effector_link", True)
                plan1 = self.arm_group.plan()
                self.arm_group.go(wait=True)
                rospy.sleep(0.5)
                self.fix_orientation(self.sp, self.data.orientation)

            else:

                if dist:

                    move_up = self.arm_group.get_current_pose().pose
                    move_up.position.z += 0.03
                    self.arm_group.set_joint_value_target(move_up, "end_effector_link", True)
                    plan1 = self.arm_group.plan()
                    self.arm_group.go(wait=True)
                    rospy.sleep(0.5)
                    self.arm_group.set_joint_value_target(self.sp, "end_effector_link", True)
                    plan1 = self.arm_group.plan()
                    self.arm_group.go(wait=True)

                counter = 0
                self.current_pose = self.arm_group.get_current_pose().pose
                while self.check_distance([self.current_pose.position.x, self.current_pose.position.y, self.current_pose.position.z], position, 0.005) and counter <=10:

                    rospy.loginfo(counter)
                    self.arm_group.set_joint_value_target(self.sp, "end_effector_link", True)
                    plan1 = self.arm_group.plan()
                    self.arm_group.go(wait=True)
                    counter += 1
                    self.current_pose = self.arm_group.get_current_pose().pose

                self.fix_orientation(self.sp, self.data.orientation)



    def __init__(self):


        self.robot = moveit_commander.RobotCommander()


        self.arm_group = moveit_commander.MoveGroupCommander('arm')
        self.arm_group.set_goal_position_tolerance(0.0001)
        # self.arm_group.set_goal_orientation_tolerance(0.01)
        self.ex_pose = self.arm_group.get_current_pose()
        rospy.loginfo(self.ex_pose)
        self.joint2_effort = 0.0
        self.joint3_effort = 0.0
        self.data = Pose()
        self.status = 3 ## movegroup status
        self.joint_pub = rospy.Publisher("/obstacle", obstacle, queue_size = 2)
        self.joint_sub = rospy.Subscriber("joint_states", JointState, self.callback)
        self.sensor_sub = rospy.Subscriber("sensor_pose", Pose, self.callback_sp)
        self.trajectory_sub = rospy.Subscriber("move_group/status", GoalStatus, self.callback_traj)
        self.rate = rospy.Rate(10)

        self.poses2_bottom = [[0.4, -0.57, 0.85, 1.28],
                            [0.28, -0.44, 0.75, 1.22],
                            [0.24, -0.28, 0.66, 1.15],
                            [0.20, -0.15, 0.50, 1.16],
                            [0.17, 0, 0.38, 1.20],
                            [0.13, 0.11, 0.19, 1.17],
                            [0.12, 0.3, -0.03, 1.25],
                            [0.1, 0.47, -0.26, 1.35]
                            ]
        self.poses2_top = [[0.4, -0.62, 0.31, 1.8],
                            [0.28, -0.45, 0.33, 1.60],
                            [0.24, -0.34, 0.18, 1.65],
                            [0.20, -0.16, -0.05, 1.69],
                            [0.17, 0, -0.17, 1.7],
                            [0.13, 0.11, -0.28, 1.66],
                            [0.12, 0.3, -0.7, 1.80],
                            [0.1, 0.42, -0.83, 1.82]
                            ]
        self.poses1_bottom = [[0,-0.6,0.9,1.36],
                        [0,-0.48,0.81,1.27],
                        [0,-0.3,0.65,1.21],
                        [0,-0.14,0.49,1.21],
                        [0,0.02,0.35,1.21],
                        [0,0.13,0.20,1.2],
                        [0,0.27,-0.03,1.23],
                        [0,0.46,-0.28,1.37]]

        self.poses1_top = [[0,-0.67, 0.36, 1.81],
                     [0, -0.5,0.16,1.86],
                     [0, -0.31,-0.08,1.86],
                     [0,-0.17,-0.13,1.83],
                     [0,0,-0.19,1.74],
                     [0,0.08,-0.26,1.67],
                     [0,0.25,-0.6,1.81],
                     [0,0.38,-0.8,1.85]]

        self.poses0_bottom = [[-0.4, -0.57, 0.85, 1.28],
                            [-0.28, -0.44, 0.75, 1.22],
                            [-0.24, -0.28, 0.66, 1.15],
                            [-0.20, -0.15, 0.50, 1.16],
                            [-0.17, 0, 0.38, 1.20],
                            [-0.13, 0.11, 0.19, 1.17],
                            [-0.12, 0.3, -0.03, 1.25],
                            [-0.1, 0.47, -0.26, 1.35]
                            ]
        self.poses0_top = [[-0.4, -0.62, 0.31, 1.8],
                            [-0.28, -0.45, 0.33, 1.60],
                            [-0.24, -0.34, 0.18, 1.65],
                            [-0.20, -0.16, -0.05, 1.69],
                            [-0.17, 0, -0.17, 1.7],
                            [-0.13, 0.11, -0.28, 1.66],
                            [-0.12, 0.3, -0.7, 1.80],
                            [-0.1, 0.42, -0.83, 1.82]
                            ]

    def start(self):


        while not rospy.is_shutdown():

            self.current_pose = self.arm_group.get_current_pose().pose
            self.sp = self.current_pose
            self.scan(traject_poses_adjusted)
        # while not rospy.is_shutdown():
                # rospy.loginfo(self.arm_group.get_end_effector_link())
        # for idx, position in enumerate(traject_poses):
        #     self.current_pose = self.arm_group.get_current_pose().pose
        #     self.sp = self.current_pose
        #     if (self.check_distance([self.current_pose.position.x, self.current_pose.position.y, self.current_pose.position.z], position)):
        #         if self.status == 3:
        #             try:
        #
        #                 self.move_home_pose()
        #                 self.sp.position.x = position[0]
        #                 self.sp.position.y = position[1]
        #                 self.sp.position.z = position[2]
        #                 self.sp.orientation.w = 1
        #                 self.arm_group.set_joint_value_target(self.sp, "end_effector_link", True)
        #                 plan1 = self.arm_group.plan()
        #                 self.arm_group.go(wait=True)
        #                 rospy.loginfo("moving to position:")
        #                 rospy.loginfo(idx)
        #                 rospy.loginfo(position)
        #                 rospy.loginfo(self.current_pose.position)
        #                 rospy.sleep(1)
        #                 self.current_pose = self.arm_group.get_current_pose().pose
        #
        #             except rospy.ROSInterruptException:
        #                 # continue
        #                 pass
        #     self.sp.orientation = self.data.orientation
        #     self.arm_group.set_joint_value_target(self.sp, "end_effector_link", True)
        #     plan1 = self.arm_group.plan()
        #     self.arm_group.go(wait=True)
        #     self.arm_group.clear_pose_targets()
        #     rospy.loginfo("fixing orientation")
        #     rospy.sleep(1)

if __name__ == '__main__':
    rospy.sleep(2)
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('move_arm_sensor_pose', anonymous = True)
    robot = moveit_commander.RobotCommander()
    movement_object = Movement()
    try:
        movement_object.start()
    except rospy.ROSInterruptException:
        pass

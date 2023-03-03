#!/usr/bin/env python3
import sys
import rospy
import moveit_commander
import geometry_msgs.msg
from geometry_msgs.msg import Pose
import tf
import math
import numpy as np
from sensor_msgs.msg import JointState
from markers.msg import obstacle


moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('move_arm_sensor_pose', anonymous = True)
robot = moveit_commander.RobotCommander()





class Movement(object):

    def callback(self,data):

        self.joint3_effort = data.effort[3]
        self.joint2_effort = data.effort[2]

    def callback_sp(self,data):

        self.sp = data

    def __init__(self):


        self.robot = moveit_commander.RobotCommander()


        self.arm_group = moveit_commander.MoveGroupCommander('arm')
        self.ex_pose = self.arm_group.get_current_pose()
        rospy.loginfo(self.ex_pose)
        self.joint2_effort = 0.0
        self.joint3_effort = 0.0
        self.joint_pub = rospy.Publisher("/obstacle", obstacle, queue_size = 2)
        self.joint_sub = rospy.Subscriber("joint_states", JointState, self.callback)
        self.sensor_sub = rospy.Subscriber("sensor_pose", Pose, self.callback_sp)
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

    def move(self, init_pose, end_pose, steps):

        self.dist = np.array(end_pose)-np.array(init_pose)
        self.velocity = self.dist/steps
        for j in range(steps):
            #go to top position first
            self.arm_group.set_joint_value_target(np.array(init_pose) + (j+1)*self.velocity)
            self.plan1 = self.arm_group.go()
            self.pose = self.arm_group.get_current_pose().pose
            #check if its not hitting the bottom
            if self.pose.position.z < 0.005:
                self.obstacle_object = False
                self.joint_pub.publish(self.obstacle_object)
                rospy.loginfo("Empty position, moving to next location.")
                break

            elif (self.joint3_effort >-0.04):

                self.obstacle_object = True
                rospy.loginfo("Possible obstacle")
                rospy.loginfo(self.joint2_effort)
                rospy.loginfo(self.joint3_effort)
                self.arm_group.stop()
                self.joint_pub.publish(self.obstacle_object)
                rospy.sleep(1)
                self.obstacle_object = False
                break


    def start(self):

        while not rospy.is_shutdown():
            try:

                self.arm_group.set_pose_target(self.sp)
                plan1 = self.arm_group.plan()
                self.arm_group.go()
            except rospy.ROSInterruptException:
                continue



if __name__ == '__main__':
    moveit_commander.roscpp_initialize(sys.argv)
    rospy.init_node('move_arm_sensor_pose', anonymous = True)
    robot = moveit_commander.RobotCommander()
    movement_object = Movement()
    try:
        movement_object.start()
    except rospy.ROSInterruptException:
        pass

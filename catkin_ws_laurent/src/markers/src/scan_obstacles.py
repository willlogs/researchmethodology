#!/usr/bin/env python3
import sys
import rospy
import moveit_commander
import geometry_msgs.msg
import tf
import math
import numpy as np
from sensor_msgs.msg import JointState
moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node('move_group_scan_obstacles', anonymous = True)
robot = moveit_commander.RobotCommander()


arm_group = moveit_commander.MoveGroupCommander('arm')
ex_pose = arm_group.get_current_pose()
rospy.loginfo(ex_pose)
joint2_effort = 0.0
joint3_effort = 0.0

def callback(data):

    rospy.loginfo(data)
    joint3_effort = data.effort[3]
    joint2_effort = data.effort[2]
    rospy.loginfo(joint2_effort)

rospy.Subscriber("joint_effort", JointState, callback)
#pose0-1
#[0,-0.6,0.9,1.36]
#[0,-0.67, 0.36, 1.81]
#pose0-2
#[0,-0.48,0.81,1.27]
#[0, -0.5,0.16,1.86]
#pose0-3
#[0,-0.3,0.65,1.21]
#[0, -0.31,-0.08,1.86]
#pose0-4
#[0,-0.14,0.49,1.21]
#[0,-0.17,-0.13,1.83]
#pose0-5
#[0,0.02,0.35,1.21]
#[0,0,-0.19,1.74]
#pose0-6
#[0,0.13,0.20,1.2]
#[0,0.08,-0.26,1.67]
#pose0-7
#[0,0.27,-0.03,1.23]
#[0,0.25,-0.6,1.81]
#pose0-8
#[0,0.46,-0.28,1.37]
#[0,0.38,-0.8,1.85]
########################
poses0_bottom = [[0,-0.6,0.9,1.36],
                [0,-0.48,0.81,1.27],
                [0,-0.3,0.65,1.21],
                [0,-0.14,0.49,1.21],
                [0,0.02,0.35,1.21],
                [0,0.13,0.20,1.2],
                [0,0.27,-0.03,1.23],
                [0,0.46,-0.28,1.37]]

poses0_top = [[0,-0.67, 0.36, 1.81],
             [0, -0.5,0.16,1.86],
             [0, -0.31,-0.08,1.86],
             [0,-0.17,-0.13,1.83],
             [0,0,-0.19,1.74],
             [0,0.08,-0.26,1.67],
             [0,0.25,-0.6,1.81],
             [0,0.38,-0.8,1.85]]

for i in range(8):
    #go to top position first
    arm_group.set_joint_value_target(poses0_top[i])
    plan1 = arm_group.go()
    rospy.sleep(1)
    #press sensor against surface
    arm_group.set_joint_value_target(poses0_bottom[i])
    while (np.abs(joint3_effort) >=0.1) and (np.abs(joint2_effort)>=0.1):

        plan1 = arm_group.go()
    arm_group.stop()

    rospy.sleep(1)
    #go back up
    arm_group.set_joint_value_target(poses0_top[i])
    plan1 = arm_group.go()
    rospy.sleep(1)
moveit_commander.roscpp_shutdown()

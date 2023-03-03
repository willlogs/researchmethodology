#!/usr/bin/env python3
# Software License Agreement (BSD License)
#
# Copyright (c) 2008, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Revision $Id$

## Simple talker demo that published std_msgs/Strings messages
## to the 'chatter' topic

import rospy
import serial
import numpy as np
from sensor.msg import accel
from sensor.msg import magne
from sensor.msg import gyro
from sensor.msg import temp

def talker():
    pub_accel = rospy.Publisher('accelerometer', accel, queue_size=1)
    pub_magne = rospy.Publisher('magnetometer', magne, queue_size=1)
    pub_gyro = rospy.Publisher('gyroscope', gyro, queue_size=1)
    rospy.init_node('talker', anonymous=True)
    rate = rospy.Rate(100) # 10hz
    ser = serial.Serial('/dev/ttyACM1', baudrate=9600, timeout=1)
    while not rospy.is_shutdown():


        data = np.zeros(9)
        error = False
        for index in range(9):

            try:

                arduinoData = ser.readline().decode('ascii')
                data[index] = arduinoData
            except ValueError:
                error = True
                pass
        if (not error):

            accel_data = data[:3] #% rospy.get_time()
            magne_data = data[3:6] #% rospy.get_time()
            gyro_data = data[6:9] #% rospy.get_time()
            # rospy.loginfo(accel_data)
            # rospy.loginfo(magne_data)
            # rospy.loginfo(gyro_data)
            pub_accel.publish(accel_data)
            pub_magne.publish(magne_data)
            pub_gyro.publish(gyro_data)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass

#! /usr/bin/env python

import rospy
from visualization_msgs.msg import Marker
from geometry_msgs.msg import Point, Quaternion
import tf
import math
import numpy as np
from sensor.msg import accel
from sensor.msg import magne
from sensor.msg import gyro
from markers.msg import obstacle, controlpoint
from ahrs.filters import Madgwick, Tilt
from sensor_msgs.msg import JointState
from bioin_tacto.msg import raw_imu, raw_barometer

class MarkerBasics(object):


    def callback(self, msg):
        self.acceleration = msg.accel
        ###### X_sensor = Y_end_link;;;Y_sensor = Z_end_link;;;Z_sensor = X_end_link
        ###### The axis for the ROBOTIS manipulator and the ADAFRUIT sensor are defined differently
        #self.endLinkAcc = [self.acceleration[2], self.acceleration[0], self.acceleration[1]]
        self.endLinkAcc = [-self.acceleration[2], -self.acceleration[1], self.acceleration[0]]
        acc_size = math.sqrt(math.pow(self.endLinkAcc[0],2) + math.pow(self.endLinkAcc[1],2) + math.pow(self.endLinkAcc[2],2))
        self.norm_g = np.array(self.endLinkAcc)/acc_size
        self.acc = np.array(self.endLinkAcc)

    def callback_raw_imu(self, msg):

        self.acc = np.array([-msg.az, msg.ax, msg.ay])
        self.norm_g = self.acc/np.linalg.norm(self.acc)
        self.gyro = np.array([-msg.gz, msg.gx, msg.gy])/360*2*math.pi

    def callback_raw_baro(self, msg):

        self.baro = msg.baro_level

    def callback_mag(self, msg):
        #global norm_g
        self.magnetic = msg.magne
        ## multiply magnetometer readings by 10^5 to go from Gauss to nT
        self.endLinkmag = [-self.magnetic[2], -self.magnetic[1], self.magnetic[0]]
        acc_size = math.sqrt(math.pow(self.endLinkmag[0],2) + math.pow(self.endLinkmag[1],2) + math.pow(self.endLinkmag[2],2))
        self.mag = np.array(self.endLinkmag)*10000



    def callback2(self, msg):

        self.obstacle = msg.obstacle

    def callback_joints(self, msg):

        self.joint_positions = msg.position


    def qv_mult(self,q1, v1):
        ## Function to apply a rotation quaternion to a vector and rotate it.
        ## For active rotation
        q2 = list(v1)
        q2.append(0.0)
        return tf.transformations.quaternion_multiply(
            tf.transformations.quaternion_conjugate(q1),
            tf.transformations.quaternion_multiply(q2,q1)
            )[:3]
    def qv_mult_active(self,q1, v1):
        ## Function to apply a rotation quaternion to a vector and rotate it.
        ## For active rotation
        q2 = list(v1)
        q2.append(0.0)
        return tf.transformations.quaternion_multiply(
            tf.transformations.quaternion_multiply(q1,q2),
            tf.transformations.quaternion_conjugate(q1)
            )[:3]

    def get_axis_angle(self, v1, v2):

        v1_ = np.array(v1)
        v2_ = np.array(v2)
        angle = np.arccos(np.dot(v1_, v2_)/(np.linalg.norm(v1_)*np.linalg.norm(v2_)))
        axis = np.cross(v1_, v2_)
        axis = axis/np.linalg.norm(axis)
        return axis, angle



    def quat_rot (self, v1, v2):

        self.quat_xyz = np.cross(np.array(v1),np.array(v2))
        self.quat_w = math.sqrt(np.linalg.norm(v2)*np.linalg.norm(v1) + np.dot(np.array(v1), np.array(v2)))
        self.quat = np.array([self.quat_xyz[0], self.quat_xyz[1], self.quat_xyz[2], self.quat_w])
        self.quat_size = np.linalg.norm(self.quat)
        self.quat = self.quat / self.quat_size
        return self.quat


    def __init__(self):


        ###Publishers used
        self.marker_pub = rospy.Publisher("/visualization_marker", Marker, queue_size = 2)
        self.point_pub = rospy.Publisher("/point", controlpoint, queue_size = 2)
        ## Subscriptions
        self.accel_sub = rospy.Subscriber("accelerometer", accel, self.callback)
        self.magne_sub = rospy.Subscriber("magnetometer", magne, self.callback_mag)
        self.accel_sub = rospy.Subscriber("obstacle", obstacle, self.callback2)
        self.joint_state_sub = rospy.Subscriber("joint_states", JointState, self.callback_joints)
        self.teensy_sub_imu = rospy.Subscriber("raw_imus_teensy", raw_imu, self.callback_raw_imu)
        self.teensy_sub_imu = rospy.Subscriber("raw_barometers_teensy", raw_barometer, self.callback_raw_baro)
        ### Variables
        self.rate = rospy.Rate(10)
        self.init_marker(index = 0)
        self.norm_g = np.array([0, 0, 0])
        self.acc = np.array([0.0, 0.0, 0.0])
        self.mag = np.array([0.0, 0.0, 0.0])
        self.gyro = np.array([0.0, 0.0, 0.0])
        self.obstacle = False
        self.point = controlpoint()
        self.filter = Madgwick()
        self.quat_tminus1 = np.array([1.0,0.0,0.0,0.0])
        self.quat_temp = np.array([1.0,0.0,0.0,0.0])
        self.quat_updated2 = np.array([1.0,0.0,0.0,0.0])
    def init_marker(self, index = 0):

        self.index = 1000
        self.marker = Marker()
        self.marker2 = Marker()
        self.marker.header.frame_id = "world"
        self.marker.header.stamp = rospy.Time.now()
        self.marker.id = self.index
        self.marker.type = Marker.ARROW
        self.marker.action = Marker.ADD

        self.marker2.header.frame_id = "world"
        self.marker2.header.stamp = rospy.Time.now()
        self.marker2.id = 0
        self.marker2.type = Marker.ARROW
        self.marker2.action = Marker.ADD


        my_point = Point()
        self.marker.pose.position = my_point
        # Set the pose of the marker

        self.marker.pose.orientation.x = 0.0
        self.marker.pose.orientation.y = 0.0
        self.marker.pose.orientation.z = 0.0
        self.marker.pose.orientation.w = 1.0
        # Set the scale of the marker
        self.marker.scale.x = 0.1
        self.marker.scale.y = 0.01
        self.marker.scale.z = 0.01
        self.marker.lifetime = rospy.Duration(0)
        self.marker.color.r = 0.0
        self.marker.color.g = 1.0
        self.marker.color.b = 0.0
        self.marker.color.a = 1.0

        self.marker2.scale.x = 0.01
        self.marker2.scale.y = 0.003
        self.marker2.scale.z = 0.003
        self.marker2.lifetime = rospy.Duration(0)
        self.marker2.color.r = 1.0
        self.marker2.color.g = 0.0
        self.marker2.color.b = 1.0
        self.marker2.color.a = 1.0

    def start(self):

        self.tf_listener = tf.TransformListener()
        self.initial_acc = []
        self.initial_gyro = []
        self.calibration = True
        while not rospy.is_shutdown():
            try:
                (trans, rot) = self.tf_listener.lookupTransform('world', 'end_effector_link', rospy.Time(0))
            except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
                continue
            if self.calibration:

                rospy.loginfo("Starting Calibration")
            ## In this step we calibrate the sensor by capturing 100000 values of acceleration and averaging it
            ## After that we apply the inverse rotation from the end effector frame to the world frame to find the normalized value of the acceleration
            ## Once we have the normalized version of the acceleration we can use it to calculate the rotation at any given time
                rospy.sleep(1)
                while len(self.initial_acc) < 1000000:
                    self.initial_acc.append(self.norm_g)
                rospy.loginfo("Calculating average acceleration in the sensor frame...")
                self.avg_bias_acc = sum(self.initial_acc)/1000000
                rospy.loginfo("Done")
                rospy.loginfo(self.avg_bias_acc)

                rospy.loginfo("Calculating the theoretical gravity normal vector in the sensor frame")
                self.unbiased_acc_sensor = self.qv_mult(rot, np.array([0.0,0.0,1.0]))
                rospy.loginfo("Done")
                self.bias_deviation = self.unbiased_acc_sensor - self.avg_bias_acc
                self.bias_deviation = self.qv_mult([rot[0], rot[1], rot[2], -rot[3]], self.bias_deviation)
                rospy.loginfo(self.bias_deviation)

                rospy.loginfo("------------------------")
                rospy.loginfo("Repeating for gyroscope:")
                while len(self.initial_gyro) < 1000000:
                    self.initial_gyro.append(self.gyro)
                rospy.loginfo("Calculating average angular velocity bias in the sensor frame...")
                self.avg_bias_gyro = sum(self.initial_gyro)/1000000
                self.avg_bias_gyro = self.qv_mult([rot[0], rot[1], rot[2], -rot[3]], self.avg_bias_gyro)
                rospy.loginfo("Done")
                rospy.loginfo(self.avg_bias_gyro)
                self.calibration = False

            trans, rot = self.tf_listener.lookupTransform('world', 'end_effector_link', rospy.Time(0))

            self.rotation = tf.transformations.quaternion_from_euler(0, 0, -(self.joint_positions[0]))
            self.k = self.norm_g + self.qv_mult_active(rot, self.bias_deviation)
            self.k = self.k/(np.linalg.norm(self.k))

            self.axis, self.angle = self.get_axis_angle([0.0,0.0,1.0], self.k)
            self.quaternion = tf.transformations.quaternion_about_axis(self.angle, self.axis)
            self.quaternion = tf.transformations.quaternion_multiply(self.rotation, self.quaternion)
            self.quaternion = self.quaternion/np.linalg.norm(self.quaternion)

            self.quat_tminus1[0] = self.quaternion[3]
            self.quat_tminus1[1] = self.quaternion[0]
            self.quat_tminus1[2] = self.quaternion[1]
            self.quat_tminus1[3] = self.quaternion[2]

            self.gyro = self.gyro - self.avg_bias_gyro
            # print(self.gyro)
            self.rotated_gyr = self.qv_mult(self.quaternion, self.gyro)
            print(self.rotated_gyr)
            for _ in range(10):

                self.quat_updated = self.filter.updateIMU(self.quat_tminus1, gyr = self.rotated_gyr, acc = self.k)
                self.quat_tminus1 = self.quat_updated
            self.quat_temp[3] = self.quat_updated[0]
            self.quat_temp[0] = self.quat_updated[1]
            self.quat_temp[1] = self.quat_updated[2]
            self.quat_temp[2] = self.quat_updated[3]
            # self.quat_temp = tf.transformations.quaternion_multiply(self.rotation, self.quat_temp)
            self.quat_updated2[0] = self.quat_temp[3]
            self.quat_updated2[1] = self.quat_temp[0]
            self.quat_updated2[2] = self.quat_temp[1]
            self.quat_updated2[3] = self.quat_temp[2]
            ## Only publish a new marker if distance to previous one is superior to 1cm (diameter of sensor)
            self.distance = np.linalg.norm(np.array(trans) - np.array([self.marker2.pose.position.x, self.marker2.pose.position.y, self.marker2.pose.position.z]))
            #The orientation of the ARROW marker is along the +X axis as specified in ROS markers wiki so we apply an inverse quaternion rotation on the [-1,0,0] vector of the sensor frame to get the
            #normal coordinates of the plane in the world frame
            self.rotated_norm = self.qv_mult(self.quat_updated2,[-1,0,0])
            self.point.point = [trans[0],trans[1], trans[2]]
            self.point.normal = self.rotated_norm
            if self.distance >= 0.001 and self.obstacle:

                self.marker2.pose.position.x = trans[0]
                self.marker2.pose.position.y = trans[1]
                self.marker2.pose.position.z = trans[2]
                self.marker2.pose.orientation.x = self.quat_updated2[3]
                self.marker2.pose.orientation.y = self.quat_updated2[0]
                self.marker2.pose.orientation.z = self.quat_updated2[1]
                self.marker2.pose.orientation.w = self.quat_updated2[2]
                self.index += 1
                self.marker2.id = self.index
                self.marker_pub.publish(self.marker2)
                self.point_pub.publish(self.point)
                rospy.loginfo(self.rotated_norm)
                self.obstacle = False


            self.marker.pose.position.x = trans[0]
            self.marker.pose.position.y = trans[1]
            self.marker.pose.position.z = trans[2]
            self.marker.pose.orientation.x = self.quat_updated2[3]
            self.marker.pose.orientation.y = self.quat_updated2[0]
            self.marker.pose.orientation.z = self.quat_updated2[1]
            self.marker.pose.orientation.w = self.quat_updated2[2]


            self.marker_pub.publish(self.marker)
            self.rate.sleep()

if __name__ == '__main__':
    rospy.init_node('marker_node', anonymous=True)
    markerbasics_object = MarkerBasics()
    try:
        markerbasics_object.start()
    except rospy.ROSInterruptException:
        pass

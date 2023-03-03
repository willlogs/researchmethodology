#include "ros/ros.h"
#include "std_msgs/String.h"
#include "th_messages/raw_imu.h"

#include <sstream>

int main(int argc, char **argv) {
	ros::init(argc, argv, "dummyIMUpublisher");
	ros::NodeHandle n;
	ros::Publisher dummyIMUpub = n.advertise<th_messages::raw_imu>(
			"raw_imu_teensy", 1000);

	ros::Rate loop_rate(240);
	th_messages::raw_imu msg;
	msg.header.frame_id = "baros";

	while (ros::ok()) {
		//th_messages::raw_imu msg;

		for (int i = 0; i < 4; i++) {
			msg.sensor_id = i;
			msg.tempe = rand() % 40 + 1;
			msg.ax = rand() % 100 + 1;
			msg.ay = rand() % 100 + 1;
			msg.az = rand() % 100 + 1;
			msg.gx = rand() % 100 + 1;
			msg.gy = rand() % 100 + 1;
			msg.gz = rand() % 100 + 1;
			msg.mx = rand() % 100 + 1;
			msg.my = rand() % 100 + 1;
			msg.mz = rand() % 100 + 1;

			msg.header.stamp = ros::Time::now();

			/*
			 std::stringstream ss;
			 ss << "hello world " << count;
			 msg.data = ss.str();
			 */

			//ROS_INFO("%s", msg.data.c_str());
			dummyIMUpub.publish(msg);

			ros::spinOnce();

			loop_rate.sleep();
		}
	}
	return 0;
}
/*
 Header header
 msg.sensor_id
 msg.tempe
 msg.ax
 msg.ay
 msg.az
 msg.gx
 msg.gy
 msg.gz
 msg.mx
 msg.my
 msg.mz
 */

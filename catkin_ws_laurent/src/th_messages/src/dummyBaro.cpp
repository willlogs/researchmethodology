#include "ros/ros.h"
#include "std_msgs/String.h"
#include "th_messages/raw_barometer.h"

#include <sstream>

int main(int argc, char **argv) {
	ros::init(argc, argv, "dummyBaropublisher");
	ros::NodeHandle n;
	ros::Publisher dummyBaropub = n.advertise<th_messages::raw_barometer>(
			"raw_barometer_teensy", 1000);

	ros::Rate loop_rate(240);
	th_messages::raw_barometer msg;
	msg.header.frame_id = "baros";

	while (ros::ok()) {
		//th_messages::raw_imu msg;
		for (int i = 0; i < 4; i++) {
			msg.sensor_id = i;
			msg.tempe = rand() % 10 + 1;
			msg.baro_level = rand() % 10 + 1;

			msg.header.stamp = ros::Time::now();

			/*
			 std::stringstream ss;
			 ss << "hello world " << count;
			 msg.data = ss.str();
			 */

			//ROS_INFO("%s", msg.data.c_str());
			dummyBaropub.publish(msg);

			ros::spinOnce();

			loop_rate.sleep();
		}
	}
	return 0;
}
/*
 Header header
 int16 sensor_id
 int32 tempe
 int32 baro_level
 */

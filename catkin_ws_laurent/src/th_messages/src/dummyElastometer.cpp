#include "ros/ros.h"
#include "std_msgs/String.h"
#include "th_messages/raw_elastometer.h"

#include <sstream>

int main(int argc, char **argv) {
	ros::init(argc, argv, "dummyIMUpublisher");
	ros::NodeHandle n;
	ros::Publisher dummyElaspub = n.advertise < th_messages::raw_elastometer
			> ("raw_elastometer_teensy", 1000);

	ros::Rate loop_rate(240);
	int count = 0;
	th_messages::raw_elastometer msg;
	msg.header.frame_id = "baros";
	msg.rows = 10;
	msg.cols = 10;
	msg.p_level.resize(msg.rows * msg.cols);

	while (ros::ok()) {
		//th_messages::raw_imu msg;

		for (int i = 0; i < msg.rows; i++) {
			for (int j = 0; j < msg.cols; j++) {
				msg.p_level[i * j] = rand() % 10 + 1;
			}
		}

		msg.header.stamp = ros::Time::now();

		/*
		 std::stringstream ss;
		 ss << "hello world " << count;
		 msg.data = ss.str();
		 */

		//ROS_INFO("%s", msg.data.c_str());
		dummyElaspub.publish(msg);

		ros::spinOnce();

		loop_rate.sleep();
		++count;
	}
	return 0;
}
/*
 Header header
 uint8 rows
 uint8 cols
 uint16[] p_level
 */

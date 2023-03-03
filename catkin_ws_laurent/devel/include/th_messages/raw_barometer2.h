// Generated by gencpp from file th_messages/raw_barometer2.msg
// DO NOT EDIT!


#ifndef TH_MESSAGES_MESSAGE_RAW_BAROMETER2_H
#define TH_MESSAGES_MESSAGE_RAW_BAROMETER2_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace th_messages
{
template <class ContainerAllocator>
struct raw_barometer2_
{
  typedef raw_barometer2_<ContainerAllocator> Type;

  raw_barometer2_()
    : header()
    , tempe()
    , baro_level()  {
    }
  raw_barometer2_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , tempe(_alloc)
    , baro_level(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _tempe_type;
  _tempe_type tempe;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _baro_level_type;
  _baro_level_type baro_level;





  typedef boost::shared_ptr< ::th_messages::raw_barometer2_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::th_messages::raw_barometer2_<ContainerAllocator> const> ConstPtr;

}; // struct raw_barometer2_

typedef ::th_messages::raw_barometer2_<std::allocator<void> > raw_barometer2;

typedef boost::shared_ptr< ::th_messages::raw_barometer2 > raw_barometer2Ptr;
typedef boost::shared_ptr< ::th_messages::raw_barometer2 const> raw_barometer2ConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::th_messages::raw_barometer2_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::th_messages::raw_barometer2_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::th_messages::raw_barometer2_<ContainerAllocator1> & lhs, const ::th_messages::raw_barometer2_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.tempe == rhs.tempe &&
    lhs.baro_level == rhs.baro_level;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::th_messages::raw_barometer2_<ContainerAllocator1> & lhs, const ::th_messages::raw_barometer2_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace th_messages

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::th_messages::raw_barometer2_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::th_messages::raw_barometer2_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::th_messages::raw_barometer2_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::th_messages::raw_barometer2_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::th_messages::raw_barometer2_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::th_messages::raw_barometer2_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::th_messages::raw_barometer2_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f076f0fa677fd465f2c44b54f6890c1a";
  }

  static const char* value(const ::th_messages::raw_barometer2_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf076f0fa677fd465ULL;
  static const uint64_t static_value2 = 0xf2c44b54f6890c1aULL;
};

template<class ContainerAllocator>
struct DataType< ::th_messages::raw_barometer2_<ContainerAllocator> >
{
  static const char* value()
  {
    return "th_messages/raw_barometer2";
  }

  static const char* value(const ::th_messages::raw_barometer2_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::th_messages::raw_barometer2_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n"
"float32[] tempe\n"
"float32[] baro_level\n"
"\n"
"================================================================================\n"
"MSG: std_msgs/Header\n"
"# Standard metadata for higher-level stamped data types.\n"
"# This is generally used to communicate timestamped data \n"
"# in a particular coordinate frame.\n"
"# \n"
"# sequence ID: consecutively increasing ID \n"
"uint32 seq\n"
"#Two-integer timestamp that is expressed as:\n"
"# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n"
"# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n"
"# time-handling sugar is provided by the client library\n"
"time stamp\n"
"#Frame this data is associated with\n"
"string frame_id\n"
;
  }

  static const char* value(const ::th_messages::raw_barometer2_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::th_messages::raw_barometer2_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.tempe);
      stream.next(m.baro_level);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct raw_barometer2_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::th_messages::raw_barometer2_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::th_messages::raw_barometer2_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "tempe[]" << std::endl;
    for (size_t i = 0; i < v.tempe.size(); ++i)
    {
      s << indent << "  tempe[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.tempe[i]);
    }
    s << indent << "baro_level[]" << std::endl;
    for (size_t i = 0; i < v.baro_level.size(); ++i)
    {
      s << indent << "  baro_level[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.baro_level[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TH_MESSAGES_MESSAGE_RAW_BAROMETER2_H

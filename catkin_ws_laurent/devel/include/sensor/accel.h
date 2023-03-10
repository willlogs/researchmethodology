// Generated by gencpp from file sensor/accel.msg
// DO NOT EDIT!


#ifndef SENSOR_MESSAGE_ACCEL_H
#define SENSOR_MESSAGE_ACCEL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sensor
{
template <class ContainerAllocator>
struct accel_
{
  typedef accel_<ContainerAllocator> Type;

  accel_()
    : accel()  {
    }
  accel_(const ContainerAllocator& _alloc)
    : accel(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<double>> _accel_type;
  _accel_type accel;





  typedef boost::shared_ptr< ::sensor::accel_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sensor::accel_<ContainerAllocator> const> ConstPtr;

}; // struct accel_

typedef ::sensor::accel_<std::allocator<void> > accel;

typedef boost::shared_ptr< ::sensor::accel > accelPtr;
typedef boost::shared_ptr< ::sensor::accel const> accelConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sensor::accel_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sensor::accel_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sensor::accel_<ContainerAllocator1> & lhs, const ::sensor::accel_<ContainerAllocator2> & rhs)
{
  return lhs.accel == rhs.accel;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sensor::accel_<ContainerAllocator1> & lhs, const ::sensor::accel_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sensor

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sensor::accel_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sensor::accel_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sensor::accel_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sensor::accel_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sensor::accel_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sensor::accel_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sensor::accel_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9dcb4b52846c9069458fbfb8e5d7c530";
  }

  static const char* value(const ::sensor::accel_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9dcb4b52846c9069ULL;
  static const uint64_t static_value2 = 0x458fbfb8e5d7c530ULL;
};

template<class ContainerAllocator>
struct DataType< ::sensor::accel_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor/accel";
  }

  static const char* value(const ::sensor::accel_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sensor::accel_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] accel\n"
;
  }

  static const char* value(const ::sensor::accel_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sensor::accel_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.accel);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct accel_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sensor::accel_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sensor::accel_<ContainerAllocator>& v)
  {
    s << indent << "accel[]" << std::endl;
    for (size_t i = 0; i < v.accel.size(); ++i)
    {
      s << indent << "  accel[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.accel[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // SENSOR_MESSAGE_ACCEL_H

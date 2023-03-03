// Generated by gencpp from file bioin_tacto/bias_srvResponse.msg
// DO NOT EDIT!


#ifndef BIOIN_TACTO_MESSAGE_BIAS_SRVRESPONSE_H
#define BIOIN_TACTO_MESSAGE_BIAS_SRVRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace bioin_tacto
{
template <class ContainerAllocator>
struct bias_srvResponse_
{
  typedef bias_srvResponse_<ContainerAllocator> Type;

  bias_srvResponse_()
    : b_ax()
    , b_ay()
    , b_az()
    , b_gx()
    , b_gy()
    , b_gz()  {
    }
  bias_srvResponse_(const ContainerAllocator& _alloc)
    : b_ax(_alloc)
    , b_ay(_alloc)
    , b_az(_alloc)
    , b_gx(_alloc)
    , b_gy(_alloc)
    , b_gz(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _b_ax_type;
  _b_ax_type b_ax;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _b_ay_type;
  _b_ay_type b_ay;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _b_az_type;
  _b_az_type b_az;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _b_gx_type;
  _b_gx_type b_gx;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _b_gy_type;
  _b_gy_type b_gy;

   typedef std::vector<float, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<float>> _b_gz_type;
  _b_gz_type b_gz;





  typedef boost::shared_ptr< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> const> ConstPtr;

}; // struct bias_srvResponse_

typedef ::bioin_tacto::bias_srvResponse_<std::allocator<void> > bias_srvResponse;

typedef boost::shared_ptr< ::bioin_tacto::bias_srvResponse > bias_srvResponsePtr;
typedef boost::shared_ptr< ::bioin_tacto::bias_srvResponse const> bias_srvResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::bioin_tacto::bias_srvResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::bioin_tacto::bias_srvResponse_<ContainerAllocator1> & lhs, const ::bioin_tacto::bias_srvResponse_<ContainerAllocator2> & rhs)
{
  return lhs.b_ax == rhs.b_ax &&
    lhs.b_ay == rhs.b_ay &&
    lhs.b_az == rhs.b_az &&
    lhs.b_gx == rhs.b_gx &&
    lhs.b_gy == rhs.b_gy &&
    lhs.b_gz == rhs.b_gz;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::bioin_tacto::bias_srvResponse_<ContainerAllocator1> & lhs, const ::bioin_tacto::bias_srvResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace bioin_tacto

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2187bf05b0e439632c97738dad2eae32";
  }

  static const char* value(const ::bioin_tacto::bias_srvResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2187bf05b0e43963ULL;
  static const uint64_t static_value2 = 0x2c97738dad2eae32ULL;
};

template<class ContainerAllocator>
struct DataType< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bioin_tacto/bias_srvResponse";
  }

  static const char* value(const ::bioin_tacto::bias_srvResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32[] b_ax\n"
"float32[] b_ay\n"
"float32[] b_az\n"
"float32[] b_gx\n"
"float32[] b_gy\n"
"float32[] b_gz\n"
;
  }

  static const char* value(const ::bioin_tacto::bias_srvResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.b_ax);
      stream.next(m.b_ay);
      stream.next(m.b_az);
      stream.next(m.b_gx);
      stream.next(m.b_gy);
      stream.next(m.b_gz);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct bias_srvResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::bioin_tacto::bias_srvResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::bioin_tacto::bias_srvResponse_<ContainerAllocator>& v)
  {
    s << indent << "b_ax[]" << std::endl;
    for (size_t i = 0; i < v.b_ax.size(); ++i)
    {
      s << indent << "  b_ax[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.b_ax[i]);
    }
    s << indent << "b_ay[]" << std::endl;
    for (size_t i = 0; i < v.b_ay.size(); ++i)
    {
      s << indent << "  b_ay[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.b_ay[i]);
    }
    s << indent << "b_az[]" << std::endl;
    for (size_t i = 0; i < v.b_az.size(); ++i)
    {
      s << indent << "  b_az[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.b_az[i]);
    }
    s << indent << "b_gx[]" << std::endl;
    for (size_t i = 0; i < v.b_gx.size(); ++i)
    {
      s << indent << "  b_gx[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.b_gx[i]);
    }
    s << indent << "b_gy[]" << std::endl;
    for (size_t i = 0; i < v.b_gy.size(); ++i)
    {
      s << indent << "  b_gy[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.b_gy[i]);
    }
    s << indent << "b_gz[]" << std::endl;
    for (size_t i = 0; i < v.b_gz.size(); ++i)
    {
      s << indent << "  b_gz[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.b_gz[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // BIOIN_TACTO_MESSAGE_BIAS_SRVRESPONSE_H

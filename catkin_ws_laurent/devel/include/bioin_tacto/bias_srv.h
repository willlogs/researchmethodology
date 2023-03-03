// Generated by gencpp from file bioin_tacto/bias_srv.msg
// DO NOT EDIT!


#ifndef BIOIN_TACTO_MESSAGE_BIAS_SRV_H
#define BIOIN_TACTO_MESSAGE_BIAS_SRV_H

#include <ros/service_traits.h>


#include <bioin_tacto/bias_srvRequest.h>
#include <bioin_tacto/bias_srvResponse.h>


namespace bioin_tacto
{

struct bias_srv
{

typedef bias_srvRequest Request;
typedef bias_srvResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct bias_srv
} // namespace bioin_tacto


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::bioin_tacto::bias_srv > {
  static const char* value()
  {
    return "0d0a8123fd19891ee9460281609e26cf";
  }

  static const char* value(const ::bioin_tacto::bias_srv&) { return value(); }
};

template<>
struct DataType< ::bioin_tacto::bias_srv > {
  static const char* value()
  {
    return "bioin_tacto/bias_srv";
  }

  static const char* value(const ::bioin_tacto::bias_srv&) { return value(); }
};


// service_traits::MD5Sum< ::bioin_tacto::bias_srvRequest> should match
// service_traits::MD5Sum< ::bioin_tacto::bias_srv >
template<>
struct MD5Sum< ::bioin_tacto::bias_srvRequest>
{
  static const char* value()
  {
    return MD5Sum< ::bioin_tacto::bias_srv >::value();
  }
  static const char* value(const ::bioin_tacto::bias_srvRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::bioin_tacto::bias_srvRequest> should match
// service_traits::DataType< ::bioin_tacto::bias_srv >
template<>
struct DataType< ::bioin_tacto::bias_srvRequest>
{
  static const char* value()
  {
    return DataType< ::bioin_tacto::bias_srv >::value();
  }
  static const char* value(const ::bioin_tacto::bias_srvRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::bioin_tacto::bias_srvResponse> should match
// service_traits::MD5Sum< ::bioin_tacto::bias_srv >
template<>
struct MD5Sum< ::bioin_tacto::bias_srvResponse>
{
  static const char* value()
  {
    return MD5Sum< ::bioin_tacto::bias_srv >::value();
  }
  static const char* value(const ::bioin_tacto::bias_srvResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::bioin_tacto::bias_srvResponse> should match
// service_traits::DataType< ::bioin_tacto::bias_srv >
template<>
struct DataType< ::bioin_tacto::bias_srvResponse>
{
  static const char* value()
  {
    return DataType< ::bioin_tacto::bias_srv >::value();
  }
  static const char* value(const ::bioin_tacto::bias_srvResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BIOIN_TACTO_MESSAGE_BIAS_SRV_H
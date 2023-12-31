// Generated by gencpp from file your_package/idResponse.msg
// DO NOT EDIT!


#ifndef YOUR_PACKAGE_MESSAGE_IDRESPONSE_H
#define YOUR_PACKAGE_MESSAGE_IDRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace your_package
{
template <class ContainerAllocator>
struct idResponse_
{
  typedef idResponse_<ContainerAllocator> Type;

  idResponse_()
    : student_id()  {
    }
  idResponse_(const ContainerAllocator& _alloc)
    : student_id(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _student_id_type;
  _student_id_type student_id;





  typedef boost::shared_ptr< ::your_package::idResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::your_package::idResponse_<ContainerAllocator> const> ConstPtr;

}; // struct idResponse_

typedef ::your_package::idResponse_<std::allocator<void> > idResponse;

typedef boost::shared_ptr< ::your_package::idResponse > idResponsePtr;
typedef boost::shared_ptr< ::your_package::idResponse const> idResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::your_package::idResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::your_package::idResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::your_package::idResponse_<ContainerAllocator1> & lhs, const ::your_package::idResponse_<ContainerAllocator2> & rhs)
{
  return lhs.student_id == rhs.student_id;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::your_package::idResponse_<ContainerAllocator1> & lhs, const ::your_package::idResponse_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace your_package

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::your_package::idResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::your_package::idResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::your_package::idResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::your_package::idResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::your_package::idResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::your_package::idResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::your_package::idResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "372af5010cb802275110c9bd017544b8";
  }

  static const char* value(const ::your_package::idResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x372af5010cb80227ULL;
  static const uint64_t static_value2 = 0x5110c9bd017544b8ULL;
};

template<class ContainerAllocator>
struct DataType< ::your_package::idResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "your_package/idResponse";
  }

  static const char* value(const ::your_package::idResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::your_package::idResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string student_id\n"
"\n"
;
  }

  static const char* value(const ::your_package::idResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::your_package::idResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.student_id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct idResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::your_package::idResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::your_package::idResponse_<ContainerAllocator>& v)
  {
    s << indent << "student_id: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.student_id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // YOUR_PACKAGE_MESSAGE_IDRESPONSE_H

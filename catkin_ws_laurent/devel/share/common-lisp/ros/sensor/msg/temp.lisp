; Auto-generated. Do not edit!


(cl:in-package sensor-msg)


;//! \htmlinclude temp.msg.html

(cl:defclass <temp> (roslisp-msg-protocol:ros-message)
  ((temp
    :reader temp
    :initarg :temp
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass temp (<temp>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <temp>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'temp)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor-msg:<temp> is deprecated: use sensor-msg:temp instead.")))

(cl:ensure-generic-function 'temp-val :lambda-list '(m))
(cl:defmethod temp-val ((m <temp>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:temp-val is deprecated.  Use sensor-msg:temp instead.")
  (temp m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <temp>) ostream)
  "Serializes a message object of type '<temp>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'temp))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'temp))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <temp>) istream)
  "Deserializes a message object of type '<temp>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'temp) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'temp)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<temp>)))
  "Returns string type for a message object of type '<temp>"
  "sensor/temp")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'temp)))
  "Returns string type for a message object of type 'temp"
  "sensor/temp")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<temp>)))
  "Returns md5sum for a message object of type '<temp>"
  "5369666b54d681f4247009dedc80d817")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'temp)))
  "Returns md5sum for a message object of type 'temp"
  "5369666b54d681f4247009dedc80d817")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<temp>)))
  "Returns full string definition for message of type '<temp>"
  (cl:format cl:nil "float64[] temp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'temp)))
  "Returns full string definition for message of type 'temp"
  (cl:format cl:nil "float64[] temp~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <temp>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'temp) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <temp>))
  "Converts a ROS message object to a list"
  (cl:list 'temp
    (cl:cons ':temp (temp msg))
))

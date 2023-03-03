; Auto-generated. Do not edit!


(cl:in-package sensor-msg)


;//! \htmlinclude accel.msg.html

(cl:defclass <accel> (roslisp-msg-protocol:ros-message)
  ((accel
    :reader accel
    :initarg :accel
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass accel (<accel>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <accel>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'accel)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor-msg:<accel> is deprecated: use sensor-msg:accel instead.")))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <accel>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:accel-val is deprecated.  Use sensor-msg:accel instead.")
  (accel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <accel>) ostream)
  "Serializes a message object of type '<accel>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'accel))))
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
   (cl:slot-value msg 'accel))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <accel>) istream)
  "Deserializes a message object of type '<accel>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'accel) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'accel)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<accel>)))
  "Returns string type for a message object of type '<accel>"
  "sensor/accel")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'accel)))
  "Returns string type for a message object of type 'accel"
  "sensor/accel")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<accel>)))
  "Returns md5sum for a message object of type '<accel>"
  "9dcb4b52846c9069458fbfb8e5d7c530")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'accel)))
  "Returns md5sum for a message object of type 'accel"
  "9dcb4b52846c9069458fbfb8e5d7c530")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<accel>)))
  "Returns full string definition for message of type '<accel>"
  (cl:format cl:nil "float64[] accel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'accel)))
  "Returns full string definition for message of type 'accel"
  (cl:format cl:nil "float64[] accel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <accel>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'accel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <accel>))
  "Converts a ROS message object to a list"
  (cl:list 'accel
    (cl:cons ':accel (accel msg))
))

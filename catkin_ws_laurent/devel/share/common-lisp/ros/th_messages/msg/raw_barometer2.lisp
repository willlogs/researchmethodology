; Auto-generated. Do not edit!


(cl:in-package th_messages-msg)


;//! \htmlinclude raw_barometer2.msg.html

(cl:defclass <raw_barometer2> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (tempe
    :reader tempe
    :initarg :tempe
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (baro_level
    :reader baro_level
    :initarg :baro_level
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass raw_barometer2 (<raw_barometer2>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <raw_barometer2>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'raw_barometer2)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name th_messages-msg:<raw_barometer2> is deprecated: use th_messages-msg:raw_barometer2 instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <raw_barometer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader th_messages-msg:header-val is deprecated.  Use th_messages-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'tempe-val :lambda-list '(m))
(cl:defmethod tempe-val ((m <raw_barometer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader th_messages-msg:tempe-val is deprecated.  Use th_messages-msg:tempe instead.")
  (tempe m))

(cl:ensure-generic-function 'baro_level-val :lambda-list '(m))
(cl:defmethod baro_level-val ((m <raw_barometer2>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader th_messages-msg:baro_level-val is deprecated.  Use th_messages-msg:baro_level instead.")
  (baro_level m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <raw_barometer2>) ostream)
  "Serializes a message object of type '<raw_barometer2>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'tempe))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'tempe))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'baro_level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'baro_level))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <raw_barometer2>) istream)
  "Deserializes a message object of type '<raw_barometer2>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'tempe) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'tempe)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'baro_level) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'baro_level)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<raw_barometer2>)))
  "Returns string type for a message object of type '<raw_barometer2>"
  "th_messages/raw_barometer2")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'raw_barometer2)))
  "Returns string type for a message object of type 'raw_barometer2"
  "th_messages/raw_barometer2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<raw_barometer2>)))
  "Returns md5sum for a message object of type '<raw_barometer2>"
  "f076f0fa677fd465f2c44b54f6890c1a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'raw_barometer2)))
  "Returns md5sum for a message object of type 'raw_barometer2"
  "f076f0fa677fd465f2c44b54f6890c1a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<raw_barometer2>)))
  "Returns full string definition for message of type '<raw_barometer2>"
  (cl:format cl:nil "Header header~%float32[] tempe~%float32[] baro_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'raw_barometer2)))
  "Returns full string definition for message of type 'raw_barometer2"
  (cl:format cl:nil "Header header~%float32[] tempe~%float32[] baro_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <raw_barometer2>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'tempe) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'baro_level) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <raw_barometer2>))
  "Converts a ROS message object to a list"
  (cl:list 'raw_barometer2
    (cl:cons ':header (header msg))
    (cl:cons ':tempe (tempe msg))
    (cl:cons ':baro_level (baro_level msg))
))

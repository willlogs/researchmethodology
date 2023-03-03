; Auto-generated. Do not edit!


(cl:in-package th_messages-msg)


;//! \htmlinclude raw_elastometer.msg.html

(cl:defclass <raw_elastometer> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (rows
    :reader rows
    :initarg :rows
    :type cl:fixnum
    :initform 0)
   (cols
    :reader cols
    :initarg :cols
    :type cl:fixnum
    :initform 0)
   (p_level
    :reader p_level
    :initarg :p_level
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass raw_elastometer (<raw_elastometer>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <raw_elastometer>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'raw_elastometer)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name th_messages-msg:<raw_elastometer> is deprecated: use th_messages-msg:raw_elastometer instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <raw_elastometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader th_messages-msg:header-val is deprecated.  Use th_messages-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'rows-val :lambda-list '(m))
(cl:defmethod rows-val ((m <raw_elastometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader th_messages-msg:rows-val is deprecated.  Use th_messages-msg:rows instead.")
  (rows m))

(cl:ensure-generic-function 'cols-val :lambda-list '(m))
(cl:defmethod cols-val ((m <raw_elastometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader th_messages-msg:cols-val is deprecated.  Use th_messages-msg:cols instead.")
  (cols m))

(cl:ensure-generic-function 'p_level-val :lambda-list '(m))
(cl:defmethod p_level-val ((m <raw_elastometer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader th_messages-msg:p_level-val is deprecated.  Use th_messages-msg:p_level instead.")
  (p_level m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <raw_elastometer>) ostream)
  "Serializes a message object of type '<raw_elastometer>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rows)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cols)) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'p_level))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'p_level))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <raw_elastometer>) istream)
  "Deserializes a message object of type '<raw_elastometer>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rows)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'cols)) (cl:read-byte istream))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'p_level) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'p_level)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<raw_elastometer>)))
  "Returns string type for a message object of type '<raw_elastometer>"
  "th_messages/raw_elastometer")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'raw_elastometer)))
  "Returns string type for a message object of type 'raw_elastometer"
  "th_messages/raw_elastometer")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<raw_elastometer>)))
  "Returns md5sum for a message object of type '<raw_elastometer>"
  "a25a3ba9a447cce9b672c660d7b15412")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'raw_elastometer)))
  "Returns md5sum for a message object of type 'raw_elastometer"
  "a25a3ba9a447cce9b672c660d7b15412")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<raw_elastometer>)))
  "Returns full string definition for message of type '<raw_elastometer>"
  (cl:format cl:nil "Header header~%uint8 rows~%uint8 cols~%uint32[] p_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'raw_elastometer)))
  "Returns full string definition for message of type 'raw_elastometer"
  (cl:format cl:nil "Header header~%uint8 rows~%uint8 cols~%uint32[] p_level~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <raw_elastometer>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     1
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'p_level) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <raw_elastometer>))
  "Converts a ROS message object to a list"
  (cl:list 'raw_elastometer
    (cl:cons ':header (header msg))
    (cl:cons ':rows (rows msg))
    (cl:cons ':cols (cols msg))
    (cl:cons ':p_level (p_level msg))
))

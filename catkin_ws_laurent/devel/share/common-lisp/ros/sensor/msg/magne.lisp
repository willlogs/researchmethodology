; Auto-generated. Do not edit!


(cl:in-package sensor-msg)


;//! \htmlinclude magne.msg.html

(cl:defclass <magne> (roslisp-msg-protocol:ros-message)
  ((magne
    :reader magne
    :initarg :magne
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass magne (<magne>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <magne>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'magne)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sensor-msg:<magne> is deprecated: use sensor-msg:magne instead.")))

(cl:ensure-generic-function 'magne-val :lambda-list '(m))
(cl:defmethod magne-val ((m <magne>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sensor-msg:magne-val is deprecated.  Use sensor-msg:magne instead.")
  (magne m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <magne>) ostream)
  "Serializes a message object of type '<magne>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'magne))))
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
   (cl:slot-value msg 'magne))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <magne>) istream)
  "Deserializes a message object of type '<magne>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'magne) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'magne)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<magne>)))
  "Returns string type for a message object of type '<magne>"
  "sensor/magne")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'magne)))
  "Returns string type for a message object of type 'magne"
  "sensor/magne")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<magne>)))
  "Returns md5sum for a message object of type '<magne>"
  "2ad17479b92c9ce002f096e7afd3ccab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'magne)))
  "Returns md5sum for a message object of type 'magne"
  "2ad17479b92c9ce002f096e7afd3ccab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<magne>)))
  "Returns full string definition for message of type '<magne>"
  (cl:format cl:nil "float64[] magne~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'magne)))
  "Returns full string definition for message of type 'magne"
  (cl:format cl:nil "float64[] magne~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <magne>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'magne) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <magne>))
  "Converts a ROS message object to a list"
  (cl:list 'magne
    (cl:cons ':magne (magne msg))
))

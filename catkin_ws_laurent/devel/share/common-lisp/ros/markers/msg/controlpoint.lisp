; Auto-generated. Do not edit!


(cl:in-package markers-msg)


;//! \htmlinclude controlpoint.msg.html

(cl:defclass <controlpoint> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (normal
    :reader normal
    :initarg :normal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass controlpoint (<controlpoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <controlpoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'controlpoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name markers-msg:<controlpoint> is deprecated: use markers-msg:controlpoint instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <controlpoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader markers-msg:point-val is deprecated.  Use markers-msg:point instead.")
  (point m))

(cl:ensure-generic-function 'normal-val :lambda-list '(m))
(cl:defmethod normal-val ((m <controlpoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader markers-msg:normal-val is deprecated.  Use markers-msg:normal instead.")
  (normal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <controlpoint>) ostream)
  "Serializes a message object of type '<controlpoint>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'point))))
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
   (cl:slot-value msg 'point))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'normal))))
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
   (cl:slot-value msg 'normal))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <controlpoint>) istream)
  "Deserializes a message object of type '<controlpoint>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'point) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'point)))
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'normal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'normal)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<controlpoint>)))
  "Returns string type for a message object of type '<controlpoint>"
  "markers/controlpoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'controlpoint)))
  "Returns string type for a message object of type 'controlpoint"
  "markers/controlpoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<controlpoint>)))
  "Returns md5sum for a message object of type '<controlpoint>"
  "17a4dbdec115e427a96101ad4aea3f0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'controlpoint)))
  "Returns md5sum for a message object of type 'controlpoint"
  "17a4dbdec115e427a96101ad4aea3f0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<controlpoint>)))
  "Returns full string definition for message of type '<controlpoint>"
  (cl:format cl:nil "float64[] point~%float64[] normal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'controlpoint)))
  "Returns full string definition for message of type 'controlpoint"
  (cl:format cl:nil "float64[] point~%float64[] normal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <controlpoint>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'point) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'normal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <controlpoint>))
  "Converts a ROS message object to a list"
  (cl:list 'controlpoint
    (cl:cons ':point (point msg))
    (cl:cons ':normal (normal msg))
))

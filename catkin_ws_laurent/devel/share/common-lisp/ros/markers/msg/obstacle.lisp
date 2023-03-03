; Auto-generated. Do not edit!


(cl:in-package markers-msg)


;//! \htmlinclude obstacle.msg.html

(cl:defclass <obstacle> (roslisp-msg-protocol:ros-message)
  ((obstacle
    :reader obstacle
    :initarg :obstacle
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass obstacle (<obstacle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <obstacle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'obstacle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name markers-msg:<obstacle> is deprecated: use markers-msg:obstacle instead.")))

(cl:ensure-generic-function 'obstacle-val :lambda-list '(m))
(cl:defmethod obstacle-val ((m <obstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader markers-msg:obstacle-val is deprecated.  Use markers-msg:obstacle instead.")
  (obstacle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <obstacle>) ostream)
  "Serializes a message object of type '<obstacle>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'obstacle) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <obstacle>) istream)
  "Deserializes a message object of type '<obstacle>"
    (cl:setf (cl:slot-value msg 'obstacle) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<obstacle>)))
  "Returns string type for a message object of type '<obstacle>"
  "markers/obstacle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'obstacle)))
  "Returns string type for a message object of type 'obstacle"
  "markers/obstacle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<obstacle>)))
  "Returns md5sum for a message object of type '<obstacle>"
  "8e3182e1a5a09586299e547868ccbb8a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'obstacle)))
  "Returns md5sum for a message object of type 'obstacle"
  "8e3182e1a5a09586299e547868ccbb8a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<obstacle>)))
  "Returns full string definition for message of type '<obstacle>"
  (cl:format cl:nil "bool obstacle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'obstacle)))
  "Returns full string definition for message of type 'obstacle"
  (cl:format cl:nil "bool obstacle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <obstacle>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <obstacle>))
  "Converts a ROS message object to a list"
  (cl:list 'obstacle
    (cl:cons ':obstacle (obstacle msg))
))

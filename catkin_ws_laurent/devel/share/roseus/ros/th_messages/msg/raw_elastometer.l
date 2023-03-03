;; Auto-generated. Do not edit!


(when (boundp 'th_messages::raw_elastometer)
  (if (not (find-package "TH_MESSAGES"))
    (make-package "TH_MESSAGES"))
  (shadow 'raw_elastometer (find-package "TH_MESSAGES")))
(unless (find-package "TH_MESSAGES::RAW_ELASTOMETER")
  (make-package "TH_MESSAGES::RAW_ELASTOMETER"))

(in-package "ROS")
;;//! \htmlinclude raw_elastometer.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass th_messages::raw_elastometer
  :super ros::object
  :slots (_header _rows _cols _p_level ))

(defmethod th_messages::raw_elastometer
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:rows __rows) 0)
    ((:cols __cols) 0)
    ((:p_level __p_level) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _header __header)
   (setq _rows (round __rows))
   (setq _cols (round __cols))
   (setq _p_level __p_level)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:rows
   (&optional __rows)
   (if __rows (setq _rows __rows)) _rows)
  (:cols
   (&optional __cols)
   (if __cols (setq _cols __cols)) _cols)
  (:p_level
   (&optional __p_level)
   (if __p_level (setq _p_level __p_level)) _p_level)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint8 _rows
    1
    ;; uint8 _cols
    1
    ;; uint32[] _p_level
    (* 4    (length _p_level)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint8 _rows
       (write-byte _rows s)
     ;; uint8 _cols
       (write-byte _cols s)
     ;; uint32[] _p_level
     (write-long (length _p_level) s)
     (dotimes (i (length _p_level))
       (write-long (elt _p_level i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint8 _rows
     (setq _rows (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _cols
     (setq _cols (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint32[] _p_level
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _p_level (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _p_level i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get th_messages::raw_elastometer :md5sum-) "a25a3ba9a447cce9b672c660d7b15412")
(setf (get th_messages::raw_elastometer :datatype-) "th_messages/raw_elastometer")
(setf (get th_messages::raw_elastometer :definition-)
      "Header header
uint8 rows
uint8 cols
uint32[] p_level

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :th_messages/raw_elastometer "a25a3ba9a447cce9b672c660d7b15412")



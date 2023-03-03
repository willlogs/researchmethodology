;; Auto-generated. Do not edit!


(when (boundp 'th_messages::raw_barometer2)
  (if (not (find-package "TH_MESSAGES"))
    (make-package "TH_MESSAGES"))
  (shadow 'raw_barometer2 (find-package "TH_MESSAGES")))
(unless (find-package "TH_MESSAGES::RAW_BAROMETER2")
  (make-package "TH_MESSAGES::RAW_BAROMETER2"))

(in-package "ROS")
;;//! \htmlinclude raw_barometer2.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass th_messages::raw_barometer2
  :super ros::object
  :slots (_header _tempe _baro_level ))

(defmethod th_messages::raw_barometer2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tempe __tempe) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:baro_level __baro_level) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _tempe __tempe)
   (setq _baro_level __baro_level)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:tempe
   (&optional __tempe)
   (if __tempe (setq _tempe __tempe)) _tempe)
  (:baro_level
   (&optional __baro_level)
   (if __baro_level (setq _baro_level __baro_level)) _baro_level)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _tempe
    (* 4    (length _tempe)) 4
    ;; float32[] _baro_level
    (* 4    (length _baro_level)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32[] _tempe
     (write-long (length _tempe) s)
     (dotimes (i (length _tempe))
       (sys::poke (elt _tempe i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _baro_level
     (write-long (length _baro_level) s)
     (dotimes (i (length _baro_level))
       (sys::poke (elt _baro_level i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32[] _tempe
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _tempe (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _tempe i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _baro_level
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _baro_level (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _baro_level i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get th_messages::raw_barometer2 :md5sum-) "f076f0fa677fd465f2c44b54f6890c1a")
(setf (get th_messages::raw_barometer2 :datatype-) "th_messages/raw_barometer2")
(setf (get th_messages::raw_barometer2 :definition-)
      "Header header
float32[] tempe
float32[] baro_level

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



(provide :th_messages/raw_barometer2 "f076f0fa677fd465f2c44b54f6890c1a")



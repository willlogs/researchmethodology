;; Auto-generated. Do not edit!


(when (boundp 'th_messages::raw_imu2)
  (if (not (find-package "TH_MESSAGES"))
    (make-package "TH_MESSAGES"))
  (shadow 'raw_imu2 (find-package "TH_MESSAGES")))
(unless (find-package "TH_MESSAGES::RAW_IMU2")
  (make-package "TH_MESSAGES::RAW_IMU2"))

(in-package "ROS")
;;//! \htmlinclude raw_imu2.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass th_messages::raw_imu2
  :super ros::object
  :slots (_header _tempe _ax _ay _az _gx _gy _gz _mx _my _mz ))

(defmethod th_messages::raw_imu2
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:tempe __tempe) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ax __ax) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:ay __ay) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:az __az) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:gx __gx) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:gy __gy) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:gz __gz) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:mx __mx) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:my __my) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:mz __mz) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _tempe __tempe)
   (setq _ax __ax)
   (setq _ay __ay)
   (setq _az __az)
   (setq _gx __gx)
   (setq _gy __gy)
   (setq _gz __gz)
   (setq _mx __mx)
   (setq _my __my)
   (setq _mz __mz)
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
  (:ax
   (&optional __ax)
   (if __ax (setq _ax __ax)) _ax)
  (:ay
   (&optional __ay)
   (if __ay (setq _ay __ay)) _ay)
  (:az
   (&optional __az)
   (if __az (setq _az __az)) _az)
  (:gx
   (&optional __gx)
   (if __gx (setq _gx __gx)) _gx)
  (:gy
   (&optional __gy)
   (if __gy (setq _gy __gy)) _gy)
  (:gz
   (&optional __gz)
   (if __gz (setq _gz __gz)) _gz)
  (:mx
   (&optional __mx)
   (if __mx (setq _mx __mx)) _mx)
  (:my
   (&optional __my)
   (if __my (setq _my __my)) _my)
  (:mz
   (&optional __mz)
   (if __mz (setq _mz __mz)) _mz)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32[] _tempe
    (* 4    (length _tempe)) 4
    ;; float32[] _ax
    (* 4    (length _ax)) 4
    ;; float32[] _ay
    (* 4    (length _ay)) 4
    ;; float32[] _az
    (* 4    (length _az)) 4
    ;; float32[] _gx
    (* 4    (length _gx)) 4
    ;; float32[] _gy
    (* 4    (length _gy)) 4
    ;; float32[] _gz
    (* 4    (length _gz)) 4
    ;; float32[] _mx
    (* 4    (length _mx)) 4
    ;; float32[] _my
    (* 4    (length _my)) 4
    ;; float32[] _mz
    (* 4    (length _mz)) 4
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
     ;; float32[] _ax
     (write-long (length _ax) s)
     (dotimes (i (length _ax))
       (sys::poke (elt _ax i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _ay
     (write-long (length _ay) s)
     (dotimes (i (length _ay))
       (sys::poke (elt _ay i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _az
     (write-long (length _az) s)
     (dotimes (i (length _az))
       (sys::poke (elt _az i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _gx
     (write-long (length _gx) s)
     (dotimes (i (length _gx))
       (sys::poke (elt _gx i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _gy
     (write-long (length _gy) s)
     (dotimes (i (length _gy))
       (sys::poke (elt _gy i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _gz
     (write-long (length _gz) s)
     (dotimes (i (length _gz))
       (sys::poke (elt _gz i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _mx
     (write-long (length _mx) s)
     (dotimes (i (length _mx))
       (sys::poke (elt _mx i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _my
     (write-long (length _my) s)
     (dotimes (i (length _my))
       (sys::poke (elt _my i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _mz
     (write-long (length _mz) s)
     (dotimes (i (length _mz))
       (sys::poke (elt _mz i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32[] _ax
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ax (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ax i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _ay
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ay (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ay i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _az
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _az (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _az i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _gx
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gx (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gx i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _gy
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gy (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gy i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _gz
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gz (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gz i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _mx
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mx (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _mx i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _my
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _my (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _my i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _mz
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _mz (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _mz i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get th_messages::raw_imu2 :md5sum-) "7fea683002c52f4a1ffae2fd1a0e778f")
(setf (get th_messages::raw_imu2 :datatype-) "th_messages/raw_imu2")
(setf (get th_messages::raw_imu2 :definition-)
      "Header header
float32[] tempe
float32[] ax
float32[] ay
float32[] az
float32[] gx
float32[] gy
float32[] gz
float32[] mx
float32[] my
float32[] mz

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



(provide :th_messages/raw_imu2 "7fea683002c52f4a1ffae2fd1a0e778f")



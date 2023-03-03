;; Auto-generated. Do not edit!


(when (boundp 'sensor::gyro)
  (if (not (find-package "SENSOR"))
    (make-package "SENSOR"))
  (shadow 'gyro (find-package "SENSOR")))
(unless (find-package "SENSOR::GYRO")
  (make-package "SENSOR::GYRO"))

(in-package "ROS")
;;//! \htmlinclude gyro.msg.html


(defclass sensor::gyro
  :super ros::object
  :slots (_gyro ))

(defmethod sensor::gyro
  (:init
   (&key
    ((:gyro __gyro) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _gyro __gyro)
   self)
  (:gyro
   (&optional __gyro)
   (if __gyro (setq _gyro __gyro)) _gyro)
  (:serialization-length
   ()
   (+
    ;; float64[] _gyro
    (* 8    (length _gyro)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _gyro
     (write-long (length _gyro) s)
     (dotimes (i (length _gyro))
       (sys::poke (elt _gyro i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _gyro
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _gyro (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _gyro i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get sensor::gyro :md5sum-) "e30554e43a74429ffbf966ec16995406")
(setf (get sensor::gyro :datatype-) "sensor/gyro")
(setf (get sensor::gyro :definition-)
      "float64[] gyro

")



(provide :sensor/gyro "e30554e43a74429ffbf966ec16995406")



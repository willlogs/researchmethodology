;; Auto-generated. Do not edit!


(when (boundp 'sensor::temp)
  (if (not (find-package "SENSOR"))
    (make-package "SENSOR"))
  (shadow 'temp (find-package "SENSOR")))
(unless (find-package "SENSOR::TEMP")
  (make-package "SENSOR::TEMP"))

(in-package "ROS")
;;//! \htmlinclude temp.msg.html


(defclass sensor::temp
  :super ros::object
  :slots (_temp ))

(defmethod sensor::temp
  (:init
   (&key
    ((:temp __temp) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _temp __temp)
   self)
  (:temp
   (&optional __temp)
   (if __temp (setq _temp __temp)) _temp)
  (:serialization-length
   ()
   (+
    ;; float64[] _temp
    (* 8    (length _temp)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _temp
     (write-long (length _temp) s)
     (dotimes (i (length _temp))
       (sys::poke (elt _temp i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _temp
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _temp (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _temp i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get sensor::temp :md5sum-) "5369666b54d681f4247009dedc80d817")
(setf (get sensor::temp :datatype-) "sensor/temp")
(setf (get sensor::temp :definition-)
      "float64[] temp

")



(provide :sensor/temp "5369666b54d681f4247009dedc80d817")



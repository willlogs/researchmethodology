;; Auto-generated. Do not edit!


(when (boundp 'sensor::accel)
  (if (not (find-package "SENSOR"))
    (make-package "SENSOR"))
  (shadow 'accel (find-package "SENSOR")))
(unless (find-package "SENSOR::ACCEL")
  (make-package "SENSOR::ACCEL"))

(in-package "ROS")
;;//! \htmlinclude accel.msg.html


(defclass sensor::accel
  :super ros::object
  :slots (_accel ))

(defmethod sensor::accel
  (:init
   (&key
    ((:accel __accel) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _accel __accel)
   self)
  (:accel
   (&optional __accel)
   (if __accel (setq _accel __accel)) _accel)
  (:serialization-length
   ()
   (+
    ;; float64[] _accel
    (* 8    (length _accel)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _accel
     (write-long (length _accel) s)
     (dotimes (i (length _accel))
       (sys::poke (elt _accel i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _accel
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _accel (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _accel i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get sensor::accel :md5sum-) "9dcb4b52846c9069458fbfb8e5d7c530")
(setf (get sensor::accel :datatype-) "sensor/accel")
(setf (get sensor::accel :definition-)
      "float64[] accel

")



(provide :sensor/accel "9dcb4b52846c9069458fbfb8e5d7c530")



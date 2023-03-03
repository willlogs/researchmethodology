;; Auto-generated. Do not edit!


(when (boundp 'sensor::magne)
  (if (not (find-package "SENSOR"))
    (make-package "SENSOR"))
  (shadow 'magne (find-package "SENSOR")))
(unless (find-package "SENSOR::MAGNE")
  (make-package "SENSOR::MAGNE"))

(in-package "ROS")
;;//! \htmlinclude magne.msg.html


(defclass sensor::magne
  :super ros::object
  :slots (_magne ))

(defmethod sensor::magne
  (:init
   (&key
    ((:magne __magne) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _magne __magne)
   self)
  (:magne
   (&optional __magne)
   (if __magne (setq _magne __magne)) _magne)
  (:serialization-length
   ()
   (+
    ;; float64[] _magne
    (* 8    (length _magne)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _magne
     (write-long (length _magne) s)
     (dotimes (i (length _magne))
       (sys::poke (elt _magne i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _magne
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _magne (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _magne i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get sensor::magne :md5sum-) "2ad17479b92c9ce002f096e7afd3ccab")
(setf (get sensor::magne :datatype-) "sensor/magne")
(setf (get sensor::magne :definition-)
      "float64[] magne

")



(provide :sensor/magne "2ad17479b92c9ce002f096e7afd3ccab")



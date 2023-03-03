;; Auto-generated. Do not edit!


(when (boundp 'markers::controlpoint)
  (if (not (find-package "MARKERS"))
    (make-package "MARKERS"))
  (shadow 'controlpoint (find-package "MARKERS")))
(unless (find-package "MARKERS::CONTROLPOINT")
  (make-package "MARKERS::CONTROLPOINT"))

(in-package "ROS")
;;//! \htmlinclude controlpoint.msg.html


(defclass markers::controlpoint
  :super ros::object
  :slots (_point _normal ))

(defmethod markers::controlpoint
  (:init
   (&key
    ((:point __point) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:normal __normal) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _point __point)
   (setq _normal __normal)
   self)
  (:point
   (&optional __point)
   (if __point (setq _point __point)) _point)
  (:normal
   (&optional __normal)
   (if __normal (setq _normal __normal)) _normal)
  (:serialization-length
   ()
   (+
    ;; float64[] _point
    (* 8    (length _point)) 4
    ;; float64[] _normal
    (* 8    (length _normal)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _point
     (write-long (length _point) s)
     (dotimes (i (length _point))
       (sys::poke (elt _point i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _normal
     (write-long (length _normal) s)
     (dotimes (i (length _normal))
       (sys::poke (elt _normal i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _point
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _point (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _point i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _normal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _normal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _normal i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get markers::controlpoint :md5sum-) "17a4dbdec115e427a96101ad4aea3f0b")
(setf (get markers::controlpoint :datatype-) "markers/controlpoint")
(setf (get markers::controlpoint :definition-)
      "float64[] point
float64[] normal

")



(provide :markers/controlpoint "17a4dbdec115e427a96101ad4aea3f0b")



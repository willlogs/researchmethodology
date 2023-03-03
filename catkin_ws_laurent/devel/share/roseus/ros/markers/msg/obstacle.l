;; Auto-generated. Do not edit!


(when (boundp 'markers::obstacle)
  (if (not (find-package "MARKERS"))
    (make-package "MARKERS"))
  (shadow 'obstacle (find-package "MARKERS")))
(unless (find-package "MARKERS::OBSTACLE")
  (make-package "MARKERS::OBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude obstacle.msg.html


(defclass markers::obstacle
  :super ros::object
  :slots (_obstacle ))

(defmethod markers::obstacle
  (:init
   (&key
    ((:obstacle __obstacle) nil)
    )
   (send-super :init)
   (setq _obstacle __obstacle)
   self)
  (:obstacle
   (&optional (__obstacle :null))
   (if (not (eq __obstacle :null)) (setq _obstacle __obstacle)) _obstacle)
  (:serialization-length
   ()
   (+
    ;; bool _obstacle
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _obstacle
       (if _obstacle (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _obstacle
     (setq _obstacle (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get markers::obstacle :md5sum-) "8e3182e1a5a09586299e547868ccbb8a")
(setf (get markers::obstacle :datatype-) "markers/obstacle")
(setf (get markers::obstacle :definition-)
      "bool obstacle

")



(provide :markers/obstacle "8e3182e1a5a09586299e547868ccbb8a")



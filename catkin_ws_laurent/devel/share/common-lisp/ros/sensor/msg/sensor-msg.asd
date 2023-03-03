
(cl:in-package :asdf)

(defsystem "sensor-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "accel" :depends-on ("_package_accel"))
    (:file "_package_accel" :depends-on ("_package"))
    (:file "gyro" :depends-on ("_package_gyro"))
    (:file "_package_gyro" :depends-on ("_package"))
    (:file "magne" :depends-on ("_package_magne"))
    (:file "_package_magne" :depends-on ("_package"))
    (:file "temp" :depends-on ("_package_temp"))
    (:file "_package_temp" :depends-on ("_package"))
  ))
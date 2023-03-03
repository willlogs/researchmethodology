
(cl:in-package :asdf)

(defsystem "markers-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "controlpoint" :depends-on ("_package_controlpoint"))
    (:file "_package_controlpoint" :depends-on ("_package"))
    (:file "obstacle" :depends-on ("_package_obstacle"))
    (:file "_package_obstacle" :depends-on ("_package"))
  ))
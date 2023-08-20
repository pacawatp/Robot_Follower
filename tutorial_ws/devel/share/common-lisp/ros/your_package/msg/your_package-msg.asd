
(cl:in-package :asdf)

(defsystem "your_package-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Data" :depends-on ("_package_Data"))
    (:file "_package_Data" :depends-on ("_package"))
  ))
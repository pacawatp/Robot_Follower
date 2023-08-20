
(cl:in-package :asdf)

(defsystem "your_package-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Id" :depends-on ("_package_Id"))
    (:file "_package_Id" :depends-on ("_package"))
    (:file "Sum" :depends-on ("_package_Sum"))
    (:file "_package_Sum" :depends-on ("_package"))
    (:file "id" :depends-on ("_package_id"))
    (:file "_package_id" :depends-on ("_package"))
  ))
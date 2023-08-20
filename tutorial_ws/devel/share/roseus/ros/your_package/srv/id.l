;; Auto-generated. Do not edit!


(when (boundp 'your_package::id)
  (if (not (find-package "YOUR_PACKAGE"))
    (make-package "YOUR_PACKAGE"))
  (shadow 'id (find-package "YOUR_PACKAGE")))
(unless (find-package "YOUR_PACKAGE::ID")
  (make-package "YOUR_PACKAGE::ID"))
(unless (find-package "YOUR_PACKAGE::IDREQUEST")
  (make-package "YOUR_PACKAGE::IDREQUEST"))
(unless (find-package "YOUR_PACKAGE::IDRESPONSE")
  (make-package "YOUR_PACKAGE::IDRESPONSE"))

(in-package "ROS")





(defclass your_package::idRequest
  :super ros::object
  :slots (_name ))

(defmethod your_package::idRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass your_package::idResponse
  :super ros::object
  :slots (_student_id ))

(defmethod your_package::idResponse
  (:init
   (&key
    ((:student_id __student_id) "")
    )
   (send-super :init)
   (setq _student_id (string __student_id))
   self)
  (:student_id
   (&optional __student_id)
   (if __student_id (setq _student_id __student_id)) _student_id)
  (:serialization-length
   ()
   (+
    ;; string _student_id
    4 (length _student_id)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _student_id
       (write-long (length _student_id) s) (princ _student_id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _student_id
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _student_id (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass your_package::id
  :super ros::object
  :slots ())

(setf (get your_package::id :md5sum-) "08624c9d6f9820cb95f5c05a5c49c525")
(setf (get your_package::id :datatype-) "your_package/id")
(setf (get your_package::id :request) your_package::idRequest)
(setf (get your_package::id :response) your_package::idResponse)

(defmethod your_package::idRequest
  (:response () (instance your_package::idResponse :init)))

(setf (get your_package::idRequest :md5sum-) "08624c9d6f9820cb95f5c05a5c49c525")
(setf (get your_package::idRequest :datatype-) "your_package/idRequest")
(setf (get your_package::idRequest :definition-)
      "string name
---
string student_id

")

(setf (get your_package::idResponse :md5sum-) "08624c9d6f9820cb95f5c05a5c49c525")
(setf (get your_package::idResponse :datatype-) "your_package/idResponse")
(setf (get your_package::idResponse :definition-)
      "string name
---
string student_id

")



(provide :your_package/id "08624c9d6f9820cb95f5c05a5c49c525")



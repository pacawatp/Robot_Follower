;; Auto-generated. Do not edit!


(when (boundp 'your_package::Data)
  (if (not (find-package "YOUR_PACKAGE"))
    (make-package "YOUR_PACKAGE"))
  (shadow 'Data (find-package "YOUR_PACKAGE")))
(unless (find-package "YOUR_PACKAGE::DATA")
  (make-package "YOUR_PACKAGE::DATA"))

(in-package "ROS")
;;//! \htmlinclude Data.msg.html


(defclass your_package::Data
  :super ros::object
  :slots (_name _ID ))

(defmethod your_package::Data
  (:init
   (&key
    ((:name __name) "")
    ((:ID __ID) 0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _ID (round __ID))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:ID
   (&optional __ID)
   (if __ID (setq _ID __ID)) _ID)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; int64 _ID
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; int64 _ID
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _ID (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _ID) (= (length (_ID . bv)) 2)) ;; bignum
              (write-long (ash (elt (_ID . bv) 0) 0) s)
              (write-long (ash (elt (_ID . bv) 1) -1) s))
             ((and (class _ID) (= (length (_ID . bv)) 1)) ;; big1
              (write-long (elt (_ID . bv) 0) s)
              (write-long (if (>= _ID 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _ID s)(write-long (if (>= _ID 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int64 _ID
#+(or :alpha :irix6 :x86_64)
      (setf _ID (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _ID (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get your_package::Data :md5sum-) "708b7a2000c3b1d0b53bfad26ccacad0")
(setf (get your_package::Data :datatype-) "your_package/Data")
(setf (get your_package::Data :definition-)
      "string name
int64 ID

")



(provide :your_package/Data "708b7a2000c3b1d0b53bfad26ccacad0")



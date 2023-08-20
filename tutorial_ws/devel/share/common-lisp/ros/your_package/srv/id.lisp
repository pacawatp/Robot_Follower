; Auto-generated. Do not edit!


(cl:in-package your_package-srv)


;//! \htmlinclude id-request.msg.html

(cl:defclass <id-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass id-request (<id-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <id-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'id-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name your_package-srv:<id-request> is deprecated: use your_package-srv:id-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <id-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader your_package-srv:name-val is deprecated.  Use your_package-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <id-request>) ostream)
  "Serializes a message object of type '<id-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <id-request>) istream)
  "Deserializes a message object of type '<id-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<id-request>)))
  "Returns string type for a service object of type '<id-request>"
  "your_package/idRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'id-request)))
  "Returns string type for a service object of type 'id-request"
  "your_package/idRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<id-request>)))
  "Returns md5sum for a message object of type '<id-request>"
  "08624c9d6f9820cb95f5c05a5c49c525")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'id-request)))
  "Returns md5sum for a message object of type 'id-request"
  "08624c9d6f9820cb95f5c05a5c49c525")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<id-request>)))
  "Returns full string definition for message of type '<id-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'id-request)))
  "Returns full string definition for message of type 'id-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <id-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <id-request>))
  "Converts a ROS message object to a list"
  (cl:list 'id-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude id-response.msg.html

(cl:defclass <id-response> (roslisp-msg-protocol:ros-message)
  ((student_id
    :reader student_id
    :initarg :student_id
    :type cl:string
    :initform ""))
)

(cl:defclass id-response (<id-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <id-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'id-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name your_package-srv:<id-response> is deprecated: use your_package-srv:id-response instead.")))

(cl:ensure-generic-function 'student_id-val :lambda-list '(m))
(cl:defmethod student_id-val ((m <id-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader your_package-srv:student_id-val is deprecated.  Use your_package-srv:student_id instead.")
  (student_id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <id-response>) ostream)
  "Serializes a message object of type '<id-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'student_id))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'student_id))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <id-response>) istream)
  "Deserializes a message object of type '<id-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'student_id) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'student_id) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<id-response>)))
  "Returns string type for a service object of type '<id-response>"
  "your_package/idResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'id-response)))
  "Returns string type for a service object of type 'id-response"
  "your_package/idResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<id-response>)))
  "Returns md5sum for a message object of type '<id-response>"
  "08624c9d6f9820cb95f5c05a5c49c525")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'id-response)))
  "Returns md5sum for a message object of type 'id-response"
  "08624c9d6f9820cb95f5c05a5c49c525")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<id-response>)))
  "Returns full string definition for message of type '<id-response>"
  (cl:format cl:nil "string student_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'id-response)))
  "Returns full string definition for message of type 'id-response"
  (cl:format cl:nil "string student_id~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <id-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'student_id))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <id-response>))
  "Converts a ROS message object to a list"
  (cl:list 'id-response
    (cl:cons ':student_id (student_id msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'id)))
  'id-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'id)))
  'id-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'id)))
  "Returns string type for a service object of type '<id>"
  "your_package/id")
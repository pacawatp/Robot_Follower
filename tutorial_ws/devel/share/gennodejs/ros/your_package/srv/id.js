// Auto-generated. Do not edit!

// (in-package your_package.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class idRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type idRequest
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type idRequest
    let len;
    let data = new idRequest(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'your_package/idRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c1f3d28f1b044c871e6eff2e9fc3c667';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new idRequest(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    return resolved;
    }
};

class idResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.student_id = null;
    }
    else {
      if (initObj.hasOwnProperty('student_id')) {
        this.student_id = initObj.student_id
      }
      else {
        this.student_id = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type idResponse
    // Serialize message field [student_id]
    bufferOffset = _serializer.string(obj.student_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type idResponse
    let len;
    let data = new idResponse(null);
    // Deserialize message field [student_id]
    data.student_id = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.student_id);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'your_package/idResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '372af5010cb802275110c9bd017544b8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string student_id
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new idResponse(null);
    if (msg.student_id !== undefined) {
      resolved.student_id = msg.student_id;
    }
    else {
      resolved.student_id = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: idRequest,
  Response: idResponse,
  md5sum() { return '08624c9d6f9820cb95f5c05a5c49c525'; },
  datatype() { return 'your_package/id'; }
};

// Auto-generated. Do not edit!

// (in-package th_messages.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class raw_barometer2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.tempe = null;
      this.baro_level = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('tempe')) {
        this.tempe = initObj.tempe
      }
      else {
        this.tempe = [];
      }
      if (initObj.hasOwnProperty('baro_level')) {
        this.baro_level = initObj.baro_level
      }
      else {
        this.baro_level = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type raw_barometer2
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [tempe]
    bufferOffset = _arraySerializer.float32(obj.tempe, buffer, bufferOffset, null);
    // Serialize message field [baro_level]
    bufferOffset = _arraySerializer.float32(obj.baro_level, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type raw_barometer2
    let len;
    let data = new raw_barometer2(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [tempe]
    data.tempe = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [baro_level]
    data.baro_level = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.tempe.length;
    length += 4 * object.baro_level.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'th_messages/raw_barometer2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f076f0fa677fd465f2c44b54f6890c1a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32[] tempe
    float32[] baro_level
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new raw_barometer2(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.tempe !== undefined) {
      resolved.tempe = msg.tempe;
    }
    else {
      resolved.tempe = []
    }

    if (msg.baro_level !== undefined) {
      resolved.baro_level = msg.baro_level;
    }
    else {
      resolved.baro_level = []
    }

    return resolved;
    }
};

module.exports = raw_barometer2;

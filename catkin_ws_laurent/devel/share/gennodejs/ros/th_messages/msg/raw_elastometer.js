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

class raw_elastometer {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.rows = null;
      this.cols = null;
      this.p_level = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('rows')) {
        this.rows = initObj.rows
      }
      else {
        this.rows = 0;
      }
      if (initObj.hasOwnProperty('cols')) {
        this.cols = initObj.cols
      }
      else {
        this.cols = 0;
      }
      if (initObj.hasOwnProperty('p_level')) {
        this.p_level = initObj.p_level
      }
      else {
        this.p_level = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type raw_elastometer
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [rows]
    bufferOffset = _serializer.uint8(obj.rows, buffer, bufferOffset);
    // Serialize message field [cols]
    bufferOffset = _serializer.uint8(obj.cols, buffer, bufferOffset);
    // Serialize message field [p_level]
    bufferOffset = _arraySerializer.uint32(obj.p_level, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type raw_elastometer
    let len;
    let data = new raw_elastometer(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [rows]
    data.rows = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [cols]
    data.cols = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [p_level]
    data.p_level = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.p_level.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'th_messages/raw_elastometer';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a25a3ba9a447cce9b672c660d7b15412';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint8 rows
    uint8 cols
    uint32[] p_level
    
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
    const resolved = new raw_elastometer(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.rows !== undefined) {
      resolved.rows = msg.rows;
    }
    else {
      resolved.rows = 0
    }

    if (msg.cols !== undefined) {
      resolved.cols = msg.cols;
    }
    else {
      resolved.cols = 0
    }

    if (msg.p_level !== undefined) {
      resolved.p_level = msg.p_level;
    }
    else {
      resolved.p_level = []
    }

    return resolved;
    }
};

module.exports = raw_elastometer;

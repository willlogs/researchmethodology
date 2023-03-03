// Auto-generated. Do not edit!

// (in-package sensor.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class temp {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.temp = null;
    }
    else {
      if (initObj.hasOwnProperty('temp')) {
        this.temp = initObj.temp
      }
      else {
        this.temp = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type temp
    // Serialize message field [temp]
    bufferOffset = _arraySerializer.float64(obj.temp, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type temp
    let len;
    let data = new temp(null);
    // Deserialize message field [temp]
    data.temp = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.temp.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor/temp';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5369666b54d681f4247009dedc80d817';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] temp
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new temp(null);
    if (msg.temp !== undefined) {
      resolved.temp = msg.temp;
    }
    else {
      resolved.temp = []
    }

    return resolved;
    }
};

module.exports = temp;

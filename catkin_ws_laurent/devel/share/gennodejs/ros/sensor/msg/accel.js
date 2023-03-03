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

class accel {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.accel = null;
    }
    else {
      if (initObj.hasOwnProperty('accel')) {
        this.accel = initObj.accel
      }
      else {
        this.accel = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type accel
    // Serialize message field [accel]
    bufferOffset = _arraySerializer.float64(obj.accel, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type accel
    let len;
    let data = new accel(null);
    // Deserialize message field [accel]
    data.accel = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.accel.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor/accel';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9dcb4b52846c9069458fbfb8e5d7c530';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] accel
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new accel(null);
    if (msg.accel !== undefined) {
      resolved.accel = msg.accel;
    }
    else {
      resolved.accel = []
    }

    return resolved;
    }
};

module.exports = accel;

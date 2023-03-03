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

class magne {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.magne = null;
    }
    else {
      if (initObj.hasOwnProperty('magne')) {
        this.magne = initObj.magne
      }
      else {
        this.magne = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type magne
    // Serialize message field [magne]
    bufferOffset = _arraySerializer.float64(obj.magne, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type magne
    let len;
    let data = new magne(null);
    // Deserialize message field [magne]
    data.magne = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.magne.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'sensor/magne';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2ad17479b92c9ce002f096e7afd3ccab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] magne
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new magne(null);
    if (msg.magne !== undefined) {
      resolved.magne = msg.magne;
    }
    else {
      resolved.magne = []
    }

    return resolved;
    }
};

module.exports = magne;

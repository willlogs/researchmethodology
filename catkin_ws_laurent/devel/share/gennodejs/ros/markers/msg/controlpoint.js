// Auto-generated. Do not edit!

// (in-package markers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class controlpoint {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point = null;
      this.normal = null;
    }
    else {
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = [];
      }
      if (initObj.hasOwnProperty('normal')) {
        this.normal = initObj.normal
      }
      else {
        this.normal = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type controlpoint
    // Serialize message field [point]
    bufferOffset = _arraySerializer.float64(obj.point, buffer, bufferOffset, null);
    // Serialize message field [normal]
    bufferOffset = _arraySerializer.float64(obj.normal, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type controlpoint
    let len;
    let data = new controlpoint(null);
    // Deserialize message field [point]
    data.point = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [normal]
    data.normal = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.point.length;
    length += 8 * object.normal.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'markers/controlpoint';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '17a4dbdec115e427a96101ad4aea3f0b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] point
    float64[] normal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new controlpoint(null);
    if (msg.point !== undefined) {
      resolved.point = msg.point;
    }
    else {
      resolved.point = []
    }

    if (msg.normal !== undefined) {
      resolved.normal = msg.normal;
    }
    else {
      resolved.normal = []
    }

    return resolved;
    }
};

module.exports = controlpoint;

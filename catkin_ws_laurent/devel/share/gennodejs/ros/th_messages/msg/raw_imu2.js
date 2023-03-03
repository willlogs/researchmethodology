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

class raw_imu2 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.tempe = null;
      this.ax = null;
      this.ay = null;
      this.az = null;
      this.gx = null;
      this.gy = null;
      this.gz = null;
      this.mx = null;
      this.my = null;
      this.mz = null;
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
      if (initObj.hasOwnProperty('ax')) {
        this.ax = initObj.ax
      }
      else {
        this.ax = [];
      }
      if (initObj.hasOwnProperty('ay')) {
        this.ay = initObj.ay
      }
      else {
        this.ay = [];
      }
      if (initObj.hasOwnProperty('az')) {
        this.az = initObj.az
      }
      else {
        this.az = [];
      }
      if (initObj.hasOwnProperty('gx')) {
        this.gx = initObj.gx
      }
      else {
        this.gx = [];
      }
      if (initObj.hasOwnProperty('gy')) {
        this.gy = initObj.gy
      }
      else {
        this.gy = [];
      }
      if (initObj.hasOwnProperty('gz')) {
        this.gz = initObj.gz
      }
      else {
        this.gz = [];
      }
      if (initObj.hasOwnProperty('mx')) {
        this.mx = initObj.mx
      }
      else {
        this.mx = [];
      }
      if (initObj.hasOwnProperty('my')) {
        this.my = initObj.my
      }
      else {
        this.my = [];
      }
      if (initObj.hasOwnProperty('mz')) {
        this.mz = initObj.mz
      }
      else {
        this.mz = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type raw_imu2
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [tempe]
    bufferOffset = _arraySerializer.float32(obj.tempe, buffer, bufferOffset, null);
    // Serialize message field [ax]
    bufferOffset = _arraySerializer.float32(obj.ax, buffer, bufferOffset, null);
    // Serialize message field [ay]
    bufferOffset = _arraySerializer.float32(obj.ay, buffer, bufferOffset, null);
    // Serialize message field [az]
    bufferOffset = _arraySerializer.float32(obj.az, buffer, bufferOffset, null);
    // Serialize message field [gx]
    bufferOffset = _arraySerializer.float32(obj.gx, buffer, bufferOffset, null);
    // Serialize message field [gy]
    bufferOffset = _arraySerializer.float32(obj.gy, buffer, bufferOffset, null);
    // Serialize message field [gz]
    bufferOffset = _arraySerializer.float32(obj.gz, buffer, bufferOffset, null);
    // Serialize message field [mx]
    bufferOffset = _arraySerializer.float32(obj.mx, buffer, bufferOffset, null);
    // Serialize message field [my]
    bufferOffset = _arraySerializer.float32(obj.my, buffer, bufferOffset, null);
    // Serialize message field [mz]
    bufferOffset = _arraySerializer.float32(obj.mz, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type raw_imu2
    let len;
    let data = new raw_imu2(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [tempe]
    data.tempe = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [ax]
    data.ax = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [ay]
    data.ay = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [az]
    data.az = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [gx]
    data.gx = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [gy]
    data.gy = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [gz]
    data.gz = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [mx]
    data.mx = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [my]
    data.my = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [mz]
    data.mz = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 4 * object.tempe.length;
    length += 4 * object.ax.length;
    length += 4 * object.ay.length;
    length += 4 * object.az.length;
    length += 4 * object.gx.length;
    length += 4 * object.gy.length;
    length += 4 * object.gz.length;
    length += 4 * object.mx.length;
    length += 4 * object.my.length;
    length += 4 * object.mz.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'th_messages/raw_imu2';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7fea683002c52f4a1ffae2fd1a0e778f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float32[] tempe
    float32[] ax
    float32[] ay
    float32[] az
    float32[] gx
    float32[] gy
    float32[] gz
    float32[] mx
    float32[] my
    float32[] mz
    
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
    const resolved = new raw_imu2(null);
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

    if (msg.ax !== undefined) {
      resolved.ax = msg.ax;
    }
    else {
      resolved.ax = []
    }

    if (msg.ay !== undefined) {
      resolved.ay = msg.ay;
    }
    else {
      resolved.ay = []
    }

    if (msg.az !== undefined) {
      resolved.az = msg.az;
    }
    else {
      resolved.az = []
    }

    if (msg.gx !== undefined) {
      resolved.gx = msg.gx;
    }
    else {
      resolved.gx = []
    }

    if (msg.gy !== undefined) {
      resolved.gy = msg.gy;
    }
    else {
      resolved.gy = []
    }

    if (msg.gz !== undefined) {
      resolved.gz = msg.gz;
    }
    else {
      resolved.gz = []
    }

    if (msg.mx !== undefined) {
      resolved.mx = msg.mx;
    }
    else {
      resolved.mx = []
    }

    if (msg.my !== undefined) {
      resolved.my = msg.my;
    }
    else {
      resolved.my = []
    }

    if (msg.mz !== undefined) {
      resolved.mz = msg.mz;
    }
    else {
      resolved.mz = []
    }

    return resolved;
    }
};

module.exports = raw_imu2;


"use strict";

let GetJointPosition = require('./GetJointPosition.js')
let GetKinematicsPose = require('./GetKinematicsPose.js')
let SetDrawingTrajectory = require('./SetDrawingTrajectory.js')
let SetKinematicsPose = require('./SetKinematicsPose.js')
let SetActuatorState = require('./SetActuatorState.js')
let SetJointPosition = require('./SetJointPosition.js')

module.exports = {
  GetJointPosition: GetJointPosition,
  GetKinematicsPose: GetKinematicsPose,
  SetDrawingTrajectory: SetDrawingTrajectory,
  SetKinematicsPose: SetKinematicsPose,
  SetActuatorState: SetActuatorState,
  SetJointPosition: SetJointPosition,
};

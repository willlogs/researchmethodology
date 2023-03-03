# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "th_messages: 5 messages, 0 services")

set(MSG_I_FLAGS "-Ith_messages:/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(th_messages_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg" NAME_WE)
add_custom_target(_th_messages_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "th_messages" "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg" NAME_WE)
add_custom_target(_th_messages_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "th_messages" "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg" NAME_WE)
add_custom_target(_th_messages_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "th_messages" "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg" NAME_WE)
add_custom_target(_th_messages_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "th_messages" "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg" NAME_WE)
add_custom_target(_th_messages_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "th_messages" "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages
)
_generate_msg_cpp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages
)
_generate_msg_cpp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages
)
_generate_msg_cpp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages
)
_generate_msg_cpp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages
)

### Generating Services

### Generating Module File
_generate_module_cpp(th_messages
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(th_messages_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(th_messages_generate_messages th_messages_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_cpp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_cpp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_cpp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_cpp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_cpp _th_messages_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(th_messages_gencpp)
add_dependencies(th_messages_gencpp th_messages_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS th_messages_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages
)
_generate_msg_eus(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages
)
_generate_msg_eus(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages
)
_generate_msg_eus(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages
)
_generate_msg_eus(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages
)

### Generating Services

### Generating Module File
_generate_module_eus(th_messages
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(th_messages_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(th_messages_generate_messages th_messages_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_eus _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_eus _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_eus _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_eus _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_eus _th_messages_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(th_messages_geneus)
add_dependencies(th_messages_geneus th_messages_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS th_messages_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages
)
_generate_msg_lisp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages
)
_generate_msg_lisp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages
)
_generate_msg_lisp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages
)
_generate_msg_lisp(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages
)

### Generating Services

### Generating Module File
_generate_module_lisp(th_messages
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(th_messages_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(th_messages_generate_messages th_messages_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_lisp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_lisp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_lisp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_lisp _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_lisp _th_messages_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(th_messages_genlisp)
add_dependencies(th_messages_genlisp th_messages_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS th_messages_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages
)
_generate_msg_nodejs(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages
)
_generate_msg_nodejs(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages
)
_generate_msg_nodejs(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages
)
_generate_msg_nodejs(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages
)

### Generating Services

### Generating Module File
_generate_module_nodejs(th_messages
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(th_messages_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(th_messages_generate_messages th_messages_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_nodejs _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_nodejs _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_nodejs _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_nodejs _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_nodejs _th_messages_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(th_messages_gennodejs)
add_dependencies(th_messages_gennodejs th_messages_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS th_messages_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages
)
_generate_msg_py(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages
)
_generate_msg_py(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages
)
_generate_msg_py(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages
)
_generate_msg_py(th_messages
  "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages
)

### Generating Services

### Generating Module File
_generate_module_py(th_messages
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(th_messages_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(th_messages_generate_messages th_messages_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_py _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_py _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_imu2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_py _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_barometer2.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_py _th_messages_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/th_messages/msg/raw_elastometer.msg" NAME_WE)
add_dependencies(th_messages_generate_messages_py _th_messages_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(th_messages_genpy)
add_dependencies(th_messages_genpy th_messages_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS th_messages_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/th_messages
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(th_messages_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/th_messages
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(th_messages_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/th_messages
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(th_messages_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/th_messages
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(th_messages_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/th_messages
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(th_messages_generate_messages_py std_msgs_generate_messages_py)
endif()

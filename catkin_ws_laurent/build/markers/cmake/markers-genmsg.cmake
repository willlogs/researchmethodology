# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "markers: 2 messages, 0 services")

set(MSG_I_FLAGS "-Imarkers:/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(markers_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg" NAME_WE)
add_custom_target(_markers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "markers" "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg" ""
)

get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg" NAME_WE)
add_custom_target(_markers_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "markers" "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/markers
)
_generate_msg_cpp(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/markers
)

### Generating Services

### Generating Module File
_generate_module_cpp(markers
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/markers
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(markers_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(markers_generate_messages markers_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg" NAME_WE)
add_dependencies(markers_generate_messages_cpp _markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg" NAME_WE)
add_dependencies(markers_generate_messages_cpp _markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(markers_gencpp)
add_dependencies(markers_gencpp markers_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS markers_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/markers
)
_generate_msg_eus(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/markers
)

### Generating Services

### Generating Module File
_generate_module_eus(markers
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/markers
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(markers_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(markers_generate_messages markers_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg" NAME_WE)
add_dependencies(markers_generate_messages_eus _markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg" NAME_WE)
add_dependencies(markers_generate_messages_eus _markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(markers_geneus)
add_dependencies(markers_geneus markers_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS markers_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/markers
)
_generate_msg_lisp(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/markers
)

### Generating Services

### Generating Module File
_generate_module_lisp(markers
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/markers
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(markers_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(markers_generate_messages markers_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg" NAME_WE)
add_dependencies(markers_generate_messages_lisp _markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg" NAME_WE)
add_dependencies(markers_generate_messages_lisp _markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(markers_genlisp)
add_dependencies(markers_genlisp markers_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS markers_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/markers
)
_generate_msg_nodejs(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/markers
)

### Generating Services

### Generating Module File
_generate_module_nodejs(markers
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/markers
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(markers_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(markers_generate_messages markers_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg" NAME_WE)
add_dependencies(markers_generate_messages_nodejs _markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg" NAME_WE)
add_dependencies(markers_generate_messages_nodejs _markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(markers_gennodejs)
add_dependencies(markers_gennodejs markers_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS markers_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/markers
)
_generate_msg_py(markers
  "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/markers
)

### Generating Services

### Generating Module File
_generate_module_py(markers
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/markers
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(markers_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(markers_generate_messages markers_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/obstacle.msg" NAME_WE)
add_dependencies(markers_generate_messages_py _markers_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/will/dev/tactile/catkin_ws_laurent/src/markers/msg/controlpoint.msg" NAME_WE)
add_dependencies(markers_generate_messages_py _markers_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(markers_genpy)
add_dependencies(markers_genpy markers_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS markers_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/markers
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(markers_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/markers
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(markers_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/markers
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(markers_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/markers)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/markers
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(markers_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/markers)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/markers\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/markers
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(markers_generate_messages_py std_msgs_generate_messages_py)
endif()

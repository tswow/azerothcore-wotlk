#
# This file is part of the AzerothCore Project. See AUTHORS file for Copyright information
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#

# Enforce compileparameters for corebuilds under GCC
# This to stop a few silly crashes that could have been avoided IF people
# weren't doing some -O3 psychooptimizations etc.

#tswow-begin add tswow sources
include(FetchContent)
FetchContent_Declare (json
GIT_REPOSITORY https://github.com/ArthurSonzogni/nlohmann_json_cmake_fetchcontent
GIT_TAG v3.9.1
)
FetchContent_GetProperties (json)
if (NOT json_POPULATED)
message (STATUS "Installing json.hpp...")
FetchContent_Populate (json)
endif()
add_subdirectory (${json_SOURCE_DIR} ${json_BINARY_DIR})

get_filename_component(
  TSWOW_CORE_PRIVATE ${CMAKE_SOURCE_DIR}/../../tswow-core/Private ABSOLUTE
)

get_filename_component(
  TSWOW_CORE_PUBLIC ${CMAKE_SOURCE_DIR}/../../tswow-core/Public ABSOLUTE
)

get_filename_component(
  TSWOW_MESSAGES_INCLUDES ${CMAKE_SOURCE_DIR}/../../misc/client-extensions/CustomPackets ABSOLUTE
)

SET(TSWOW_INCLUDES
  ${TSWOW_CORE_PRIVATE}
  ${TSWOW_CORE_PUBLIC}
  ${TSWOW_MESSAGES_INCLUDES}
  ${json_SOURCE_DIR}
)

FILE(GLOB_RECURSE TSWOW_SOURCES
    ${TSWOW_CORE_PRIVATE}/*
    ${TSWOW_CORE_PUBLIC}/*
    ${TSWOW_MESSAGES_INCLUDES}/*.h
    ${TSWOW_MESSAGES_INCLUDES}/*.cpp
)
#tswow-end

if(CMAKE_COMPILER_IS_GNUCXX AND NOT MINGW)
  add_definitions(-fno-delete-null-pointer-checks)
endif()

add_subdirectory(genrev)

if( SERVERS )
  add_subdirectory(server)
endif()

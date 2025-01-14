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



CU_RUN_HOOK(BEFORE_GAME_LIBRARY)

CollectSourceFiles(
  ${CMAKE_CURRENT_SOURCE_DIR}
  PRIVATE_SOURCES
  # Exclude
  ${CMAKE_CURRENT_SOURCE_DIR}/PrecompiledHeaders)

if (USE_COREPCH)
  set(PRIVATE_PCH_HEADER PrecompiledHeaders/gamePCH.h)
endif ()

# Group sources
GroupSources(${CMAKE_CURRENT_SOURCE_DIR})

add_library(game-interface INTERFACE)

CollectIncludeDirectories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  PUBLIC_INCLUDES
  # Exclude
  ${CMAKE_CURRENT_SOURCE_DIR}/PrecompiledHeaders)

target_include_directories(game-interface
  INTERFACE
    ${PUBLIC_INCLUDES})

target_link_libraries(game-interface
  INTERFACE
    shared)

add_library(game STATIC
  ${PRIVATE_SOURCES}
  #tswow-begin
  ${TSWOW_SOURCES}
  #tswow-end
  )

add_dependencies(game revision.h)

target_include_directories(game
  PRIVATE
    ${CMAKE_CURRENT_BINARY_DIR}
    #tswow-begin
    ${TSWOW_INCLUDES}
    ${LUA_ROOT}
    ${sol2_SOURCE_DIR}/include
    ${sourcemap_SOURCE_DIR}/src
    ${sourcemap_SOURCE_DIR}/deps/json
    ${sourcemap_SOURCE_DIR}/deps/cencode
    #tswow-end
  )

#tswow-begin
FILE(GLOB TSWOW_PUBLIC ${TSWOW_CORE_PUBLIC}/*)
FILE(GLOB TSWOW_PRIVATE ${TSWOW_CORE_PRIVATE}/*)
FILE(GLOB TSWOW_MESSAGES ${TSWOW_MESSAGES_INCLUDES}/*)

# todo linux
target_compile_definitions(game PUBLIC AZEROTHCORE=1)

source_group("tswow-messages" FILES ${TSWOW_MESSAGES})
source_group("tswow-public" FILES ${TSWOW_PUBLIC})
source_group("tswow-private" FILES ${TSWOW_PRIVATE})
# tswow-end

target_link_libraries(game
  PRIVATE
    acore-core-interface
  PUBLIC
    # tswow-begin
    nlohmann_json::nlohmann_json
    liblua
    sourcemaps
    # tswow-end
    game-interface)

set_target_properties(game
  PROPERTIES
    FOLDER
      "server")

# Generate precompiled header
if (USE_COREPCH)
  add_cxx_pch(game ${PRIVATE_PCH_HEADER})
endif ()

CU_RUN_HOOK(AFTER_GAME_LIBRARY)

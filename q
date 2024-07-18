[1mdiff --git a/android/ijkplayer/fijkplayer-full/src/main/CMakeLists.txt b/android/ijkplayer/fijkplayer-full/src/main/CMakeLists.txt[m
[1mindex a3ea244b..4cb79ebe 100644[m
[1m--- a/android/ijkplayer/fijkplayer-full/src/main/CMakeLists.txt[m
[1m+++ b/android/ijkplayer/fijkplayer-full/src/main/CMakeLists.txt[m
[36m@@ -21,7 +21,7 @@[m
 cmake_minimum_required(VERSION 3.6)[m
 [m
 project("FijkPlayer")[m
[31m-[m
[32m+[m[32m# set(CMAKE_BUILD_TYPE "Debug")[m
 set(CMAKE_C_STANDARD 11)[m
 set(CMAKE_CXX_STANDARD 11)[m
 [m
[36m@@ -33,8 +33,10 @@[m [mmessage(STATUS "ANDROID_ABI:${ANDROID_ABI}")[m
 message(STATUS "PROJECT_SOURCE_DIR ${PROJECT_SOURCE_DIR}")[m
 [m
 set(FIJKROOT_PATH "${PROJECT_SOURCE_DIR}/../../../../..")[m
[32m+[m
[32m+[m
 get_filename_component(FIJKROOT_PATH ${FIJKROOT_PATH} ABSOLUTE)[m
[31m-message(STATUS "FIJKROOT_PATH ${FIJKROOT_PATH}")[m
[32m+[m[32mmessage(STATUS "DHG FIJKROOT_PATH ${FIJKROOT_PATH}")[m
 [m
 [m
 if (${CMAKE_BUILD_TYPE} STREQUAL "Release")[m
[36m@@ -67,19 +69,25 @@[m [melse ()[m
     message(STATUS "IJK_FFMPAG_BUILD_DIR:${IJK_FFMPAG_BUILD_DIR}")[m
 endif ()[m
 [m
[32m+[m[32mmessage(STATUS "DHG :${FIJKROOT_PATH}")[m
[32m+[m[32mmessage(STATUS "DHG CMAKE_LIBRARY_OUTPUT_DIRECTORY is :${CMAKE_LIBRARY_OUTPUT_DIRECTORY}")[m
[32m+[m
 add_library(ijkffmpeg SHARED IMPORTED)[m
 set_target_properties( # Specifies the target library.[m
[31m-    ijkffmpeg[m
[31m-    PROPERTIES[m
[31m-    IMPORTED_LOCATION ${IJK_FFMPAG_BUILD_DIR}/libijkffmpeg.so[m
[31m-)[m
[32m+[m[32m        ijkffmpeg[m
[32m+[m[32m        PROPERTIES[m
[32m+[m[32m        IMPORTED_LOCATION ${IJK_FFMPAG_BUILD_DIR}/libijkffmpeg.so[m
[32m+[m[32m        )[m
 [m
 add_custom_target(cpffmpeg[m
[31m-    COMMAND mkdir -p ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}[m
[31m-    COMMAND cp ${IJK_FFMPAG_BUILD_DIR}/libijkffmpeg.so ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}[m
[31m-)[m
[32m+[m[32m        COMMAND mkdir -p ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}[m
[32m+[m[32m        COMMAND cp ${IJK_FFMPAG_BUILD_DIR}/libijkffmpeg.so ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}[m
[32m+[m[32m        COMMAND cp ${FIJKROOT_PATH}/android/ijkplayer/ijkplayer-arm64/src/main/libs/arm64-v8a/libc++_shared.so ${CMAKE_LIBRARY_OUTPUT_DIRECTORY}[m
 [m
[32m+[m[32m        )[m
 add_dependencies(ijkffmpeg cpffmpeg)[m
 [m
[32m+[m
 message(STATUE "${CMAKE_LIBRARY_OUTPUT_DIRECTORY} ${PROJECT_BINARY_DIR}")[m
 add_subdirectory(${FIJKROOT_PATH}/ijkmedia ijkmedia)[m
[41m+[m

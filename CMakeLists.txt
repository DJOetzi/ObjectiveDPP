cmake_minimum_required(VERSION 3.28)
project(ObjectiveDPP)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

enable_language(OBJCXX)

#set(CMAKE_EXE_LINKER_FLAGS "`gnustep-config --objc-flags` -fconstant-string-class=NSConstantString -I/usr/include/GNUstep -L/usr/lib/x86_64-linux-gnu -Xlinker -lgnustep-base -lobj")
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_C_FLAGS "-x objective-c")
set(CMAKE_CXX_FLAGS "-x objective-c++")

# Include GNUstep configuration flags
execute_process(COMMAND -fobjc-arc gnustep-config --objc-flags OUTPUT_VARIABLE OBJC_FLAGS OUTPUT_STRIP_TRAILING_WHITESPACE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OBJC_FLAGS}")

# Set the constant string class
add_definitions(-fconstant-string-class=NSConstantString)

# Include directories
include_directories(/usr/include/GNUstep)

# Link directories
link_directories(/usr/lib/x86_64-linux-gnu)

file(GLOB COMMAND_SOURCES ${CMAKE_SOURCE_DIR}/src/*/*.mm)

set(SOURCES
        src/main.mm
        ${COMMAND_SOURCES}
)
add_executable(ObjectiveDPP ${SOURCES})

find_package(DPP REQUIRED)

# Link libraries
target_link_libraries(ObjectiveDPP gnustep-base objc ${DPP_LIBRARIES})

# Include the DPP directories.
target_include_directories(${PROJECT_NAME} PRIVATE
        ${DPP_INCLUDE_DIR}
)
cmake_minimum_required(VERSION 3.14)
project(sample_flex_bison C)

set(CMAKE_C_STANDARD 11)

add_subdirectory(src/parsers)

include_directories(${CMAKE_CURRENT_BINARY_DIR}/src/parsers)
add_executable(calc src/main.c)
target_link_libraries(calc parser)

cmake_minimum_required(VERSION 3.22)
project(RSA C)

set(CMAKE_C_STANDARD 99)

add_executable(RSA main.c RSA_test.h RSA.c RSA_test.c)

target_link_libraries(RSA m crypto dl)

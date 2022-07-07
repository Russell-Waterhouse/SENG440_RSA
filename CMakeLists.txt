cmake_minimum_required(VERSION 3.12.1)
project(RSA C)

set(CMAKE_C_STANDARD 99)

add_executable(RSA main.c RSA_test.h RSA.c RSA_test.c)

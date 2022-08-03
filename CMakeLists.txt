cmake_minimum_required(VERSION 3.12.1)
project(RSA C)

set(CMAKE_C_STANDARD 99)
SET(GCC_COVERAGE_COMPILE_FLAGS " -mthumb -O1 -S ")

add_executable(RSA main.c RSA_test.h RSA.c RSA_test.c RSA_plain_mmm.c RSA_optimized_mmm.c RSA_optimized_mmm.h RSA_plain_mmm.h RSA_hardware_assist.h)

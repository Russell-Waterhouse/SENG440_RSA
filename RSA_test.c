//
// Created by russellw on 24/05/22.
//
#include <stdio.h>
#include "RSA.h"

int assert(int condition, char* test_name);

int trivial_encrypt() {
    int failed_tests = 0;
    failed_tests += assert(encrypt(123) == 855, "trivial encrypt from slides");
    return failed_tests;
}

int trivial_decrypt() {
    int failed_tests = 0;
    failed_tests += assert(decrypt(855) == 123, "trivial decrypt from slides");
    return failed_tests;
}

void test() {
    printf("Starting tests for RSA\n\n");
    int failed_tests = 0;
    failed_tests += trivial_encrypt();
    failed_tests += trivial_decrypt();
    printf("Tests completed for RSA with %d failed tests\n\n", failed_tests);
}

int assert(int condition, char* test_name){
    if (condition) {
        return 0;
    }
    else {
        printf("TEST FAILED: %s\n", test_name);
        return 1;
    }
}

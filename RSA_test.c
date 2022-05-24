//
// Created by russellw on 24/05/22.
//
#include <stdio.h>
#include <string.h>

int assert(int condition, char* test_name);

void test() {
    printf("Starting tests for RSA\n\n");
    printf("Tests completed for RSA\n\n");
}

int assert(int condition, char* test_name){
    if (condition) {
        return 1;
    }
    else {
        printf("TEST FAILED: %s\n", test_name);
    }
}

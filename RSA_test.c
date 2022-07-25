//
// Created by russellw on 24/05/22.
//
#include <stdio.h>
#include "RSA.h"
#include <stdlib.h>
#include <time.h>

// Prototypes
int assert(int condition, char* test_name);
void print_performance(int start, int end);

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

int property_test() {
    int failed_tests = 0;
    int i = 0;
    unsigned int input;
    unsigned int cyphertext;
    unsigned int decyphered_text;
    for(i=0; i<=100; i++) {
        input = rand();
//        This is just there because the current implementation has pq=3233
//        input cannot be greater than 3233
        input = input % 3233;
        cyphertext = encrypt(input);
        decyphered_text = decrypt(cyphertext);
        failed_tests += assert(input==decyphered_text, "Property testing encrypt/decrypt");
        if (input != decyphered_text){
            printf("Property testing failed with input %u; cyphertext was %u, decyphered_text was %u\n", input, cyphertext, decyphered_text);
        }
    }
    return failed_tests;
}

void test(int measure_performance) {
    printf("\nStarting tests for RSA\n\n");
    int failed_tests = 0;
    int start = 0;
    int end = 0;

    start = clock();
    failed_tests += trivial_encrypt();
    failed_tests += trivial_decrypt();
    failed_tests += property_test();
    end = clock();

    printf("Tests completed for RSA with %d failed tests\n\n", failed_tests);
    
    if (measure_performance)
        print_performance(start, end);
}

void print_performance(int start, int end) {
    int total_ticks = end - start;
    printf("========================================\n");
    printf("Total Ticks: %.12d (microseconds)\n", total_ticks);
    printf("========================================\n\n");
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

//
// Created by russellw on 24/05/22.
//
#include <stdio.h>
#include "RSA.h"
#include <stdlib.h>
#include <time.h>

#define NUM_TRIALS 1000

// Prototypes
int assert(int condition, char* test_name);
void measure_performance();

int initial_trivial_encrypt() {
    int failed_tests = 0;
    failed_tests += assert(initial_encrypt(123) == 855, "trivial encrypt from slides");
    return failed_tests;
}

int initial_trivial_decrypt() {
    int failed_tests = 0;
    failed_tests += assert(initial_decrypt(855) == 123, "trivial decrypt from slides");
    return failed_tests;
}

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

void test(int performance_flag) {
    printf("\n+ Starting tests for RSA\n\n");

    int failed_tests = 0;

    failed_tests += initial_trivial_encrypt();
    failed_tests += initial_trivial_decrypt();
    failed_tests += trivial_encrypt();
    failed_tests += trivial_decrypt();
    // failed_tests += property_test();


    printf("Tests completed for RSA with %d failed tests\n\n", failed_tests);
    
    if (performance_flag && failed_tests == 0)
        measure_performance();
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

void measure_performance() {
    float start = 0;
    float end = 0;
    float total = 0;
    float result = 0;
    float average1 = 0;
    float average2 = 0;

    printf("+ Starting performance evaluation for RSA\n\n");
    printf("Pure Software Implementation:\n");

    start = clock();
    for ( int i=0; i < NUM_TRIALS; i++ ) {
        initial_trivial_encrypt();
        initial_trivial_decrypt();
    }
    end = clock(); 
    total = end - start;
    average1 = total / NUM_TRIALS;

    printf("\tAverage Ticks: %.2f cycles\n\n", average1);
    printf("Optimized Implementation:\n");

    start = clock();
    for ( int i=0; i < NUM_TRIALS; i++ ) {
        trivial_encrypt();
        trivial_decrypt();
    }
    end = clock(); 
    total = end - start;
    average2 = total / NUM_TRIALS;

    result = average1 - average2;
    if ( result < 0 )
        result = 0;

    printf("\tAverage Ticks: %.2f cycles\n\n", average2);
    printf("Results:\n");
    // printf("\tClocks per second = %ld\n", CLOCKS_PER_SEC);
    printf("\tNumber of trials  = %d\n", NUM_TRIALS);
    printf("\tImproved by       = %.0f cycles", result);
    result = ( result / average1) * 100;
    printf(", [ %.1f%% ]\n\n", result);
}

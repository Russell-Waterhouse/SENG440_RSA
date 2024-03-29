#include <stdio.h>
#include "RSA.h"
#include "RSA_plain_mmm.h"
#include "RSA_optimized_mmm.h"
#include <stdlib.h>
#include <time.h>

#define NUM_TRIALS 1000
#define NUM_TRIALS_FILE_INPUT 100
#define TEST_ENCRYPT_FILE_NAME "../test_input_encrypt.txt"
#define TEST_DECRYPT_FILE_NAME "../test_input_decrypt.txt.RSA"
#define TEST_ENCRYPT_RESULT_FILE_NAME "../test_output_encrypt.txt.RSA"
#define TEST_DECRYPT_RESULT_FILE_NAME "../test_output_decrypt.txt"

// Prototypes
int assert(int condition, char* test_name);
void measure_performance();

int initial_trivial_encrypt() {
    int failed_tests = 0;
    failed_tests += assert(initial_encrypt(123) == 855, "pure trivial encrypt from slides");
    return failed_tests;
}

int initial_trivial_decrypt() {
    int failed_tests = 0;
    failed_tests += assert(initial_decrypt(855) == 123, "pure trivial decrypt from slides");
    return failed_tests;
}

int trivial_encrypt() {
    int failed_tests = 0;
    failed_tests += assert(encrypt(123) == 855, "unoptimized trivial encrypt from slides");
    return failed_tests;
}

int trivial_decrypt() {
    int failed_tests = 0;
    failed_tests += assert(decrypt(855) == 123, "unoptimized trivial decrypt from slides");
    return failed_tests;
}

int optimized_trivial_encrypt() {
    int failed_tests = 0;
    failed_tests += assert(optimized_encrypt(123) == 855, "optimized trivial encrypt from slides");
    return failed_tests;
}

int optimized_trivial_decrypt() {
    int failed_tests = 0;
    failed_tests += assert(optimized_decrypt(855) == 123, "optimized trivial decrypt from slides");
    return failed_tests;
}

int initial_file_encrypt() {
    FILE * infile = fopen(TEST_ENCRYPT_FILE_NAME, "r");
    FILE *outfile = fopen(TEST_ENCRYPT_RESULT_FILE_NAME, "wb");
    initial_encrypt_file(infile, outfile);
    fclose(infile);
    fclose(outfile);
    return 0;
}

int initial_file_decrypt() {
    FILE * infile = fopen(TEST_DECRYPT_FILE_NAME, "r");
    FILE *outfile = fopen(TEST_DECRYPT_RESULT_FILE_NAME, "wb");
    initial_decrypt_file(infile, outfile);
    fclose(infile);
    fclose(outfile);
    return 0;
}

int file_encrypt() {
    FILE * infile = fopen(TEST_ENCRYPT_FILE_NAME, "r");
    FILE *outfile = fopen(TEST_ENCRYPT_RESULT_FILE_NAME, "wb");
    encrypt_file(infile, outfile);
    fclose(infile);
    fclose(outfile);
    return 0;
}

int file_decrypt() {
    FILE * infile = fopen(TEST_DECRYPT_FILE_NAME, "r");
    FILE *outfile = fopen(TEST_DECRYPT_RESULT_FILE_NAME, "wb");
    decrypt_file(infile, outfile);
    fclose(infile);
    fclose(outfile);
    return 0;
}

int optimized_file_encrypt() {
    FILE * infile = fopen(TEST_ENCRYPT_FILE_NAME, "r");
    FILE *outfile = fopen(TEST_ENCRYPT_RESULT_FILE_NAME, "wb");
    optimized_encrypt_file(infile, outfile);
    fclose(infile);
    fclose(outfile);
    return 0;
}

int optimized_file_decrypt() {
    FILE * infile = fopen(TEST_DECRYPT_FILE_NAME, "r");
    FILE *outfile = fopen(TEST_DECRYPT_RESULT_FILE_NAME, "wb");
    optimized_decrypt_file(infile, outfile);
    fclose(infile);
    fclose(outfile);
    return 0;
}

int property_test() {
    int failed_tests = 0;
    int i = 0;
    unsigned int input;
    unsigned int cyphertext;
    unsigned int decyphered_text;
    for(i=0; i<=100; i++) {
        input = rand();
        // This is just there because the current implementation has pq=3233
        // input cannot be greater than 3233
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
    failed_tests += optimized_trivial_encrypt();
    failed_tests += optimized_trivial_decrypt();
    failed_tests += property_test();

    printf("\tTests completed for RSA with %d failed tests\n\n", failed_tests);
    
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


#pragma clang diagnostic push
#pragma ide diagnostic ignored "cppcoreguidelines-narrowing-conversions"
void measure_performance() {
    int     i = 0;
    float   start = 0;
    float   end = 0;
    float   total = 0;
    float   result = 0;
    float   file_result = 0;
    float   average1 = 0;
    float   average2 = 0;
    float   average3 = 0;

    // Begin trivial tests
    printf("+ Starting trivial performance evaluation\n\n");
    start = clock();
    for ( i=0; i < NUM_TRIALS; i++ ) {
        initial_trivial_encrypt();
        initial_trivial_decrypt();
    }
    end = clock(); 
    total = end - start;
    average1 = total / NUM_TRIALS;

    start = clock();
    for ( i=0; i < NUM_TRIALS; i++ ) {
        trivial_encrypt();
        trivial_decrypt();
    }
    end = clock(); 
    total = end - start;
    average2 = total / NUM_TRIALS;

    start = clock();
    for ( int i=0; i < NUM_TRIALS; i++ ) {
        optimized_trivial_encrypt();
        optimized_trivial_decrypt();
    }
    end = clock(); 
    total = end - start;
    average3 = total / NUM_TRIALS;

    printf("\tAverage Ticks after %d trials:\n", NUM_TRIALS);
    printf("\t\tPure-software       = %.1f cycles\n", average1);
    printf("\t\tUnoptimized MMM     = %.1f cycles\n", average2);
    printf("\t\tOptimized MMM       = %.1f cycles\n\n", average3);

    printf("\tImprovements Results:\n");
    result = average1 - average2;
    printf("\t\tPure -> Unopt.      = %.0f cycles", result);
    result = ( result / average1) * 100;
    printf(", [ %.1f%% ]\n", result);

    result = average2 - average3;
    printf("\t\tUnopt. -> Optimized = %.0f cycles", result);
    result = ( result / average2) * 100;
    printf(", [ %.1f%% ]\n", result);

    result = average1 - average3;
    printf("\t\tPure -> Optimized   = %.0f cycles", result);
    result = ( result / average1) * 100;
    printf(", [ %.1f%% ]\n\n", result);
    // End trivial tests

    // Start file input tests
    printf("+ Starting file input performance evaluation\n\n");
    start = clock();
    for ( int i=0; i < NUM_TRIALS_FILE_INPUT; i++ ) {
        initial_file_encrypt();
        initial_file_decrypt();
    }
    end = clock();
    total = end - start;
    average1 = total / NUM_TRIALS_FILE_INPUT;

    start = clock();
    for ( int i=0; i < NUM_TRIALS_FILE_INPUT; i++ ) {
        file_encrypt();
        file_decrypt();
    }
    end = clock();
    total = end - start;
    average2 = total / NUM_TRIALS_FILE_INPUT;

    start = clock();
    for ( int i=0; i < NUM_TRIALS_FILE_INPUT; i++ ) {
        optimized_file_encrypt();
        optimized_file_decrypt();
    }
    end = clock();
    total = end - start;
    average3 = total / NUM_TRIALS_FILE_INPUT;

    printf("\tAverage Ticks after %d trials:\n", NUM_TRIALS_FILE_INPUT);
    printf("\t\tPure-software       = %.0f cycles\n", average1);
    printf("\t\tUnoptimized MMM     = %.0f cycles\n", average2);
    printf("\t\tOptimized MMM       = %.0f cycles\n\n", average3);

    printf("\tImprovements Results:\n");
    result = average1 - average2;
    printf("\t\tPure -> Unopt.      = %.0f cycles", result);
    result = ( result / average1) * 100;
    printf(", [ %.1f%% ]\n", result);

    result = average2 - average3;
    printf("\t\tUnopt. -> Optimized = %.0f cycles", result);
    result = ( result / average2) * 100;
    printf(", [ %.1f%% ]\n", result);

    result = average1 - average3;
    printf("\t\tPure -> Optimized   = %.0f cycles", result);
    result = ( result / average1) * 100;
    printf(", [ %.1f%% ]\n\n", result);
    // End file input tests
}
#pragma clang diagnostic pop

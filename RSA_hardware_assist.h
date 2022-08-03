//
// Created by russ on 02/08/22.
//

#ifndef RSA_RSA_HARDWARE_ASSIST_H
#define RSA_RSA_HARDWARE_ASSIST_H
#include <stdint.h>
#include <stdio.h>

uint64_t hw_assist_encrypt(uint64_t input);
uint64_t hw_assist_decrypt(uint64_t input);
void* hw_assist_encrypt_file(FILE* infile, FILE* outfile);
void* hw_assist_decrypt_file(FILE* infile, FILE* outfile);

#endif //RSA_RSA_HARDWARE_ASSIST_H

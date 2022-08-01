#ifndef RSA_RSA_OPTIMIZED_MMM_H
#define RSA_RSA_OPTIMIZED_MMM_H

#include <stdint.h>
#include <stdio.h>

uint64_t optimized_encrypt(uint64_t input);
uint64_t optimized_decrypt(uint64_t input);
void* optimized_encrypt_file(FILE* infile, FILE* outfile);
void* optimized_decrypt_file(FILE* infile, FILE* outfile);
#endif //RSA_RSA_OPTIMIZED_MMM_H

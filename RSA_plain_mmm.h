#ifndef RSA_RSA_PLAIN_MMM_H
#define RSA_RSA_PLAIN_MMM_H

#include <stdint.h>
#include <stdio.h>

uint64_t encrypt(uint64_t input);
uint64_t decrypt(uint64_t input);
void* encrypt_file(FILE* infile, FILE* outfile);
void* decrypt_file(FILE* infile, FILE* outfile);

#endif //RSA_RSA_PLAIN_MMM_H

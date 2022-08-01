#ifndef rsa

#define rsa

#include <stdint.h>
#include <stdio.h>


uint64_t initial_encrypt(uint64_t input);
uint64_t initial_decrypt(uint64_t input);
void* initial_encrypt_file(FILE* infile, FILE* outfile);
void* initial_decrypt_file(FILE* infile, FILE* outfile);


#endif
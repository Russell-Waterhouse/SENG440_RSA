#ifndef rsa

#define rsa

#include <stdint.h>

uint64_t encrypt(uint64_t input);
uint64_t decrypt(uint64_t input);
uint64_t initial_encrypt(uint64_t input);
uint64_t initial_decrypt(uint64_t input);

#endif
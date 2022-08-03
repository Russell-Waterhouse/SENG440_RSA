#include <stdint.h>
#include <stdio.h>
#include "RSA.h"

// Hardcoded modulus 
// p = 61, q = 53
# define PQ 3233


////////////////////////////////////////////////////////
//      Pure-Software Implementation using MME        //
////////////////////////////////////////////////////////

/**
 * @brief Montgomery Modular Exponentiation before Software Optimization
 * improvements. - a^e mod PQ
 * 
 * @param a Plaintext
 * @param e Public Exponent
 * @param m Modulus (PQ)
 * @return uint64_t 
 */
uint64_t initial_mod_exp(uint64_t a, uint64_t e, uint64_t m) {
    uint64_t result = 1;
    for (int i = 0; i < e; i++) {
        result = (result * a) % m;
    }
    return result % m;
}

/**
 * @brief RSA Encryption using unoptimized functions
 * 
 * @param input Plaintext
 * @return uint64_t
 */
uint64_t initial_encrypt(uint64_t input){
    uint64_t pq = PQ;
    uint64_t e = 17;
    uint64_t cypher_text = initial_mod_exp(input, e, pq);
    return cypher_text;
}

/**
 * @brief RSA Decryption using unoptimized functions
 * @return uint64_t 
 */
uint64_t initial_decrypt(uint64_t input){
    uint64_t pq = PQ;
    uint64_t d = 2753;
    uint64_t plain_text = initial_mod_exp(input, d, pq);
    return plain_text;
}

void* initial_encrypt_file(FILE* infile, FILE* outfile) {
    if (infile == NULL || outfile == NULL) {
        printf("ERROR: input file or output file is null");
        return NULL;
    }
    uint64_t in_chunk[1];// = NULL;
    in_chunk[0] = 0;
    uint64_t out_chunk[1];// = NULL;
//    size is smaller than buffer size to pad input with leading zeros to prevent overflow
    size_t size = sizeof(uint8_t);
    unsigned long result = fread(in_chunk, size, 1, infile);
    while(result == 1) {
        * out_chunk = initial_encrypt(*in_chunk);
        fwrite(out_chunk, sizeof(uint64_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}

void* initial_decrypt_file(FILE* infile, FILE* outfile) {
    if (infile == NULL || outfile == NULL) {
        printf("ERROR: input file or output file is null");
        return NULL;
    }
    uint64_t in_chunk[1];// = NULL;
    uint64_t out_chunk[1];// = NULL;
    size_t size = sizeof(uint64_t);
    unsigned long result = fread(in_chunk, size, 1, infile);
    while(result == 1) {
        * out_chunk = initial_decrypt(*in_chunk);
//        remove padding
        * out_chunk << 56;
        fwrite(out_chunk, sizeof(uint8_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}
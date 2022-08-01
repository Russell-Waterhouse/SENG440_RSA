#include <stdint.h>
#include <stdio.h>
#include "RSA.h"

// Hardcoded modulus 
// p = 61, q = 53
# define PQ 3233

////////////////////////////////////////////////////////
//                  Optimized MMM                     //
////////////////////////////////////////////////////////

/**
 * @brief Montgomery Modular Multiplication with software optimization
 * techniques implemented - Z=X*Y*R^-1 mod M
 * 
 * @param X First operand
 * @param Y Second operand
 * @param M Modulus
 * @param m Bitwidth of M
 * @return uint64_t 
 */
static inline uint64_t optimized_mod_mul(uint64_t X, uint64_t Y, uint64_t M, int m) {
    register int i;
    register int T;
    register int Xi, T0, Y0;
    register int eta;
    register int Xi_Y;
    register int eta_M;

    T = 0;
    Y0 = Y & 1;

    for( i=0; i<m; i++) {
        Xi      = (X >> i) & 1;
        T0      = T & 1;
        eta     = T0 ^ (Xi & Y0);
        Xi_Y    = Xi ? Y : 0;
        eta_M   = eta ? M : 0;
        T       = (T + Xi_Y + eta_M) >> 1;
    }
    while ( T >= M)
        T -= M;

    return T;
}

/**
 * @brief Montgomery Modular Exponentiation - a^e mod PQ
 * 
 * @param a Plaintext
 * @param e Public Exponent
 * @param M Modulus (PQ)
 * @return uint64_t 
 */
uint64_t optimized_mod_exp(uint64_t a, uint64_t e, uint64_t M) {
    // Determine m, bitwidth of M
    int m = 0;
    uint64_t temp = M;
    while ( temp > 0 ) {
        m++;
        temp >>= 1;
    }
    // Calculate R^2, where R=2^m
    uint64_t R_squared = (1 << (2 * m)) % M;
    // Calculate Z and P, in preparation for the multiply+square algorithm
    uint64_t Z = optimized_mod_mul(1, R_squared, M, m);
    uint64_t P = optimized_mod_mul(a, R_squared, M, m);
    for (int i = 0; i < m; i++) {
        if ( e & (1 << i) ) {
            Z = optimized_mod_mul(Z, P, M, m);
        }
        P = optimized_mod_mul(P, P, M, m);
    }
    Z = optimized_mod_mul(1, Z, M, m);
    return Z;
}

/**
 * @brief RSA Encryption - Right now, it just does the example from the slides
 * 
 * @param input Plaintext
 * @return unsigned int 
 */
uint64_t optimized_encrypt(uint64_t input){
    uint64_t pq = PQ;
    uint64_t e = 17;
    uint64_t cypher_text = optimized_mod_exp(input, e, pq);
    return cypher_text;
}

/**
 * @brief RSA Decryption - Right now, it just does the example from the slides
 * 
 * @param input Cypertext
 * @return uint64_t 
 */
uint64_t optimized_decrypt(uint64_t input){
    uint64_t pq = PQ;
//    n = (p-1)*(q-1)
    //calculates d such that e^d mod n == 1
    uint64_t d = 2753;
    uint64_t plain_text = optimized_mod_exp(input, d, pq);
    return plain_text;
}

void* optimized_encrypt_file(FILE* infile, FILE* outfile) {
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
        * out_chunk = optimized_encrypt(*in_chunk);
        fwrite(out_chunk, sizeof(uint64_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}

void* optimized_decrypt_file(FILE* infile, FILE* outfile) {
    if (infile == NULL || outfile == NULL) {
        printf("ERROR: input file or output file is null");
        return NULL;
    }
    uint64_t in_chunk[1];// = NULL;
    uint64_t out_chunk[1];// = NULL;
    size_t size = sizeof(uint64_t);
    unsigned long result = fread(in_chunk, size, 1, infile);
    while(result == 1) {
        * out_chunk = optimized_decrypt(*in_chunk);
//        remove padding
        * out_chunk << 56;
        fwrite(out_chunk, sizeof(uint8_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}

////////////////////////////////////////////////////////
//            Pure-software using MME with MMM        //
////////////////////////////////////////////////////////

/**
 * @brief Montgomery Modular Multiplication - Z=X*Y*R^-1 mod M
 * 
 * @param X First operand
 * @param Y Second operand
 * @param M Modulus
 * @param m Bitwidth of M
 * @return uint64_t 
 */
uint64_t mod_mul(uint64_t X, uint64_t Y, uint64_t M, int m) {
    int i;
    int T;
    int Xi, T0, Y0;
    int eta;
    int Xi_Y;
    int eta_M;

    T = 0;
    Y0 = Y & 1;
    for( i=0; i<m; i++) {
        Xi      = (X >> i) & 1;
        T0      = T & 1;
        eta     = T0 ^ (Xi & Y0);
        Xi_Y    = Xi ? Y : 0;
        eta_M   = eta ? M : 0;
        T       = (T + Xi_Y + eta_M) >> 1;
    }
    while ( T >= M)
        T -= M;

    return T;
}

/**
 * @brief Montgomery Modular Exponentiation - a^e mod PQ
 * 
 * @param a Plaintext
 * @param e Public Exponent
 * @param M Modulus (PQ)
 * @return uint64_t 
 */
uint64_t mod_exp(uint64_t a, uint64_t e, uint64_t M) {
    // Determine m, bitwidth of M
    int m = 0;
    uint64_t temp = M;
    while ( temp > 0 ) {
        m++;
        temp >>= 1;
    }
    // Calculate R^2, where R=2^m
    uint64_t R_squared = (1 << (2 * m)) % M;
    // Calculate Z and P, in preparation for the multiply+square algorithm
    uint64_t Z = mod_mul(1, R_squared, M, m);
    uint64_t P = mod_mul(a, R_squared, M, m);
    for (int i = 0; i < m; i++) {
        if ( e & (1 << i) ) {
            Z = mod_mul(Z, P, M, m);
        }
        P = mod_mul(P, P, M, m);
    }
    Z = mod_mul(1, Z, M, m);
    return Z;
}

/**
 * @brief RSA Encryption - Right now, it just does the example from the slides
 * 
 * @param input Plaintext
 * @return unsigned int 
 */
uint64_t encrypt(uint64_t input){
    uint64_t pq = PQ;
    uint64_t e = 17;
    uint64_t cypher_text = mod_exp(input, e, pq);
    return cypher_text;
}

/**
 * @brief RSA Decryption - Right now, it just does the example from the slides
 * 
 * @param input Cypertext
 * @return uint64_t 
 */
uint64_t decrypt(uint64_t input){
    uint64_t pq = PQ;
//    n = (p-1)*(q-1)
    //calculates d such that e^d mod n == 1
    uint64_t d = 2753;
    uint64_t plain_text = mod_exp(input, d, pq);
    return plain_text;
}

void* encrypt_file(FILE* infile, FILE* outfile) {
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
        * out_chunk = encrypt(*in_chunk);
        fwrite(out_chunk, sizeof(uint64_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}

void* decrypt_file(FILE* infile, FILE* outfile) {
    if (infile == NULL || outfile == NULL) {
        printf("ERROR: input file or output file is null");
        return NULL;
    }
    uint64_t in_chunk[1];// = NULL;
    uint64_t out_chunk[1];// = NULL;
    size_t size = sizeof(uint64_t);
    unsigned long result = fread(in_chunk, size, 1, infile);
    while(result == 1) {
        * out_chunk = decrypt(*in_chunk);
//        remove padding
        * out_chunk << 56;
        fwrite(out_chunk, sizeof(uint8_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}

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
//    n = (p-1)*(q-1)
    //calculates d such that e^d mod n == 1
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
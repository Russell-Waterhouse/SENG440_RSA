#include <stdio.h>
#include <stdint.h>

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
static inline uint64_t hw_assist_mod_mul(register uint64_t X,
                                         register uint64_t Y,
                                         register uint64_t M,
                                         register int m) {
    register int result;
    __asm__ ( "hw_assist_mod_mul_asm %0, %1, %2, %3" : "=r" (result) : "r" (X), "r" (Y), "r" (M), "r" (m));
    return result;
}

/**
 * @brief Montgomery Modular Exponentiation using optimized MMM - a^e mod PQ
 *
 * @param a Plaintext
 * @param e Public Exponent
 * @param M Modulus (PQ)
 * @return uint64_t
 */
uint64_t hw_assist_mod_exp(uint64_t a, uint64_t e, uint64_t M) {
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
    uint64_t Z = hw_assist_mod_mul(1, R_squared, M, m);
    uint64_t P = hw_assist_mod_mul(a, R_squared, M, m);
    for (int i = 0; i < m; i++) {
        if ( e & (1 << i) ) {
            Z = hw_assist_mod_mul(Z, P, M, m);
        }
        P = hw_assist_mod_mul(P, P, M, m);
    }
    Z = hw_assist_mod_mul(1, Z, M, m);
    return Z;
}

/**
 * @brief RSA Encryption - Simple example from lecture slides
 *
 * @param input Plaintext
 * @return unsigned int
 */
uint64_t hw_assist_encrypt(uint64_t input){
    uint64_t pq = PQ;
    uint64_t e = 17;
    uint64_t cypher_text = hw_assist_mod_exp(input, e, pq);
    return cypher_text;
}

/**
 * @brief RSA Decryption - Simple example from lecture slides
 *
 * @param input Cypertext
 * @return uint64_t
 */
uint64_t hw_assist_decrypt(uint64_t input){
    uint64_t pq = PQ;
//    n = (p-1)*(q-1)
    //calculates d such that e^d mod n == 1
    uint64_t d = 2753;
    uint64_t plain_text = hw_assist_mod_exp(input, d, pq);
    return plain_text;
}

void* hw_assist_encrypt_file(FILE* infile, FILE* outfile) {
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
        * out_chunk = hw_assist_encrypt(*in_chunk);
        fwrite(out_chunk, sizeof(uint64_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}

void* hw_assist_decrypt_file(FILE* infile, FILE* outfile) {
    if (infile == NULL || outfile == NULL) {
        printf("ERROR: input file or output file is null");
        return NULL;
    }
    uint64_t in_chunk[1];// = NULL;
    uint64_t out_chunk[1];// = NULL;
    size_t size = sizeof(uint64_t);
    unsigned long result = fread(in_chunk, size, 1, infile);
    while(result == 1) {
        * out_chunk = hw_assist_decrypt(*in_chunk);
//        remove padding
        * out_chunk << 56;
        fwrite(out_chunk, sizeof(uint8_t), 1, outfile);
        result = fread(in_chunk, size, 1, infile);
    }
    return NULL;
}
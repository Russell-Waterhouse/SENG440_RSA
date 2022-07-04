#include <stdint.h>

/**
 * @brief Simple multiplication - x*y
 * 
 * @param x First operand
 * @param y Second operand
 * @return unit64_t 
 */
static inline uint64_t mul(uint64_t x, uint64_t y) {
    return x * y;
//    TODO: vulnerable to integer overflow
}

/**
 * @brief Montgomery Modular Multiplication - Z=X*Y*R^-1 mod M
 * 
 * @param X First operand
 * @param Y Second operand
 * @param M Modulus
 * @param m Bitwidth of M
 * @return uint64_t 
 */
static inline uint64_t mod_mul(uint64_t X, uint64_t Y,
                            uint64_t M, uint64_t m) {
    // A lot of these could probably be smaller ints
    uint64_t Xi;
    uint64_t Xi_Y;
    uint64_t Y0;
    uint64_t Z;
    uint64_t Z0;
    uint64_t eta;
    uint64_t eta_M;

    for ( register int i=0; i<m; i++ ) {
        Xi = (X >> i) & 1;
        Z0 = Z & 1;
        eta = Z0 ^ (Xi & Y0);
        Xi_Y = Xi ? Y : 0;
        eta_M = eta ? M : 0;
        Z = (Z + Xi_Y + eta_M) >> 1;
    }
    while ( Z >= M ) {
        Z -= M;
    }
    return Z;
}

/**
 * @brief Montgomery Modular Exponentiation - a^e mod PQ
 * 
 * @param a Plaintext
 * @param e Public Exponent
 * @param m Modulus (PQ)
 * @return uint64_t 
 */
static inline uint64_t mod_exp(uint64_t a, uint64_t e, uint64_t m) {
//    TODO: do this right, this is just a quick hack
    uint64_t result = 1;
    for (register int i = 0; i < e; i++) {
        result = (result * a) % m;
    }
    return result % m;
}

/**
 * @brief RSA Encryption - Right now, it just does the example from the slides
 * 
 * @param input Plaintext
 * @return unsigned int 
 */
unsigned int encrypt(uint64_t input){
    uint64_t p = 61;
    uint64_t q = 53;
    uint64_t pq = mul(p, q);
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
    uint64_t p = 61;
    uint64_t q = 53;
    uint64_t pq = mul(p, q);
//    n = (p-1)*(q-1)
    //calculates d such that e^d mod n == 1
    uint64_t d = 2753;
    uint64_t plain_text = mod_exp(input, d, pq);
    return plain_text;
}

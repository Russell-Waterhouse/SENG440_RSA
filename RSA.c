#include <stdint.h>

// Hardcoded modulus 
// p = 61, q = 53
# define PQ 3233

////////////////////////////////////////////////////////
//                 Software Optimized                 //
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
static inline uint64_t mod_mul(uint64_t X, uint64_t Y,
                            uint64_t M) {
    // A lot of these could probably be smaller ints
    uint64_t    Xi;
    uint64_t    Xi_Y;
    uint64_t    Y0;
    uint64_t    Z;
    uint64_t    Z0;
    uint64_t    eta;
    uint64_t    eta_M;
    int         m = 0;  // Bitwidth of m

    // Determine m, bitwidth of M
    uint64_t temp = m;
    while( temp > 0 ){
        m++;
        temp >>= 1;
    }

    for ( register int i=0; i < m; i++ ) {
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

////////////////////////////////////////////////////////
//        Initial Software Implementation             //
////////////////////////////////////////////////////////

/**
 * @brief Montgomery Modular Multiplication before Software Optimization
 * improvements. Z=X*Y*R^-1 mod M
 * 
 * @param X First operand
 * @param Y Second operand
 * @param M Modulus (with bitwidth m)
 * @return uint64_t 
 */
uint64_t initial_mod_mul(uint64_t X, uint64_t Y, uint64_t M) {
    
    uint64_t Xi;
    uint64_t Xi_Y;
    uint64_t Y0;
    uint64_t Z;
    uint64_t Z0;
    uint64_t eta;
    uint64_t eta_M;
    uint64_t m = 0;

    // Determine m, bitwidth of M
    uint64_t temp = m;
    while( temp > 0 ){
        m++;
        temp >>= 1;
    }

    for ( int i=0; i < m; i++ ) {
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
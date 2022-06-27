/**
 * @brief Simple multiplication - x*y
 * 
 * @param x First operand
 * @param y Second operand
 * @return unsigned long long 
 */
unsigned long long mul(unsigned long long x, unsigned long long y) {
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
 * @return unsigned long long 
 */
unsigned long long mod_mul(unsigned long long X, unsigned long long Y,
                            unsigned long long M, unsigned long long m) {
    // A lot of these could probably be smaller ints
    unsigned long long Xi;
    unsigned long long Xi_Y;
    unsigned long long Y0;
    unsigned long long Z;
    unsigned long long Z0;
    unsigned long long eta;
    unsigned long long eta_M;

    for ( int i=0; i<m; i++ ) {
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
 * @return unsigned long long 
 */
unsigned long long mod_exp(unsigned long long a, unsigned long long e, unsigned long long m) {
//    TODO: do this right, this is just a quick hack
    unsigned long long result = 1;
    for (int i = 0; i < e; i++) {
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
unsigned int encrypt(unsigned long long input){
    unsigned long long p = 61;
    unsigned long long q = 53;
    unsigned long long pq = mul(p, q);
    unsigned long long e = 17;
    unsigned long long cypher_text = mod_exp(input, e, pq);
    return cypher_text;
}

/**
 * @brief RSA Decryption - Right now, it just does the example from the slides
 * 
 * @param input Cypertext
 * @return unsigned long long 
 */
unsigned long long decrypt(unsigned long long input){
    unsigned long long p = 61;
    unsigned long long q = 53;
    unsigned long long pq = mul(p, q);
//    n = (p-1)*(q-1)
    //calculates d such that e^d mod n == 1
    unsigned long long d = 2753;
    unsigned long long plain_text = mod_exp(input, d, pq);
    return (unsigned int)plain_text;
}

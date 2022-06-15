#include <stdio.h>
#include <openssl/bn.h>

unsigned long long mul(unsigned long long n1, unsigned long long n2) {
    return n1 * n2;
//    TODO: vulnerable to integer overflow
}

//    cyphertext = a^e mod pq
unsigned long long mod_exp(unsigned long long a, unsigned long long e, unsigned long long m) {
//    TODO: do this right, this is just a quick hack
    unsigned long long result = 1;
    for (int i = 0; i < e; i++) {
        result = (result * a) % m;
    }
    return result % m;
}

/*
 * Right now, it just does the example from the slides
 */
unsigned int encrypt(unsigned long long input){
    unsigned long long p = 61;
    unsigned long long q = 53;
    unsigned long long pq = mul(p, q);
    unsigned long long e = 17;
    unsigned long long cypher_text = mod_exp(input, e, pq);
    return cypher_text;
}

/*
 * Right now, it just does the example from the slides
 */
unsigned long long decrypt(unsigned long long input){
    BN_CTX * ctx = BN_CTX_new();

    BIGNUM * cyphertext = BN_new();
    //done with strings because that's what bignum library offers
    char text[20];
    sprintf(text, "%d", input);
    BN_dec2bn(&cyphertext, text);

    BIGNUM * one = BN_new();
    BN_dec2bn(&one, "1");

    BIGNUM * p = BN_new();
    BN_dec2bn(&p, "61");

    BIGNUM * q = BN_new();
    BN_dec2bn(&q, "53");

    BIGNUM * pq = BN_new();
    BN_mul(pq, p, q, ctx);

    BIGNUM * e = BN_new();
    BN_dec2bn(&e, "17");

//    q = q-1
    BN_sub(q, q, one);
//    p = p-1
    BN_sub(p, p, one);
    BIGNUM * n = BN_new();
//    n = (p-1)*(q-1)
    BN_mul(n, p, q, ctx);

    BIGNUM * d = BN_new();
    //calculates d such that e^d mod n == 1
    BN_mod_inverse(d, e, n, ctx);

    BIGNUM * plaintext = BN_new();
//    plaintext = cyphertext^d mod pq
    BN_mod_exp(plaintext, cyphertext, d, pq, ctx);

    //done with strings because that's what bignum library offers
    char * plaintext_str = BN_bn2dec(plaintext);
    int plain_text = atoi(plaintext_str);
    BN_CTX_free(ctx);
    BN_free(p);
    BN_free(q);
    BN_free(pq);
    BN_free(e);
    BN_free(n);
    BN_free(d);
    BN_free(cyphertext);
    BN_free(plaintext);
    OPENSSL_free(plaintext_str);
    return (unsigned int)plain_text;
}

#include <stdio.h>
#include <openssl/bn.h>

/*
 * Right now, it just does the example from the slides
 */
unsigned int encrypt(int input){
    BN_CTX * ctx = BN_CTX_new();

    BIGNUM * plaintext = BN_new();
    //done with strings because that's what bignum library offers
    char text[20];
    sprintf(text, "%d", input);
    BN_dec2bn(&plaintext, text);
    printf("input: %s\n", BN_bn2dec(plaintext));

    BIGNUM * p = BN_new();
    BN_dec2bn(&p, "61");
    printf("p: %s\n", BN_bn2dec(p));

    BIGNUM * q = BN_new();
    BN_dec2bn(&q, "53");
    printf("q: %s\n", BN_bn2dec(q));

    BIGNUM * pq = BN_new();
    BN_mul(pq, p, q, ctx);
    printf("pq: %s\n", BN_bn2dec(pq));

    BIGNUM * e = BN_new();
    BN_dec2bn(&e, "17");
    printf("e: %s\n", BN_bn2dec(e));

    BIGNUM * cyphertext = BN_new();
    BN_mod_exp(cyphertext, plaintext, e, pq, ctx);
    printf("cyphertext: %s\n", BN_bn2dec(cyphertext));

    //done with strings because that's what bignum library offers
    char * cypher_str = BN_bn2dec(cyphertext);
    int cypher_text = atoi(cypher_str);
    return (unsigned int)cypher_text;
}

void decrypt(){
    printf("decrypting ...\n");
}

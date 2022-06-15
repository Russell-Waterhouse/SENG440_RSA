
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
    unsigned long long p = 61;
    unsigned long long q = 53;
    unsigned long long pq = mul(p, q);
//    n = (p-1)*(q-1)
    //calculates d such that e^d mod n == 1
    unsigned long long d = 2753;
    unsigned long long plain_text = mod_exp(input, d, pq);
    return (unsigned int)plain_text;
}

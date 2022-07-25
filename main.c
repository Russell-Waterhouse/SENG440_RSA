#include "RSA_test.h"
#include <stdio.h>
#include <string.h>

int main( int argc, char *argv[] ) {

    // Check command line arguments
    if ( argc == 2 ) {
        // If true, will measure performance during tests
        if ( ! strcmp(argv[1], "-p") ) {
            test(1);
            return 0;
        }
        else {
            printf("ERROR: The argument '%s' is not recognized.\n", argv[1]);
            return 0;
        }
    }
    else if ( argc > 2 ) {
        printf("ERROR: Too many arguments supplied.\n");
        return 0;
    }

    // Run tests without performance measurements
    test(0);
    return 0;
}

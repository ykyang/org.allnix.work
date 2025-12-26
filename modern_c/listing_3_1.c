
// clang -std=c2x -Wall listing_3_1.c -o listing_3_1.exe

#include <stdio.h>
#include <stdlib.h>
//#include <string.h>

constexpr double eps1m01 = 1.0 - 0x1P-01; // P: exponent of 2 for hex, 1 - 0.5
// constexpr double eps1p01 = 1.0 + 0x1P-01; // 1 + 0.5
//const double eps1m01 = 1.0 - 0x1P-01; // P: exponent of 2 for hex, 1 - 0.5
const double eps1p01 = 1.0 + 0x1P-01; // 1 + 0.5
const double eps1m24 = 1.0 - 0x1P-24;
const double eps1p24 = 1.0 + 0x1P-24;

int main(int argc, char* argv[]) {
    // printf("%g\n", eps1m01);
    // printf("%g\n", eps1p01);
    printf("argc = %i\n", argc);
    for (int i = 1; i < argc; ++i) { // argv[0] is the exe itself
        printf("argv[%i]: \"%s\"\n", i, argv[i]);
        const char* s = argv[i];
        double const a = strtod(s, nullptr); // str -> double
        printf("\"%s\" => %g\n", s, a);
        double x = 1.0;
        for (;;) {
            double prod = a*x;
            printf("prod = %g\n", prod);
            if (prod < eps1m01) {
                x *= 2.0;
            } else if (eps1p01 < prod) {
                x *= 0.5;
            } else {
                break;
            }
        }
        printf("x = %g\n", x);
        for (;;) {
            double prod = a*x;
            printf("prod = %g\n", prod);
            if ( (prod < eps1m24) || (eps1p24 < prod)) {
                x *= 2.0 - prod;
            } else {
                break;
            }
        }
        printf("x = %g\n", x);
    }
    
    return EXIT_SUCCESS;
}
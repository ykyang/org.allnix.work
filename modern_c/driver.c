// gcc   -std=c2x driver.c -o driver
// clang -std=c2x driver.c -o driver.exe
// cl    driver.c /Fe: driver.exe

#include <stdio.h>
#include <stdlib.h>

// // Learn
// #include <stdlib.h>
// #include <stdio.h>
// #include <limits.h>
// int main() {
//     // printf("%i\n", INT_MAX);
//     // printf("%li\n", LONG_MAX);
//     { // decimal
//         int i = 0b1010;
//         printf("%i\n", i);
//     }
//     { // octal
//         int i = 077;
//         printf("%i\n", i);
//     }
//     { // hexdecimal
//         int i = 0xffff; printf("%i\n", i);
//     }
//     { // binary
//         int i= 0b1010;  printf("%i\n", i);
//     }
//     { // hexadecimal
//         float f = 0x1.7aP-3;  printf("%g\n", f);
//     }
//     { // char
//         unsigned char c = 'a';  printf("%i\n", c);
//         char b = 98; printf("%c\n", b);
//     }
//     { // String
//         const char* s = "This is a "
//         "multiline "
//         "string.";
//         printf("%s\n", s);
//     }

//     return EXIT_SUCCESS;
// }


// // 3.3 Multiple selection
// #include <stdio.h>
// #include <stdlib.h>
// int main(int argc, char* argv[]) { // ./driver magpie
//     const char* arg = argv[1];
//     switch (arg[0]) {
//         case 'm': puts("This is a magpie."); break;
//         case 'r': puts("This is a raven."); break;
//         case 'j': puts("This is a jay"); break;
//         case 'c': puts("This is a chough"); break;   
//         default: puts("Unknown corvid!");
//     }

//     return EXIT_SUCCESS;
// }

// // 3.3 Multiple selection
// #include <stdio.h>
// #include <stdlib.h>
// int main(int argc, char* argv[]) { // ./driver 3
//     int count = strtod(argv[1], nullptr); //printf("count = %i\n", count);
//     switch (count) {
//         default: puts("++++ ..... +++");
//         case 4: puts("++++");
//         case 3: puts("+++");
//         case 2: puts("++");
//         case 1: puts("+");
//         case 0: ;
//     }

//     return EXIT_SUCCESS;
// }

// // 4.1 Operands and operators
// #include <math.h>
// #include <stdio.h>
// #include <stdlib.h>
// #include <stdint.h>
// int main() {
//     printf("%llu\n", (unsigned long long)SIZE_MAX);
//     unsigned long long ans = 1;
//     for (int i = 0; i < 64; ++i) {
//         ans *= 2;
//     }
//     printf("%llu\n", ans-1);

//     unsigned long long v = 0x1P64 - 1;  printf("%llu\n", v);

//     return EXIT_SUCCESS;
// }

// 4.2 Arithmetic

// 5.5 Initializers
// #include <stdio.h>
// #include <stdlib.h>
// #include <stdint.h>
// #include <inttypes.h>
// int main() {

//     size_t length;
//     //uint64_t length;

//     // PRIu64 is a portable printf specifier see inttypes.h
//     double a = {}; // a == 0
//     double c = {7.8};
//     double A[] = {3, }; printf("Length of A: %" PRIuPTR "\n", sizeof(A)/sizeof(double));
//     double B[3] = {1, 2, 3}; printf("Length of B: %" PRIuPTR "\n", sizeof(B)/sizeof(double));
//     double C[] = {[0]=6, [3] = 1,}; printf("Length of C: %" PRIuPTR "\n", sizeof(C)/sizeof(double));

//     return EXIT_SUCCESS;
// }


// 5.6 Named constants


// 5.6.2 Enumerations
// #include <inttypes.h>
// int main() {
//     enum CORVID {MAGPIE, RAVEN, JAY, CORVID_COUNT};

//     char const*const bird[CORVID_COUNT] = {"Magpie", "Raven", "Jay", }; 
    
//     for (size_t i = 0; i < CORVID_COUNT; ++i) {
//         printf("Corvid %" PRIuPTR " is the %s\n", i, bird[i]);
//     }

//     return EXIT_SUCCESS;
// }

// 5.6.5 The constexpr construct
// #include <inttypes.h>
// enum CORVID {MAGPIE, RAVEN, JAY, CORVID_COUNT};
// // Does not work???
// // #define CORVID_NAME \
// //     (constexpr char[8][CORVID_COUNT]){ \
// //         [MAGPIE] = "Magpie", \
// //         [RAVEN] = "Raven", \
// //         [JAY] = "Jay", \
// //     }
// #define CORVID_NAME \
//     (char const*const[CORVID_COUNT]){ \
//         [MAGPIE] = "Magpie", \
//         [RAVEN] = "Raven", \
//         [JAY] = "Jay", \
//     }

// int main() {
//     //CORVID_NAMES names;
//     for (size_t i = 0; i < CORVID_COUNT; ++i) {
//        printf("Corvid %" PRIuPTR " is the %s\n", i, CORVID_NAME[i]);
//     }

//     return EXIT_SUCCESS;
// }

// 5.7 Binary representations

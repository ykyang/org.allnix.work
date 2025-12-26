// gcc   -std=c2x driver.c -o driver
// clang -std=c2x driver.c -o driver.exe

// // Multiple selection
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

// Multiple selection
#include <stdio.h>
#include <stdlib.h>
int main(int argc, char* argv[]) { // ./driver 3
    int count = strtod(argv[1], nullptr); //printf("count = %i\n", count);
    switch (count) {
        default: puts("++++ ..... +++");
        case 4: puts("++++");
        case 3: puts("+++");
        case 2: puts("++");
        case 1: puts("+");
        case 0: ;
    }

    return EXIT_SUCCESS;
}
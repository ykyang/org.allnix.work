// Listing 2.1, page 21
// greet01.c

// gcc   -std=c2x greet01.c -o   greet01
// clang -std=c2x greet01.c -o   greet01
// clang -std=c2x greet01.c -o   greet01.exe
// cl             greet01.c /Fe: greet01.exe

#include <stdlib.h>
#include <stdio.h>

int main() {
    printf("Hello Yi-Kun!\n");

    return EXIT_SUCCESS;
}
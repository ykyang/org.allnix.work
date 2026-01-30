// Listing 2.2, page 22
// greet02.c

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

    if (argc < 2) {
        puts("Hello!");
    } else {
        printf("Hello, %s!\n", argv[1]);
    }

    return EXIT_SUCCESS;
}
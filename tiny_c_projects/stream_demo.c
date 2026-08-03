#include <stdio.h>
#include <stdlib.h>

int main() {
    int a, b;

    printf("Type a letter:");
    a = getchar();
    printf("Type a letter:");
    b = getchar(); // This will get '\n'

    printf("a='%c', b='%c'\n", a, b);

    return EXIT_SUCCESS;
}
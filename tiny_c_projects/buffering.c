#include <stdlib.h>
#include <stdio.h>

int main() {
    char buf[BUFSIZ];
    int a, b;

    setbuf(stdout, buf);    

    printf("Type a letter:");
    a = getchar();
    printf("Type a letter:");
    b = getchar();

    printf("a='%c', b='%c'\n", a, b);

    return EXIT_SUCCESS;
}
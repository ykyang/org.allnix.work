#include <stdlib.h>
#include <stdio.h>
#include <string.h>

int main() {
    const int LEN = 64;
    const char *delimiters = " ,.!?:;\"'\n";
    char sometext[LEN];
    char *match;
    
    printf("Type some text: ");
    fgets(sometext, LEN, stdin);

    match = strtok(sometext, delimiters);
    while(match) {
        printf("%s\n", match);
        match = strtok(NULL, delimiters);
    }

    return EXIT_SUCCESS;
}
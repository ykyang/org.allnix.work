// Run with
// nato02 nato02.c

#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>

#ifndef __FILE_NAME__
    #define __FILE_NAME__ __FILE__
#endif

#define CHK_FILE(F,N) do { \
    if (F == NULL) { \
        fprintf(stderr, "Error: %s:%d: Unable to open %s\n", __FILE_NAME__, __LINE__, N); \
        return EXIT_FAILURE; \
    } \
} while (0)

int main(int argc, char *argv[]) {
    const char *nato[] = {
        "Alfa"     ,
        "Bravo"    ,
        "Charlie"  ,
        "Delta"    ,
        "Echo"     ,
        "Foxtrot"  ,
        "Golf"     ,
        "Hotel"    ,
        "India"    ,
        "Juliet"   ,
        "Kilo"     ,
        "Lima"     ,
        "Mike"     ,
        "November" ,
        "Oscar"    ,
        "Papa"     ,
        "Quebec"   ,
        "Romeo"    ,
        "Sierra"   ,
        "Tango"    ,
        "Uniform"  ,
        "Victor"   ,
        "Wiskey"   ,
        "X-Ray"    ,
        "Yankee"   ,
        "Zulu"     ,
    };

    if (argc < 2) {
        fprintf(stderr, "Please supply a text file argument\n");
        exit(EXIT_FAILURE);
    }

    FILE *in = fopen(argv[1], "r");  CHK_FILE(in, argv[1]);

    int ch;
    while ((ch=fgetc(in)) != EOF) {
        if (!isalpha(ch)) continue;
        printf("%s ", nato[toupper(ch) - 'A']);
    }
    putchar('\n');
    fclose(in);

    return EXIT_SUCCESS;
}
// Listing 3.7, page 48
// nato05.c, based on nato04.c
// Scan word by word instead of 64-character at a time
// to avoid incomplete reading of a word
//
// Run
// nato05 nato05.c


#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

#ifndef __FILE_NAME__
    #define __FILE_NAME__ __FILE__
#endif

#define CHK_FILE(F,N) do { \
    if (F == NULL) { \
        fprintf(stderr, "Error: %s:%d: Unable to open %s\n", __FILE_NAME__, __LINE__, N); \
        return EXIT_FAILURE; \
    } \
} while (0)

char isterm(char *term);

int main(int argc, char *argv[]) {
    const int LEN = 64;
    char phrase[LEN];
    char word[LEN];
    char *match;
    char ch;

    if (argc < 2) {
        fprintf(stderr, "Please supply a text file argument\n");
        exit(EXIT_FAILURE);
    }

    // printf("NATO word or phrase: ");
    // fgets(phrase, LEN, stdin);

    FILE *in = fopen(argv[1], "r");  CHK_FILE(in, argv[1]);

    int offset = 0;
    while((ch=fgetc(in)) != EOF) {
        if (isalpha(ch)) {
            word[offset] = ch;
            ++offset;
            if (offset >= 64) {
                fprintf(stderr, "Buffer overflow\n");
                return EXIT_FAILURE;
            }
        } else {
            if (offset > 0) {
                word[offset] = '\0';
                offset = 0;
                putchar(isterm(word));
            }
        }
    }






    // while(!feof(in)) {
    //     fgets(phrase, 64, in);
    //     // printf("%s\n", phrase);
    //     match = strtok(phrase, " ,.!?=()[]{}'\"");
    //     while(match) {
    //         ch = isterm(match);
    //         if (ch != '\0') putchar(ch);
    //         match = strtok(NULL, " ,.!?=()[]{}'\"");
    //     }
    // }
    putchar('\n');

    

    return EXIT_SUCCESS;
}

char isterm(char *term) {
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

    const int LEN = 26; // 26 NATO words
    const char *n, *t;

    const char *ans;
    for (int i = 0; i < LEN; i++) {
        n = ans = nato[i]; // ptr to the first char
        t = term;    // ptr to the first char
        // See if term == nato[i]
        while (*n != '\0') {
            if (toupper(*n) != toupper(*t)) break; // *n != '\0'
            ++n;
            ++t;
        }
        if (*n == '\0') return *ans;
    }

    return '\0';
}
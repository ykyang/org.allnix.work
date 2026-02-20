// Listing 3.5, page 46
// nato03.c
// Turn keyboard input from NATO phonetic into character.
//
// Test with this
// NATO word or phrase: india tango whiskey oscar romeo kilo sierra
// ITWORKS
// NATO word or phrase: Also starring Zulu as Kono
// Z
#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <limits.h>

char isterm(char *term);

int main() {
    const int LEN = 64;
    char phrase[64];
    char *match;
    char ch;

    printf("NATO word or phrase: ");
    fgets(phrase, LEN, stdin);

    match = strtok(phrase, " ");
    while(match) {
        ch = isterm(match);
        if (ch != '\0') putchar(ch);
        match = strtok(NULL, " ");
    }
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
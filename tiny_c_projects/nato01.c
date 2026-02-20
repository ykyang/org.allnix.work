#include <ctype.h>
#include <stdlib.h>
#include <stdio.h>

int main() {
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
 
    char phrase[64];
    char ch;

    printf("Enter a word or phrase: ");
    fgets(phrase, 64, stdin); // include \n

    int i = 0;
    while((ch=phrase[i]) != '\0') {
        ch = toupper(ch);    //putchar(ch);
        if (isalpha(ch)) printf("%s ", nato[ch-'A']);
        ++i;
        if (i==64) break;
    }
    putchar('\n');

    return EXIT_SUCCESS;

}
// Listing 2.5, page 25
// greet03.c

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(int argc, char *argv[]) {
 
    time_t now;
    struct tm *clock;
    time(nullptr);    

    time(&now);
    clock = localtime(&now);
    int hour = clock->tm_hour;

    printf("Good ");
    if (hour < 12) {
        printf("morning");
    } else if (hour < 17) {
        printf("afternoon");
    } else {
        printf("evening");
    }
    if (argc > 1) {
        printf(", %s", argv[1]);
    }

    puts("\n");
    //printf("%ld\n", now);
    
    return EXIT_SUCCESS;
}
// Listing 2.3, page 23
// time01.c

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
    time_t now;
    time(&now);

    printf("The computer thinks it is %ld\n", now);
    // printf("%s", ctime(&now)); // deprecated
        
    char buf [80];
    strftime(buf, 80, "%a %b %d %H:%M:%S %Y", localtime(&now)); // Fri Jan 30 14:50:20 2026
    puts(buf);

    return EXIT_SUCCESS;
}

// Listing 2.3, page 23
// time01.c

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

// Focus on the development on Linux.
// It is not worth the trouble to make code portable to Windows.
#if defined(__linux__)
struct tm* localtime_rs(const time_t *timer, struct tm *buf) {
    return localtime_r(timer, buf);
}
#endif
#if defined(_WIN32)
struct tm* localtime_rs(const time_t *timer, struct tm *buf) {
    errno_t err = localtime_s(buf, timer);
    return buf;
}
#endif

int main() {
    time_t now;
    time(&now);

    printf("The computer thinks it is %ld\n", now);
    // printf("%s", ctime(&now)); // deprecated
        
    char buf [80];
    strftime(buf, 80, "%a %b %d %H:%M:%S %Y", localtime(&now)); // Fri Jan 30 14:50:20 2026
    puts(buf);

    //// Example of portable code
    // struct tm time_tm;
    // localtime_rs(&now, &time_tm);
    // strftime(buf, 80, "%a %b %d %H:%M:%S %Y", &time_tm); // Fri Jan 30 14:50:20 2026
    // puts(buf);

    return EXIT_SUCCESS;
}

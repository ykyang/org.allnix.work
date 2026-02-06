// Listing 2.6, page 26
// greet04.c

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int moon_phase(int year, int month, int day);

int main(int argc, char *argv[]) {
    time_t now;
    struct tm clock;
    char c255[255];

    char *phase [] = {
      "waxing crescent", "at first quarter", "waxing gibbous",
      "full", "waning gibbour", "at last quarter", "waning crescent", 
      "new"
    };

    time(&now);
    localtime_r(&now, &clock);

    

    strftime(c255, 255, "Today is %A, %B %d, %Y%nIt is %r%n", &clock);

    printf("Greetings");
    if (argc > 1) printf(", %s", argv[1]);

    printf("!\n%s", c255);

    int mp;
    mp = moon_phase(clock.tm_year+1900, clock.tm_mon, clock.tm_mday);
    printf("The moon is %s\n", phase[mp]);

    return EXIT_SUCCESS;
}

int moon_phase(int year, int month, int day) {
    // year:  tm_year + 1900
    // month: tm_mon, 0 - 111
    // day:   tm_mday, 1 - 31

    int d, g, e;
    d = day;
    if (month == 2)
        d += 31;
    else if (month > 2)
        d += 59 + (month - 3) * 30.6 + 0.5;
    g = (year - 1900) % 19;
    e = (11 * g + 29) % 30;
    if (e == 25 || e == 24)
        ++e;
    return ((((e + d) * 6 + 5) % 177) / 22 & 7);
}
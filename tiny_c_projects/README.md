DEPRECATED



<!-- 
quarto preview c:/Users/yi-kun.yang/work/org.allnix.work/tiny_c_projects/README.md --no-browser --no-watch-inputs
-->
**PREFACE**

* delightful aspect of programming: instant feedback
* [C for Dummies](https://c-for-dummies.com/blog/)


**2. Daily greetings**

* `ps -p $$`, where `$$` is one of the parameter expansion in bash

**2.2.1 Coding a greeting**
```c
// Listing 2.1, page 21
// greet01.c
#include <stdlib.h>
#include <stdio.h>

int main() {
    printf("Hello Yi-Kun!\n");

    return EXIT_SUCCESS;
}
```
**2.2.2 Adding a name as an argument**
```c
// Listing 2.2, page 22
// greet02.c
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

    if (argc < 2) {
        puts("Hello!");
    } else {
        printf("Hello, %s!\n", argv[1]);
    }

    return EXIT_SUCCESS;
}
```
**2.3.1 Obtaining the current time**
```c
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
```
```c
// Listing 2.4, page 24
// time02.c

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
    time_t now;
    struct tm *clock;

    time(&now);
    clock = localtime(&now); // clock points to internal static memory

    puts("Time details:");
    printf(" Day of the year: %d\n", clock->tm_yday);
    printf(" Day of the week: %d\n", clock->tm_wday);
    printf("            Year: %d\n", clock->tm_year+1900);
    printf("           Month: %d\n", clock->tm_mon);
    printf("Day of the month: %d\n", clock->tm_mday);
    printf("            Hour: %d\n", clock->tm_hour);
    printf("          Minute: %d\n", clock->tm_min);
    printf("          Second: %d\n", clock->tm_sec);

    return EXIT_SUCCESS;
}
```

**2.3.2 Mixing in the general time of day**


```c
// Listing 2.5, page 25
// greet03.c
```

**2.3.3 Adding specific time info**

```c
// Listing 2.6, page 26
// greet04.c
```

**2.4 The current moon phase**

---
**Anchor**
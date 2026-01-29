<!-- 
quarto preview c:/Users/yi-kun.yang/work/org.allnix.work/tiny_c_projects/README.md --no-browser --no-watch-inputs
-->
**PREFACE**

* delightful aspect of programming: instant feedback
* [C for Dummies](https://c-for-dummies.com/blog/)


**Daily greetings**

* `ps -p $$`, where `$$` is one of the parameter expansion in bash

```c
// Listing 2.1
// greet01.c
#include <stdlib.h>
#include <stdio.h>

int main() {
    printf("Hello Yi-Kun!\n");

    return EXIT_SUCCESS;
}
```
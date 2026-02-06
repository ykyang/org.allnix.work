#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

#define BSIZE 256

int main() {
    const char filename[] = "pithy.txt";
    FILE *fp;
    char buf[BSIZE];
    char *r, *entry;
    int items;

    fp = fopen(filename, "r");
    if (fp == NULL) {
        fprintf(stderr, "Opening \"%s\"\n", filename);
        fprintf(stderr, "Error(%d): %s\n", errno, strerror(errno));
        return EXIT_FAILURE;
    }

    items = 0;
    while(!feof(fp)) {
        r = fgets(buf, BSIZE, fp);
        if (r == NULL) break;
        printf("%s", buf);
    }

    fclose(fp);
    
    return EXIT_SUCCESS;
}
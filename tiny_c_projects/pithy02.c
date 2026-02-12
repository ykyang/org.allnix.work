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
        //printf("%s", buf);
        entry = (char*)malloc(sizeof(char)*strlen(buf) + 1);
        if (entry == NULL) {
            fprintf(stderr, "Unable to allocate memory\n");
            return EXIT_FAILURE;
        }
        strcpy(entry, buf);
        printf("%d: %s", items, entry);
        
        ++items;
    }

    fclose(fp);
    
    return EXIT_SUCCESS;
}
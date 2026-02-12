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
    char **list_base;

    fp = fopen(filename, "r");
    if (fp == NULL) {
        fprintf(stderr, "Opening \"%s\"\n", filename);
        fprintf(stderr, "Error(%d): %s\n", errno, strerror(errno));
        return EXIT_FAILURE;
    }

    list_base = (char **)malloc(sizeof(char *) * 100);
    if (list_base == NULL) {
        fprintf(stderr, "Unable to allocate memory\n");
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
        //printf("%d: %s", items, entry); // moved to after file closing
        *(list_base + items) = entry;

        ++items;
        if (items % 100 == 0) {
            list_base = (char **) realloc(list_base, sizeof(char *)*(items+100));
            if (list_base == NULL) {
                fprintf(stderr, "Unable to allocate memory\n");
                return EXIT_FAILURE;
            }       
        }
    }

    fclose(fp);

    for (int i = 0; i < items; i++) {
        printf("%s", *(list_base+i));
    }
    
    // No need to free memory since all is contained in main(), page 37.
    return EXIT_SUCCESS;
}

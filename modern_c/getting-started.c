// gcc      -std=c2x -Wall getting-started.c -o getting-started -lm
// clang    -std=c2x -Wall getting-started.c -o getting-started
// clang-cl getting-started.c -o getting-started
// Does not compile
// cl       getting-started.c /Fe: hello


#include <stdlib.h>
#include <stdio.h>

int main(int argc, [[maybe_unused]] char* argv[]) {
    double A[5] = {
        [0] = 9.0, [1] = 2.9,
        [4] = 3.0e25,
        [3] = 0.00007,
    };

    for (size_t i = 0; i < 5; ++i) {
        printf("element %zu is %g, \tits square is %g\n", i, A[i], A[i]*A[i]);
    }

    return EXIT_SUCCESS;
}

#include <stdio.h>
int main() {
    float* fptr = malloc(5 * 4);
    *(fptr + 2) = 3.14;
    printf("%f", fptr[2]);
    free(fptr);
}
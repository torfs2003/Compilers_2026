#include <stdio.h>
int main() {
    int* p = malloc(4); // Allocatie voor 1 int
    *p = 42;
    free(p);
}
#include <stdio.h>

int main() {
    // Test 1: Simpele declaratie en initialisatie
    int x = 10;

    /* Test 2: Een statement dat resulteert in 
       meerdere LLVM instructies */
    int y = x * 2 + 5;

    // Test 3: I/O statement
    printf("Waarde van y is: %d\n", y);

    return 0;
}
#include <stdio.h>

int main() {
    int x = 5;
    int z;

    x--;
    z = x--;
    x = x-- + z--;
    --x;
}
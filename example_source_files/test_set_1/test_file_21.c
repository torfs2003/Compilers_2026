#include <stdio.h>

int main() {
    int x = 5;
    int z = x + 3;
    float f = 0.986312;
    float f2 = f * 33.0 + 2.0;
    char c = 'a';

    x = z * z * z * (x + x);
    f2 = f2 + f;
    c = 'b';
}
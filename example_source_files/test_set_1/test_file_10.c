#include <stdio.h>

int main() {
    int number = -55;
    int n;

    number++;
    number = number++;
    n = number++;

    n = n - n++;

    ++n;
}
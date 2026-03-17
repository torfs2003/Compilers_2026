#include <stdio.h>

int main() {
    int x = -60;
    int* some_pointer = &x;
    int** another_pointer;
    int*** triple_pointer;
    int y;

    *some_pointer = 53;
    another_pointer = &some_pointer;
    triple_pointer = &another_pointer;
    y = ***triple_pointer;
}
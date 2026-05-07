#include <stdio.h>

int main() {
    int x = 4;
    int y = 5;
    int* ptr = &x;
    int is_x;
    int is_y;
    float* ptr2 = 0;
    int num_skip_elements = 4;

    ptr++;
    ptr--;

    is_x = (ptr == &x);
    is_y = (ptr == &y);
    is_y = (&x != ptr);

    ptr2 >= ptr;
    ptr2 <= ptr;
    ptr > &x;
    ptr < 32;

    ptr = ptr + 4 * num_skip_elements;
}
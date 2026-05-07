#include <stdio.h>

int main() {
    char x = 'a';
    char* chr_ptr = &x;
    char another_char;

    *chr_ptr = 'b';
    another_char = *chr_ptr;
}
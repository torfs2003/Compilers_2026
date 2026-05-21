#include <stdio.h>
int main() {
    int** matrix = malloc(2 * 8);
    matrix[0] = malloc(2 * 4);
    matrix[0][1] = 5;
    free(matrix[0]);
    free(matrix);
}
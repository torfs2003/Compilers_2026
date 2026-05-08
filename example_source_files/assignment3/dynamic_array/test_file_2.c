#include <stdio.h>
int main() {
    int n;
    scanf("%d", &n);
    int* arr = malloc(n * 4);
    arr[0] = 100;
    printf("%d", arr[0]);
    free(arr);
}
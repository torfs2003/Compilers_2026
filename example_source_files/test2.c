int main() {
    int i = 42;
    float f = 3.14;
    char c = 'A';
    const int x = 100;
    int* p = &i;
    int** pp = &p;
    int value = **pp;
    const float* f_ptr = &f;
    f_ptr = &f;
    int casted_float = (int)f;
    p = p + 1;
    int diff = pp - pp;
    i++;
    --i;
    const int a = 5 * (10 / 2);
    int b = a + 5;
}
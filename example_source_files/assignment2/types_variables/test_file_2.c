int main() {
    int x = 5;
    int* p = &x;
    int** pp = &p;
    **pp = 10;
}
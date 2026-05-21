int main() {
    const int x = 5;
    const int* p1 = &x;
    int* p2 = p1;
    *p2 = 10;
    int y = x + 5;
}
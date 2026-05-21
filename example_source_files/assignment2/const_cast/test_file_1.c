int main() {
    const int x = 10;
    const int* ptr = &x;
    int* non_const_ptr = ptr; // De cast
}
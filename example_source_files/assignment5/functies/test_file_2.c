void print_val(int x); // Forward declaration
int main() {
    print_val(42);
    return 0;
}
void print_val(int x) { printf("%d", x); }
int optel(int a) { return a + 1; }
int main() {
    int (*ptr)(int) = &optel;
    int resultaat = (*ptr)(5); // Moet 6 zijn [cite: 517-518]
}
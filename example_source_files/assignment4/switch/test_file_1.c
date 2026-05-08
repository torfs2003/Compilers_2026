enum Color { RED, GREEN, BLUE }; // RED=0, GREEN=1, BLUE=2
int main() {
    enum Color my_color = GREEN;
    int val = my_color + 10; // Moet 11 zijn [cite: 302]
}
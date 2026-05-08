int main() {
    int x = 1;
    switch (x) {
        case 0: x = 10; break;
        case 1: 
            { int y = 5; x = y; } // Declaratie mag alleen in een scope [cite: 290-292]
            break;
        default: x = 0;
    }
}
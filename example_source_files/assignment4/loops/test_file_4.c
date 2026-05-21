int main() {
    for (int i = 0; i < 10; i++) {
        if (i == 5) continue; // Sla 5 over
        if (i == 8) break;    // Stop bij 8
        printf("%d", i);
    }
}
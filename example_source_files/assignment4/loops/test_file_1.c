int main() {
    int x = 10;
    if (x > 5) {
        int x = 20; // Masking van de buitenste x
        { // Anonymous scope
            int y = x + 5;
        }
        // y is hier niet meer bereikbaar
    } else {
        x = 0;
    }
}
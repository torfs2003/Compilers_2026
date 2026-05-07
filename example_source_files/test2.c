#include <stdio.h>

/* Binnenste struct */
struct Point {
    int x;
    int y;
};

/* Buitenste struct die de binnenste 'by value' bevat */
struct Rectangle {
    struct Point top_left;
    struct Point bottom_right;
    int area;
};

int main() {
    struct Rectangle rect;

    /* Waardes toewijzen via geneste member access (a.b.c) */
    rect.top_left.x = 0;
    rect.top_left.y = 10;
    
    rect.bottom_right.x = 20;
    rect.bottom_right.y = 0;

    /* Berekening maken met de geneste waardes */
    rect.area = (rect.bottom_right.x - rect.top_left.x) * (rect.top_left.y - rect.bottom_right.y);

    /* Printen om te verifiëren dat LLVM de juiste geheugenadressen pakt */
    printf("Top Left: (%d, %d)\n", rect.top_left.x, rect.top_left.y);
    printf("Bottom Right: (%d, %d)\n", rect.bottom_right.x, rect.bottom_right.y);
    printf("Area: %d\n", rect.area);

    return 0;
}
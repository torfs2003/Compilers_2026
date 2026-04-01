#ifndef SOME_HEADER2_H
#define SOME_HEADER2_H

int adjust_value(int x, int y) {
    int new_value = x;
    new_value += 6467;
    if (y) {
        return new_value * 2;
    }
    return new_value;
}

#endif
// test_dubbel_type.c
typedef int mijn_type;
typedef float mijn_type; // <-- Hier mag de parser wél door, maar de SemanticVisitor grijpt in!

int main() {
    return 0;
}
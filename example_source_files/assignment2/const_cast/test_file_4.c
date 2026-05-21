int main() {
    const char c = 'a';
    const char* p1 = &c;
    const char** p2 = &p1;
    char** mod_p2 = p2;
    **mod_p2 = 'b';
}
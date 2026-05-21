int main() {
    const float f = 0.5;
    const float* f_ptr = &f;
    float* mod_ptr = f_ptr;
    *mod_ptr = 1.5; // f moet nu 1.5 zijn
}
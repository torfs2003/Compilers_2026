// test file 64
typedef int leeftijd;

struct Persoon {
    leeftijd jaren;
    char initiaal;
};

int main() {
    // 1. EERST alle declaraties
    struct Persoon p;
    leeftijd* pointer; // <-- Verplaatst naar de top!
    
    // 2. DAN pas de uitvoerende statements
    p.jaren = 20;
    
    return 0;
}
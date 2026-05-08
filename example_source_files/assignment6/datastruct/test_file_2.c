struct Node { int val; };
int main() {
    struct Node* n = malloc(4); 
    n->val = 10; // Toegang via pointer [cite: 499]
}
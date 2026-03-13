#include <stdio.h>

/* ===================================================
 * COMPILER STRESSTEST
 * Test multi-dimensionele arrays, type checks,
 * I/O formatting en complexe index-wiskunde.
 * =================================================== */

int main() {
    // 1. Complexe Array Initialisaties (Test Semantic Analysis op lengte!)
    int matrix[2][3] = { {1, 2, 3}, {4, 5, 6} };
    float factoren[3] = { 1.5, -2.25, 3.14 };
    
    // 2. Strings en enkele karakters
    char succes_bericht[] = "Test succesvol afgerond!";
    char symbool = 'A';

    int i;
    int j;

    /* 3. Wiskunde in de array-index. 
       Dit test of jouw Semantic Analyser snapt dat de uitkomst een 'int' is! */
    i = (10 - 8) / 2; // i wordt 1
    j = i * 2;        // j wordt 2

    // 4. Geneste array lookups combineren met type casting 
    // matrix[1][2] = matrix[0][1] * 5 + (int)factoren[0]  -> (2 * 5 + 1 = 11)
    matrix[i][j] = matrix[0][1] * 5 + (int)factoren[0];

    // 5. Scanf met meerdere argumenten en types (decimaal én hexadecimaal)
    printf("Voer een decimaal en een hexadecimaal getal in (bijv. 10 FF): ");
    
    int dec_input;
    int hex_input;
    
    // Test of pointers correct worden doorgegeven via '&'
    scanf("%d %x", &dec_input, &hex_input);

    /* ===================================================
     * 6. De ultieme printf test
     * Alle verplichte format codes: %d, %x, %s, %f, %c, %%
     * =================================================== */
    printf("\n--- RESULTATEN ---\n");
    printf("Voortgang: 100%%\n");
    printf("Karakter (%%c): %c\n", symbool);
    printf("String   (%%s): %s\n", succes_bericht);
    printf("Float    (%%f): %f\n", factoren[2]);
    printf("Matrix   (%%d): matrix[%d][%d] = %d\n", i, j, matrix[i][j]);
    printf("Inputs       : Decimaal=%d, Hexadecimaal=%x\n", dec_input, hex_input);
}
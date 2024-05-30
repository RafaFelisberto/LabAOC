#include <stdio.h>

int MultiplyPower2(int x, int exp) {
    return x << exp;
}

int main() {
    int x = 5;
    int exp = 3;
    int result = MultiplyPower2(x, exp);
    printf("Result: %d\n", result);
    return 0;
}

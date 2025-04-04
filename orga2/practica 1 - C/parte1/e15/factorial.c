#include <stdio.h>
#include <stdlib.h>

long factorial(long n);

int main() {
    int n=5;

    long res = factorial((long) n);

    printf("%ld\n", res);
}


long factorial(long n) {
    for (int i = n-1;i>0;i--){
        n *= i;
    }
    if (n == 0) {
        n = 1;
    }
    return n;
}
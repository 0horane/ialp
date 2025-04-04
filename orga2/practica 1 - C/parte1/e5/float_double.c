#include <stdio.h>
#include <stdint.h>

int main(){
    float a = 0.1;
    double b = (double) a;

    printf("float: %f \n", a);
    printf("double: %f \n", b);

    printf("float -> int: %d \n", (int) a);
    printf("double -> int: %d \n", (int) b);

    return  0;
}
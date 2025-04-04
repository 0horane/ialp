#include <stdio.h>
#include <stdint.h>

int main(){

//shift signo, aritmetico
//shift unsignede, shift logico

    int a = 0xC0000000;
    int b = 0x00000003;

    printf("res: %x \n", (((unsigned int) a) >> 30) == ((unsigned int)b) );
    
    return  0;
}


#include <stdio.h>
#include <stdint.h>

int main(){
    char memoria[] = "Hola";
    for (int i = 0; memoria[i]!='\0';i++){
        if ('a' <= memoria[i] && memoria[i] <= 'z') {
            printf("%c", memoria[i]+'A'-'a');
        } else {
            printf("%c", memoria[i]);            
        }
    }
    printf("\n");

}
/* 3
x es el valor, &x es la posicion de memoria de x. &x == p. *p == x
van a imprimirse 
a 42
b a 
42
donde a,b son direcciones de memorias diferentes  

*/
#include <stdio.h>


#include <stdio.h>
int main(){
    int x = 42;
    int *p = &x;
    
    printf("Direccion de x: %p Valor: %d\n", (void*) &x, x);
    printf("Direccion de p: %p Valor: %p\n", (void*) &p, (void*) p);
    printf("Valor de lo que apunta p: %d\n", *p);
}
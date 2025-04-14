#include <stdio.h>
#include <stdint.h>
#include <string.h>

int main(){
    char str1[] = "Hola";
    char str3[] = "chau";
    char str2[10];
    strcpy(str2, str1);
    printf("%s\n", str2);
    strcat(str2,str3);
    printf("%s\n", str2);
    printf("%ld\n", strlen(str2));
    printf("%d\n", strcmp(str2,str1));


} // restrict simboliza que es un puntero exclusivo
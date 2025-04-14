#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "list.h"



int main(){
    list_t* l = listNew(TypeFAT32);
    fat32_t* f1 = new_fat32();
    fat32_t* f2 = new_fat32();
    listAddFirst(l, f1);
    listAddFirst(l, f2);
    listDelete(l);
    rm_fat32(f1);
    rm_fat32(f2);
    return 0;
} 


fat32_t* new_fat32() {
    fat32_t* res = malloc(sizeof(fat32_t));
    (*res) = (fat32_t) 0;
    return res;
}
fat32_t* copy_fat32(fat32_t* file){
    fat32_t* copy = malloc(sizeof(fat32_t));
    copy = file;
    return copy;
}
void rm_fat32(fat32_t* file){
    free(file);
}
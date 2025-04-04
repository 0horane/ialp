#include <stdio.h>


typedef struct {
    char* nombre;
    int vida;
    int ataque;
    int defensa;
} monstruo_t;
/*
struct monstruo_t {
    char* nombre;
    int vida;
    int ataque;
    int defensa;
};*/

monstruo_t evolution(monstruo_t);

int main(){

    monstruo_t monstruos[] = {
        {"babosa voladora", 70,34,1},
        {"espiritu del riachuelo", 12,88,30},
        {"Chileno", 56,6,32},
        {"esqueleto (desarmado)", 0,0,0}
    };

    for (int i = 0;i<4;i++){
        printf("%s tiene %d vida\n", monstruos[i].nombre, monstruos[i].vida);
    }

    printf("\n");

    printf("%s %d %d %d \n", monstruos[0].nombre, monstruos[0].defensa, monstruos[0].ataque, monstruos[0].vida);
    monstruo_t newmon = evolution(monstruos[0]);
    printf("%s %d %d %d \n", newmon.nombre, newmon.defensa, newmon.ataque, newmon.vida);



    return 0;
}

monstruo_t evolution(monstruo_t inmon){
    monstruo_t outmon = inmon;
    outmon.ataque+=10;
    outmon.defensa+=10;
    return outmon;
}

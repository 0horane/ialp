#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Estructuras.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
	
	packed_nodo_t b;
	packed_lista_t a;
	a.head = &b;
	b.arreglo = 1;
	b.categoria = 2;
	b.longitud = 3;
	b.next = NULL;

	printf("%d\n", cantidad_total_de_elementos_packed(&a));

	
}

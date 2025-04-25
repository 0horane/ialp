#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "Memoria.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
	char cadena[] = "Orga 2!";
	printf("%d\n", strCmp( "Orga 2!", cadena));

	char* str1 = "";
	char* str2 = strClone(str1);
	strPrint(str1, stdout);
	strPrint(str2, stdout);

	return 0;
}

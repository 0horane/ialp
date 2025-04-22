#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>

#include "../test-utils.h"
#include "ABI.h"

int main() {
	/* Acá pueden realizar sus propias pruebas */
	assert(alternate_sum_4_using_c(8, 2, 5, 1) == 10);

	assert(alternate_sum_4_using_c_alternative(8, 2, 5, 1) == 10);
	printf("%d\n", alternate_sum_8(1, 2, 3, 4, 5, 6, 7, 8));
	assert(alternate_sum_8(1, 2, 3, 4, 5, 6, 7, 8) == -4);
	int res = 0;
	product_2_f(&res, 10, 1.51);
	printf("%d\n", res);
	//assert(res == 15);

	//return 0;
}

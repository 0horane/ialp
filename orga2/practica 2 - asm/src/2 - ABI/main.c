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
	uint32_t res = 0;
	product_2_f(&res, 460, 846.24); //389270
	printf("res1:%d\n", res);
	double res2 = 0;
	product_9_f(&res2, 2,4, 1,8, 16,1, 1,1, 1,1, 1,1, 1,1, 2,2, 2,2);//469, 358.77, 870, 120.19, 7, 831.74, 509, 486.58, 220, 581.67, 825, 105.33, 664, 724.20, 259, 441.43, 355, 843.41); //
	printf("res2:%f\n", res2);
	assert( res2 == 4643989417025369021970054862590782724840095744.);
	//assert(res == 15);

	//return 0;
}

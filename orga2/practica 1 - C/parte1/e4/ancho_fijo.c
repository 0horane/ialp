#include <stdio.h>
#include <stdint.h>

int main(){
    int8_t a = -1;
    uint8_t b = -2;
    int16_t c = -3;
    uint16_t d = 4;
    int32_t e = -5;
    uint32_t f = -6;
    int64_t g = -7;
    uint64_t h = -8;

    printf("int8_t(%lu): %d \n", sizeof(a),a);
    printf("uint8_t(%lu): %o \n", sizeof(b),b);
    printf("int16_t(%lu): %d \n", sizeof(c),c);
    printf("uint16_t(%lu): %o \n", sizeof(d),d);
    printf("int32_t(%lu): %d \n", sizeof(e),e);
    printf("uint32_t(%lu): %o \n", sizeof(f),f);
    printf("int64_t(%lu): %ld \n", sizeof(g),g);
    printf("uint64_t(%lu): %lo \n", sizeof(h),h);

    return  0;
}
#include <stdio.h>
#include <stdbool.h>

int main(){
    char a = -1;
    unsigned char b = -2;
    short c = -3;
    unsigned short d = 4;
    int e = -5;
    unsigned int f = -6;
    long g = -7;
    unsigned long h = -8;
    long long i = 9;
    unsigned long long j = -10;
    bool k = -10;
    float l = -10;
    double m = -10;
    long double n = -10;
        
    char* a1 = (char*) 1;
    unsigned char* b1 = (unsigned char*) 2;
    short* o = (short*) 3;
    unsigned short* p = (unsigned short*) 4;
    int* q = (int*) 5;
    unsigned int* r = (unsigned int*) 6;
    long* s = (long*) 7;
    unsigned long* t = (unsigned long*) 8;
    long long* u = (long long*) 9;
    unsigned long long* v = (unsigned long long*) 10;
    bool* w = (bool*) 10;
    float* x = (float*) -0;
    double* y = (double*) 10;
    long double* z = (long double*) 10;


    printf("char(%lu): %d \n", sizeof(a),a);
    printf("unsigned char(%lu): %o \n", sizeof(b),b);
    printf("short(%lu): %d \n", sizeof(c),c);
    printf("unsigned short(%lu): %o \n", sizeof(d),d);
    printf("int(%lu): %d \n", sizeof(e),e);
    printf("unsigned int(%lu): %o \n", sizeof(f),f);
    printf("long(%lu): %ld \n", sizeof(g),g);
    printf("unsigned long(%lu): %lo \n", sizeof(h),h);
    printf("long long(%lu): %lld \n", sizeof(i),i);
    printf("unsigned long long(%lu): %llo \n", sizeof(j),j);
    printf("bool(%lu): %d \n", sizeof(k),k);
    printf("float(%lu): %f \n", sizeof(l),l);
    printf("double(%lu): %f \n", sizeof(m),m);
    printf("long double(%lu): %Lf \n", sizeof(n),n);

    printf("char*(%lu): %p \n", sizeof(a1),(void*)a1);
    printf("unsigned char*(%lu): %p \n", sizeof(b1),(void*)b1);
    printf("short*(%lu): %p \n", sizeof(o),(void*)o);
    printf("unsigned short*(%lu): %p \n", sizeof(p),(void*)p);
    printf("int*(%lu): %p \n", sizeof(q),(void*)q);
    printf("unsigned int*(%lu): %p \n", sizeof(r),(void*)r);
    printf("long*(%lu): %p \n", sizeof(s),(void*)s);
    printf("unsigned long*(%lu): %p \n", sizeof(t),(void*)t);
    printf("long long*(%lu): %p \n", sizeof(u),(void*)u);
    printf("unsigned long long*(%lu): %p \n", sizeof(v),(void*)v);
    printf("bool*(%lu): %p \n", sizeof(w),(void*)w);
    printf("float*(%lu): %p \n", sizeof(x),(void*)x);
    printf("double*(%lu): %p \n", sizeof(y),(void*)y);
    printf("long double*(%lu): %p \n", sizeof(z),(void*)z);

    return  0;
}
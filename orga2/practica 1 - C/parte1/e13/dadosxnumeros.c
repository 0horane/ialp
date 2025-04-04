#include <stdio.h>
#include <stdlib.h>
int main() {
    int arr[6] = {0};

    for (int i = 0; i < 60000000; i++){
        arr[rand() % 6] += 1;
    }

    printf("[");
    for (int i = 0; i < 6; i++){
        printf("%d, ", arr[i]);
    }
    printf("]\n");
}
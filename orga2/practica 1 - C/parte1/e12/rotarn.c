#include <stdio.h>
    int main() {
    int arr[] = {1,2,3,4};
    int length = 4;
    int rotlen = 2;
    
    for (int j = 0; j < rotlen; j++){
        int v1 = arr[0];
        for (int i = 1; i < length; i++){
            arr[i-1] = arr[i];
        }
        arr[length-1] = v1;
    }

    printf("[");
    for (int i = 0; i < length; i++){
        printf("%d, ", arr[i]);
    }
    printf("]\n");
}
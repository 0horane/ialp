#include "list.h"
#include <stdlib.h>

list_t* listNew(type_t t) {
    list_t* l = malloc(sizeof(list_t));
    l->type = t; // l->type es equivalente a (*l).type
    l->size = 0;
    l->first = NULL;
    l->last = NULL;
    return l;
}

void interCambiarNodos(list_t* l, uint8_t i1, uint8_t i2 ){
    if (l->size == 0 || l->first == l->last){
        return;
    }
    if (i1 > i2) {
        uint8_t tmp = i1;
        i1 = i2;
        i2 = tmp;
    }

    node_t* n1 = l->first;
    for(uint8_t j = 0; j < i1; j++)
        n1 = n1->next;

    node_t* n2 = l->first;
    for(uint8_t j = 0; j < i2; j++)
        n2 = n2->next;

    
    if (n2->next != NULL) {
        n2->next->prev = n1;
    }
    if (n1->prev != NULL) {
        n1->prev->next = n2;
    }
    if (n1 == l->first){
        l->first = n2;
    }
    if (n2 == l->last){
        l->last = n1;
    }
    if (n2 == n1->next){
        node_t* n2nexttmp = n2->next;
        n2->next = n1;
        n2->prev = n1->prev;
        n1->next = n2nexttmp;
        n1->prev = n2;
    } else {
        node_t* n2nexttmp = n2->next;
        node_t* n2prevtmp = n2->prev;
        n2->next = n1->next;
        n2->prev = n1->prev;
        n1->next = n2nexttmp;
        n1->prev = n2prevtmp;
    }


}

void listAddFirst(list_t* l, void* data) {
    node_t* n = malloc(sizeof(node_t));
    switch(l->type) {
        case TypeFAT32:
            n->data = (void*) copy_fat32((fat32_t*) data);
            break;
        case TypeEXT4:
            n->data = (void*) copy_ext4((ext4_t*) data);
            break;
        case TypeNTFS:
            n->data = (void*) copy_ntfs((ntfs_t*) data);
            break;
    }
    n->prev = NULL;
    n->next = l->first;
    l->first = n;
    if (l->last == NULL) {
        l->last = n;
    }
    l->size++;
}

void listAddLast(list_t* l, void* data) {
    node_t* n = malloc(sizeof(node_t));
    switch(l->type) {
        case TypeFAT32:
            n->data = (void*) copy_fat32((fat32_t*) data);
            break;
        case TypeEXT4:
            n->data = (void*) copy_ext4((ext4_t*) data);
            break;
        case TypeNTFS:
            n->data = (void*) copy_ntfs((ntfs_t*) data);
            break;
    }
    n->prev = l->first;
    n->next = NULL;
    if (l->first == NULL) {
        l->first = n;
    }
    l->size++;
}

//se asume: i < l->size
void* listGet(list_t* l, uint8_t i){
    node_t* n = l->first;
    for(uint8_t j = 0; j < i; j++)
        n = n->next;
    return n->data;
}

//se asume: i < l->size
void* listRemove(list_t* l, uint8_t i){
node_t* tmp = NULL;
    void* data = NULL;
    if(i == 0){
        data = l->first->data;
        tmp = l->first;
        l->first = l->first->next;
    } else {
        node_t* n = l->first;
        for(uint8_t j = 0; j < i - 1; j++)
            n = n->next;
        data = n->next->data;
        tmp = n->next;
        n->next = n->next->next;
        if (tmp == l->last){
            l->last = n;
        } else {
            n->next->prev = n;
        }
    }
    free(tmp);
    l->size--;
    if (l->size == 0){
        l->first = NULL;
        l->last = NULL;
    }
    return data;
}


void listDelete(list_t* l){
    node_t* n = l->first;
    while(n){
        node_t* tmp = n;
        n = n->next;
        switch(l->type) {
            case TypeFAT32:
                rm_fat32((fat32_t*) tmp->data);
                break;
            case TypeEXT4:
                rm_ext4((ext4_t*) tmp->data);
                break;
            case TypeNTFS:
                rm_ntfs((ntfs_t*) tmp->data);
                break;
        }
        free(tmp);
    }
    free(l);
}
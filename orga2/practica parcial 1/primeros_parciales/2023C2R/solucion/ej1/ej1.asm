; /** defines bool y puntero **/
%define NULL 0
%define TRUE 1
%define FALSE 0

section .data

section .text

global string_proc_list_create_asm
global string_proc_node_create_asm
global string_proc_list_add_node_asm
global string_proc_list_concat_asm

; FUNCIONES auxiliares que pueden llegar a necesitar:
extern malloc
extern free
extern str_concat


string_proc_list_create_asm:
    push rbp
    mov rbp, rsp

    mov rdi, 16
    call malloc
    mov qword [rax], NULL
    mov qword [rax + 8], NULL

    pop rbp
    ret

string_proc_node_create_asm:
    push rbp
    mov rbp, rsp
    push rdi
    push rsi

    mov rdi, 32
    call malloc
    mov qword [rax], NULL
    mov qword [rax + 8], NULL
    pop rsi
    pop rdi
    mov byte [rax+16], dil
    mov [rax+24], rsi
    

    pop rbp
    ret


string_proc_list_add_node_asm:
    push rbp
    mov rbp, rsp

    push rdi ; listptr
    push rsi ;type
    push rdx ;hashptr
    sub rsp, 8

    mov rdi, rsi
    mov rsi, rdx
    call string_proc_node_create_asm ; rax nodeptr
    add rsp, 8
    pop rdx 
    pop rsi
    pop rdi
    cmp qword [rdi], 0
    je .lista_vacia 
    mov r10, [rdi + 8] ; mover puntero de final de lista a prev de nodo nuevo
    mov [rax + 8], r10 

    mov [r10], rax ; agregar puntero next a ultimo elemento de la lista

    mov [rdi + 8], rax  ; volver el nuevo elemento el ultimo de la lista 
    jmp .fin

    .lista_vacia:
    mov [rdi + 8], rax  ; volver el nuevo elemento el ultimo de la lista 
    mov [rdi + 0], rax  ; volver el nuevo elemento el ultimo de la lista 


    .fin:
    pop rbp
    ret


string_proc_list_concat_asm:
    push rbp ; 
    push rdi ; lista*
    push rsi ; tipo 
    push rdx ; hash*
    sub rsp, 8

    mov rbp, rsp
    mov r10, 1 ; total length, contando \0

    .small_loop:
    cmp byte [rdx], 0 
    je .small_loop_end
    inc rdx
    inc r10
    jmp .small_loop
    .small_loop_end:
    
    
    mov r11, [rdi] ; pos actual en lista enlazada
    .big_loop:
        cmp r11, 0
        je .big_loop_end
        cmp byte [r11 + 16], sil  
        jne .inner_loop_end
        mov r8, [r11 + 24] ; str ptr
        .inner_loop:
            cmp byte [r8], 0 
            je .inner_loop_end
            inc r8
            inc r10
            jmp .inner_loop
        .inner_loop_end:
        mov r11, [r11]
        jmp .big_loop
    .big_loop_end:

    mov rdi, r10
    call malloc

    add rsp, 8
    pop rdx
    pop rsi
    pop rdi
    mov r10, rax

    .small_loop2:
    cmp byte [rdx], 0 
    je .small_loop_end2
    mov r9b, byte [rdx]
    mov byte [rax], r9b
    inc rdx
    inc rax
    jmp .small_loop2
    .small_loop_end2:

    mov r11, [rdi] ; pos actual en lista enlazada
    .big_loop2:
        cmp r11, 0
        je .big_loop_end2
        cmp byte [r11 + 16], sil  
        jne .inner_loop_end2
        mov r8, [r11 + 24] ; str ptr
        .inner_loop2:
            cmp byte [r8], 0 
            je .inner_loop_end2
            mov r9b, byte [r8]
            mov byte [rax], r9b
            inc r8
            inc rax
            jmp .inner_loop2
        .inner_loop_end2:
        mov r11, [r11]
        jmp .big_loop2
    .big_loop_end2:
    
    mov byte [rax], 0

    mov rax, r10

    pop rbp
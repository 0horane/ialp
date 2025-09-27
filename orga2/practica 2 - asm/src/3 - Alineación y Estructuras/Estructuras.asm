

;########### ESTOS SON LOS OFFSETS Y TAMAÑO DE LOS STRUCTS
; Completar las definiciones (serán revisadas por ABI enforcer):
NODO_OFFSET_NEXT EQU 0
NODO_OFFSET_CATEGORIA EQU 8
NODO_OFFSET_ARREGLO EQU 16
NODO_OFFSET_LONGITUD EQU 24
NODO_SIZE EQU 32

PACKED_NODO_OFFSET_NEXT EQU 0
PACKED_NODO_OFFSET_CATEGORIA EQU 8
PACKED_NODO_OFFSET_ARREGLO EQU 9
PACKED_NODO_OFFSET_LONGITUD EQU 17
PACKED_NODO_SIZE EQU 21

LISTA_OFFSET_HEAD EQU 0
LISTA_SIZE EQU 8

PACKED_LISTA_OFFSET_HEAD EQU 0
PACKED_LISTA_SIZE EQU 8

;########### SECCION DE DATOS
section .data

;########### SECCION DE TEXTO (PROGRAMA)
section .text

;########### LISTA DE FUNCIONES EXPORTADAS
global cantidad_total_de_elementos
global cantidad_total_de_elementos_packed

;########### DEFINICION DE FUNCIONES
;extern uint32_t cantidad_total_de_elementos(lista_t* lista);
;registros: lista[RDI]
cantidad_total_de_elementos:
	mov R11, [RDI]
	mov EAX, 0 
	cantidad_total_de_elementos_bucle:
		cmp R11, 0
		je cantidad_total_de_elementos_fin
		ADD EAX, [R11 + 24]
		MOV R11,[R11]
		JMP cantidad_total_de_elementos_bucle
	
	cantidad_total_de_elementos_fin:
	ret

;extern uint32_t cantidad_total_de_elementos_packed(packed_lista_t* lista);
;registros: lista[RDI]
cantidad_total_de_elementos_packed:
    push RBP
	mov RBP, RSP 
	mov R11, [RDI]
	mov RAX, 0 
	cantidad_total_de_elementos_packed_bucle:
		cmp R11, 0
		je cantidad_total_de_elementos_packed_fin
		; ADD DWORD RAX [R11 + 17] ; POR QUE NO VALE??????
		mov  r10d, dword [R11 + 17]
		ADD EAX, r10d
		MOV R11, [R11]
		JMP cantidad_total_de_elementos_packed_bucle
	
	cantidad_total_de_elementos_packed_fin:
	pop rbp
	ret
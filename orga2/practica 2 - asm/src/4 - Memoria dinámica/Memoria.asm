extern malloc
extern free
extern fprintf

section .data
nullmsg db 'NULL',0


section .text

global strCmp
global strClone
global strDelete
global strPrint
global strLen

; ** String **

; int32_t strCmp(char* a, char* b)
strCmp:
	push rbp
	mov rbp, rsp
	
	strCmp_start:
	
	cmp byte [RDI], 0
	je strCmp_RDI_is_0

	cmp byte [RSI], 0
	je strCmp_Greater

	mov r10b, byte [RSI]
	cmp byte [RDI], r10b
	jg strCmp_Greater
	jl strCmp_Lesser
	
	ADD RSI, 1
	ADD RDI, 1
	JMP strCmp_start

	strCmp_RDI_is_0:
	cmp byte [RSI], 0
	je strCmp_Equals
	jne strCmp_Lesser

	strCmp_Lesser:
	mov rax, 1
	JMP strCmp_end

	strCmp_Greater:
	mov rax, -1
	JMP strCmp_end

	strCmp_Equals:
	mov rax, 0
	JMP strCmp_end


	strCmp_end:
	pop rbp
	ret

; char* strClone(char* a)
strClone:
	push rbp 
	mov rbp, rsp

	push rdi
	sub rsp, 8

	call strLen

	mov rdi,rax
	INC rdi
	call malloc
	mov r10,rax

	add rsp, 8  
	pop r11    ; r10 = strNuevo, r11 = strViejo
	
	strClone_loop:
		mov dil, byte [r11]
		mov byte [r10], dil
		add r10, 1
		add r11, 1
		cmp dil, 0 
		jne strClone_loop

	pop rbp
	ret

; void strDelete(char* a)
strDelete: ; jmp free tambien sirve sin preludio etc
	push rbp
	mov rbp, rsp

	call free

	pop rbp
	ret

; void strPrint(char* a, FILE* pFile)
strPrint:
	push rbp
	mov rbp, rsp



	push rdi 
	push rsi
	call strLen

	mov rdx, rax
	pop rdi ; prev rsi
	mov rdi, 1
	pop rsi ; what was previously rdi
	cmp rdx, 0
	mov r10, nullmsg
	cmove rsi, r10
	mov r10, 4
	cmove rdx, r10


	; int(errupt) 80h = syscall. syscall(callnumber 1, stdout descriptor, string address, string length) 
	mov rax, 1

	syscall
	

	pop rbp
	ret





; uint32_t strLen(char* a)
strLen:
	push rbp 
	mov rbp, rsp

	mov rax,-1
	
	strLen_loop:
		mov r10b, byte [RDI]
		add RDI, 1
		add rax, 1
		cmp r10b, 0 
		jne strLen_loop

	pop rbp
	ret

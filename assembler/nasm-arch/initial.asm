; Enter the assembly language program from this chapter and assem­      ;
; ble and link it. Then execute the program and enter echo $?. A       ;
; non-zero status indicates an error. Change the program to yield a    ;
; 0 status.                                                            ;

section 	.data

section 	.text
	global _start

_start:
	mov 	rax, 1
	mov 	rbx, 0
	int 	0x80
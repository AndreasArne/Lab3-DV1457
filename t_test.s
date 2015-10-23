.section .text

.globl main

main:
	pushl 	$4
	pushl   $5
	pop		%edi
	pop     %eax
	sub		%edi, %eax
	pushl	%eax
	pushl 	$msg
	call 	printf
	;addl 	$8,%esp

	pushl 	$0
	call	exit		

msg:
	.asciz "%d"

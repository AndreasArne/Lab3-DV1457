.section .data
prnt_int:
	.asciz "%d\n"
.section .text
.globl main
main:	
	pushl	$100
	popl	%eax
L000:
	pushl	%eax
	pushl	$0
	popl	%edx
	popl	%eax
	cmp	%eax, %edx
	jge	L001

	pushl 	%eax
	movl	%esp, %ebx
	pushl	$prnt_int
	call	printf
	movl 	%ebx, %esp
	popl	%eax
	pushl	%eax
	pushl	$1
	popl	%ebx
	popl	%eax
	sub	%ebx, %eax
	pushl	%eax
	popl	%eax
	jmp	L000
L001:
	call exit
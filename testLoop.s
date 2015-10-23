.section .data
prnt_int:
	.asciz "%d\n"
	.section .text
	.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	sub $12, %esp

	pushl	$100
	popl	-4(%ebp)
L000:
	pushl	-4(%ebp)
	pushl	$0
	popl	%edx
	popl	%eax
	cmp	%eax, %edx
	jge	L001
	pushl	-4(%ebp)
	movl	%esp, %ebx
	pushl	$prnt_int
	call	printf
	movl	%ebx, %esp
	addl	$4, %esp
	pushl	-4(%ebp)
	pushl	$1
	popl	%ebx
	popl	%eax
	sub	%ebx, %eax
	pushl	%eax
	popl	-4(%ebp)
	jmp	L000
L001:
	movl %ebp, %esp
	pop %ebp
	call exit
.section .data
prnt_int:
	.asciz "%d\n"
	.section .text
	.globl main
main:
	pushl %ebp
	movl %esp, %ebp
	sub $12, %esp
	
	pushl	$1000000
	popl	-56(%ebp)
	pushl	$100000000
	popl	-76(%ebp)
	pushl	$0
	popl	-4(%ebp)
L000:
	pushl	-56(%ebp)
	pushl	$0
	popl	%edx
	popl	%eax
	cmp	%edx,%eax
	jle	L001
	pushl	-4(%ebp)
	pushl	-76(%ebp)
	pushl	-56(%ebp)
	popl	%ebx
	popl	%eax
	div	%ebx
	pushl	%eax
	popl	%ebx
	popl	%eax
	add	%ebx, %eax
	pushl	%eax
	popl	-4(%ebp)
	pushl	-56(%ebp)
	pushl	$1
	popl	%ebx
	popl	%eax
	sub	%ebx, %eax
	pushl	%eax
	popl	-56(%ebp)
	jmp	L000
L001:
	pushl	-4(%ebp)
	pushl	-76(%ebp)
	pushl	$1000
	popl	%ebx
	popl	%eax
	div	%ebx
	pushl	%eax
	popl	%ebx
	popl	%eax
	div	%ebx
	pushl	%eax
	movl	%esp, %ebx
	pushl	$prnt_int
	call	printf
	movl	%ebx, %esp
	addl	$4, %esp

	movl %esp, %ebp
	pop %ebp
	call exit
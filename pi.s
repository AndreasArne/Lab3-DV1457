.section .data
prnt_int:
	.asciz "%d\n"
	.section .text
	.globl main
main:
	pushl %ebp
	movl %esp, %ebp	

	pushl	$1000001
	popl	-56(%ebp)
	pushl	$100000000
	popl	-76(%ebp)
	pushl	$0
	popl	-4(%ebp)
	pushl	$0
	popl	-80(%ebp)
L000:
	pushl	-56(%ebp)
	pushl	$0
	popl	%edx
	popl	%eax
	cmp	%edx,%eax
	jle	L001
	pushl	-80(%ebp)
	pushl	$0
	popl	%eax
	popl	%ebx
	cmp	%ebx, %eax
	jne	L002
	pushl	-56(%ebp)
	popl	-16(%ebp)
	pushl	$1
	popl	-80(%ebp)
	jmp	L003
L002:
	pushl	-56(%ebp)
	popl	%eax
	neg	%eax
	pushl	%eax
	popl	-16(%ebp)
	pushl	$0
	popl	-80(%ebp)
L003:
	pushl	-4(%ebp)
	pushl	-76(%ebp)
	pushl	-16(%ebp)
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
	pushl	$2
	popl	%ebx
	popl	%eax
	sub	%ebx, %eax
	pushl	%eax
	popl	-56(%ebp)
	jmp	L000
L001:
	pushl	-4(%ebp)
	pushl	-76(%ebp)
	pushl	$100000
	popl	%ebx
	popl	%eax
	div	%ebx
	pushl	%eax
	popl	%ebx
	popl	%eax
	div	%ebx
	pushl	%eax
	pushl	$4
	popl	%ebx
	popl	%eax
	imull	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$4, %esp

	movl %ebp, %esp
	popl %ebp
	call exit
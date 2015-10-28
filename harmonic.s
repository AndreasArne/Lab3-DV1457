.section .data
prnt_int:
	.asciz "%d\n"
.section .text
fact:
	movl 	4(%esp), %ecx
	movl 	$1, %eax
	cmpb 	$0,%cl
	jle 	done
do_fact:
	mull 	%ecx
	cmpb 	$0,%cl
	dec		%ecx
	jle 	done
	jmp 	do_fact
done:
	ret
.global main
main:
	pushl %ebp
	movl %esp, %ebp
sub	$100, %esp
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
	cmp	%edx, %eax
	jle	L001
	pushl	-4(%ebp)
	pushl	-76(%ebp)
	pushl	-56(%ebp)
	popl	%ebx
	popl	%eax
	idivl	%ebx
	pushl	%eax
	popl	%ebx
	popl	%eax
	addl	%ebx, %eax
	pushl	%eax
	popl	-4(%ebp)
	pushl	-56(%ebp)
	pushl	$1
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	popl	-56(%ebp)
	jmp	L000
L001:
	pushl	-4(%ebp)
	pushl	-76(%ebp)
	pushl	$1000
	popl	%ebx
	popl	%eax
	idivl	%ebx
	pushl	%eax
	popl	%ebx
	popl	%eax
	idivl	%ebx
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	movl %ebp, %esp
	popl %ebp
	call exit

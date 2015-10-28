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
	pushl	$100
	popl	-36(%ebp)
L000:
	pushl	-36(%ebp)
	pushl	$0
	popl	%edx
	popl	%eax
	cmp	%edx, %eax
	jl	L001
	pushl	-36(%ebp)
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	-36(%ebp)
	pushl	$1
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	popl	-36(%ebp)
	jmp	L000
L001:
	movl %ebp, %esp
	popl %ebp
	call exit

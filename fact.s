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
	pushl	$0
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$1
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$1
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$1
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$2
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$2
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$3
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$6
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$4
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$24
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$5
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$120
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$6
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$720
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$7
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$5040
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$8
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$40320
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$9
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$362880
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$10
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$3628800
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	pushl	$11
	call	fact
	addl	$4,%esp
	pushl	%eax
	pushl	$39916800
	popl	%ebx
	popl	%eax
	subl	%ebx, %eax
	pushl	%eax
	pushl	$prnt_int
	call	printf
	addl	$8, %esp
	movl %ebp, %esp
	popl %ebp
	call exit

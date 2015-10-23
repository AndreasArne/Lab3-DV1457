.section .data
prnt_int:
	.asciz "%d"
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
	pushl	$100
	popl	%eax
L000:
	pushl	i
	pushl	$0
	popl	%edx
	popl	%eax
	cmp	%eax, %edx
	jge	L001
	pushl	i
	pushl	$prnt_int
	call	printf
	addl	$4, %esp
	pushl	i
	pushl	$1
	popl	%ebx
	popl	%eax
	sub	%ebx, %eax
	pushl	%eax
	popl	%eax
	jmp	L000
L001:
	jmp end
end:
	call exit

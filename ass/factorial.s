.section .text
factorial:
	mull %ecx
	loop factorial
	jmp end

.globl main
main:
	movl $1, %eax
	movl $5, %ecx
	cmpl $0, %ecx
	je end
	jmp factorial
end:
	pushl %eax
	call exit

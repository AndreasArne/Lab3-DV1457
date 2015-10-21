fact:
	mull %ecx
	loop fact
	jmp fact_end
fact_end:
	ret
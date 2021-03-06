segment .data
a:	dq	0
b:	dq	0
c:	dq	0


fmt_in:		db	"%lld %lld",0
fmt_out:	db	"%lld",10,0

segment .bss


segment .text
global main
extern printf,scanf

main:
	push RBP


	mov RDI,fmt_in
	mov RSI,a
	mov RDX,b
	call scanf
	
	mov RBX,[a]
	mov RCX,[b]

	cmp RCX,0
	jne GCD

	mov RAX,0
	jmp PRINT_LCM	
	
	GCD:
	mov RAX,RBX
	mov RDX,0
	div RCX

	cmp RDX,0
	je FIND_LCM
	
	mov RBX,RCX
	mov RCX,RDX
	jmp GCD

	FIND_LCM:		; GCD is at RCX
	mov RAX,[a]
	imul RAX,[b]		; product is at RAX
				; lcm = RAX / RCX
	mov RDX,0
	div RCX
	
	PRINT_LCM:
	mov RDI,fmt_out
	mov RSI,RAX
	call printf


END:
	pop RBP
	ret

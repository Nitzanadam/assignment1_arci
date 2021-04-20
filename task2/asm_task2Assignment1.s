section	.rodata			; we define (global) read-only variables in .rodata section
	format_string: db "%s", 10, 0	; format string

section .bss			; we define (global) uninitialized variables in .bss section
	an: resb 12			; enough to store integer in [-2,147,483,648 (-2^31) : 2,147,483,647 (2^31-1)]
	i: resb 12			; run of each digit of the string
	b: resb 12    ;run on each char of the string from the user 
	
section .text
	global convertor
	extern printf

convertor:
	push ebp
	mov ebp, esp	
	pushad			

	mov ecx, dword [ebp+8]	; get function argument (pointer to string)
	mov byte[an], 0
	
q_label:
	cmp byte[ecx], "q" 
	JE end_label	

	
myLoop:	
	cmp byte[ecx], 0
	JE finish

	mov byte[i], 0

	

	inc ecx

forBit:	
	cmp byte[i], 4
	JE myLoop
	bt ecx, 0
	jc print0 
	jnc print1

print0:
	push 0; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call
	inc byte[i]

print1:
	push 1; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call
	inc byte[i]

end_label:
	mov byte[an], 2

	
finish:
	push an			; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call

	popad			
	mov esp, ebp	
	pop ebp
	ret

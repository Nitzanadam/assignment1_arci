section	.rodata			    ; we define (global) read-only variables in .rodata section
	format_string: db "%d", 10, 0	; format string

section .bss                  ;we define (global) initialized variables in .data section

section .text                 ;we write code in .text section 
     global assFunc 
     extern printf
     extern c_checkValidity   ;define as en external function

assFunc:                                             
    push ebp               ;establishing stack-frame
    mov ebp, esp             ;reset EBP to the current ESP
    pushad                   ;backup registers
    mov ecx, [ebp+8]         ;get function argument on stack
    push ecx
    call c_checkValidity     ;call function to check if the number is even
    add esp, 4               ;"free" space allocated for function arguments in stack (free x)
    cmp eax, 1                ;compare between result to 1
    JE is_One                ;if is equel go to is_one
    JNE is_Zero              ; is is not equal go to is_zero
    
endOfFunc:
    push ecx
    push format_string
    call printf
    add esp, 8               ; clean up stack after call
    popad			
	mov esp, ebp	
	pop ebp
	ret

is_One:
    shl ecx, 2
    jmp endOfFunc


is_Zero:
    shl ecx, 3
    jmp endOfFunc


  



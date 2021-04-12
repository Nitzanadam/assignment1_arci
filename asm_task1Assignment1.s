section	.rodata			    ; we define (global) read-only variables in .rodata section
	format_string: db "%d", 10, 0	; format string

section .bss                  ;we define (global) initialized variables in .data section
    result resq 1             ;we allocated place of 8 byte(resq) to result
    z resq 1                  ;we allocated place of 8 byte to z  

section .text                 ;we write code in .text section 
     global assFunc 
     extern printf
     extern c_checkValidity   ;define as en external function

assFunc:                                             
    push   ebp               ;establishing stack-frame
    mov ebp, esp             ;reset EBP to the current ESP
    pushad                   ;backup registers
    ;check if we need to push here the arguments of the function 
    mov eax, [ebp+4]        ;get function argument on stack
    call c_checkValidity    ;call function to check if the number is even 
    mov [result], eax       ;save the function result to result
    


    add esp, 4              ;"free" space allocated for function arguments in stack (free x)
    cmp dword[result], 1     ;compare between result to 1
    JE is_One               ;if is equel go to is_one
    JNE is_Zero             ; is is not equal go to is_zero
endOfFunc:
    push z
    push format_string
    call printf
    add esp, 8               ; clean up stack after call
    popad			
	mov esp, ebp	
	pop ebp
	ret

is_One:
    shl dword[result], 2
    mov dword[z], result
    jmp endOfFunc

is_Zero:
    shl dword[result], 3
    mov dword[z], result
    jmp endOfFunc


  



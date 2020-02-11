%macro macro1 3 
   mov    ecx, %1
   mov    esi, %2
   mov    edi, %3
   %endmacro
global _start            

section	.text
   	
_start:	

   jmp addition

reverse:

macro1 len1,number,number_reverse
loop_here:
   lodsb
   push ax
   loop    loop_here
   pop bx
   mov ecx,len1
   dec ecx

check_palindrom:

   pop ax
   stosb
   loop check_palindrom
   mov al,bl
   stosb
   cld
   rep	movsb 
   macro1 len1,number,number_reverse
   cld
   repe  cmpsb
   jecxz  display 
  
addition:

   mov     ecx, len2 
   mov esi,len1
   dec esi 
   dec esi
   clc

add_loop:

   mov 	al, [number + esi]
   adc 	al, '1'
   aaa
   or al,'0'
   mov	[number + esi], al
   cmp al,'0'
   jne reverse
   dec esi
   loop	add_loop

display:

   mov eax, 4
   mov ebx, 1
   mov ecx, number
   mov edx, len1
   int 80h

exit:

   mov eax, 1
   mov ebx, 0
   int 80h
	        
section	.data
number db '2133',0 
len1 equ $-number
section	 .bss
number_reverse resb	20
len2 equ $-number_reverse

; Ascii Program
; Compile with: nasm -f elf32 -g -F dwarf -o ascii.o ascii.asm
; Link with: ld -m elf_i386 -o ascii ascii.o
; Run with: ./ascii


        SECTION .bss

        SECTION .data

        array dd 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A
        arraylen equ ($ - array) / 4            

        SECTION .text

        global _start

_start:

        mov     esi, array                      ; get pointer to array
        mov     edi, arraylen - 1              

PrintArray:
        mov     edx, 1                         

        mov     eax, [esi]                      ; get current array element

        and     eax, 0xF0                       ; isolate the first four bits then shift
        shr     eax, 4

        cmp     eax, 10                         ; checks if eax is less than 10 to see if it's an integer
        jl      NumOne
        add     eax, 0x37                      
        jmp     BothOne
NumOne:
        add     eax, 0x30                      
BothOne:

        mov     ecx, eax
        push    ecx                             ; push to stack since we need an address of item to print
        mov     ecx, esp                        ; mov address of char to ecx
        mov     ebx, 1
        mov     eax, 4
        int     80h                            

        mov     eax, [esi]                      ; get current array element

        and     eax, 0x0F                       : isolate the second four bits

        cmp     eax, 10                         ; checks if eax is less than 10 to see if it's an integer
        jl      NumTwo
        add     eax, 0x37                       ; adds 0x30 to get to int
        jmp     BothTwo
NumTwo:
        add     eax, 0x30                       ; adds 0x30 to get to int
BothTwo:

        mov     ecx, eax

        push    ecx                             ; push to stack since we need an address of item to print
        mov     ecx, esp                        ; mov address of char to ecx
        mov     ebx, 1
        mov     eax, 4
        int     80h                             ; print

        pop     ecx                             ; balance stack
        add     esi, 4                          
        dec     edi                             
        jns     PrintArray                      ; if edi ! -1 continue loop

PrintLineFeed:
        sub     esp, 4
        mov     byte [esp], 10
        mov     edx, 1
        mov     ecx, esp
        mov     ebx, 1
        mov     eax, 4
        int     80h

exit:
        mov     ebx, 0
        mov     eax, 1
        int 80H

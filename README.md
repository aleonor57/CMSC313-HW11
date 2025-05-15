# CMSC313-HW11

AUTHORING: Aldrich Leonor UMBC CMSC313 (5/15/2025, 8:00 pm)

PURPOSE OF SOFTWARE: Print out the ASCII for hex values.

FILES:
- ascii.asm - Header file for the C++ implimentation
     
BUILD INSTRUCTIONS: 
- Download files
- Compile with: nasm -f elf32 -g -F dwarf -o ascii.o ascii.asm
- Link with: ld -m elf_i386 -o ascii ascii.o
- Run with ./ascii

TESTING METHODOLOGY: 
- Used several different ASCII values to ensure it printed correctly for numbers and letters
- Checked the ASCII values were correct for both the first and second halves of the hex

ADDITIONAL INFORMATION:
- Could not space individual ASCII values
- Did not have enough time to code transferring the values into the output buffer and just printed the values directly

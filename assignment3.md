3.1.11

1. -35, -25t, -23h, -43o, -100011b
2. sure
3. no
4. (1 * -1) MOD 1 + 1 / 1 - 1
-1 MOD 1 + 1 / 1 - 1
0 + 1 / 1 - 1
1 - 1 
0


3.2.4

4. eax
5. END

3.3.3

1. object file and listing file
2. true
3. true
4. loader

3.4.13

1. SWORD ?
2. BYTE ?
3. SBYTE
4. QWORD
5. DWORD

3.5.5

3. `ArraySize = ($ - myArray) / 2`

3.9.1

4. the program needs to be assembled to be ran, you don't run an assembler to run programs, use run them to make them
5. the order of the bytes of a number. little endian (low to high) least sig byte  is stored on first memory address. high address (high to low) other away around.
6. to save storage, to ensure no change in values, for to signify concepts
25. name DWORD `value`

3.9.2 Algorithm Workbench

4. Unsigned, so wraps around to create a large positive number
7. array DWORD 120 DUP(?)
13. string BYTE 500 DUP("TEST")

; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
.code
main proc
	mov	eax,1
	mov ebx,2
	mov ecx,3
	mov edx,4

	add eax,ebx
	add edx,ecx
	sub edx,eax

	invoke ExitProcess,0
main endp
end main
; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
array DWORD 20,40,60,80
temp DWORD LENGTHOF array DUP(?)

rotations WORD 1
.code
main proc
	mov esi, OFFSET array
	mov ecx, LENGTHOF array

print1:
	mov eax,[esi]
	call WriteInt
	add esi, TYPE array
	loop print1

	mov ecx, LENGTHOF array
	mov esi, 0

copy:
	mov eax, array[esi]
	mov temp[esi], eax
	add esi, TYPE array
	loop copy

; first, get the modulus of rotation
	movzx eax,rotations
	cmp eax,LENGTHOF array
	jle pre_loop ; jump if rotations < temp_iter, don't waste time

	mov ax, rotations
	mov bl, LENGTHOF array
	div bl
	cmp ah,0 ; mod = 0 ?
	je bye ; yes

	movzx ax,ah
	mov rotations,ax

; for every value in the array
	;if (n + rotations > lengthof array)
	;	array[n + rotations - lengthof array] = array[n]
	;else
	;	array[n + 1] = array[n]

pre_loop:
	mov ecx, LENGTHOF array
	mov esi, 0
	movzx edx, rotations

temp_iter:
	mov ebx, 0
	mov eax, esi 
	add eax, edx
	cmp eax, LENGTHOF array ; n + rotations > lengthof array ?
	jge fullrotate ; yes

	mov ebx, temp[esi * TYPE array] ; no
	mov eax, esi;
	mov array[eax * TYPE array + TYPE ARRAY], ebx
	jmp next

fullrotate:
	mov ebx, temp[esi * TYPE array]
	sub eax, LENGTHOF array
	mov array[eax * TYPE array], ebx

next:
	inc esi
	loop temp_iter


bye:
	mov esi, OFFSET array
	mov ecx, LENGTHOF array
print2:
	mov eax, [esi]
	call WriteInt
	add esi, TYPE array
	loop print2

	invoke ExitProcess, 0
main endp
end main
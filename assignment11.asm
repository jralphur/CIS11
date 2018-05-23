; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
array DWORD 10,20,30,40,50,60,70,80
.code

main proc
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	test ecx,1d
	jnz preexit; premature exit

	mov ecx,LENGTHOF array
print1:
	mov eax,[esi]
	call WriteInt
	add esi,TYPE array
	loop print1

	mov esi,OFFSET array
	mov ecx,LENGTHOF array

swap_loop:
	; ebx is our temporary variable
	mov ebx,[esi]
	xchg ebx,[esi + TYPE array]
	mov [esi],ebx

	add esi,TYPE array * 2
	sub ecx,2
	cmp ecx,0
	jnz  swap_loop

preexit:
	mov esi,OFFSET array
	mov ecx,LENGTHOF array

print2:
	mov eax,[esi]
	call WriteInt
	add esi,TYPE array
	loop print2
main endp
end main
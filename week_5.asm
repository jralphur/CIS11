; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
fibarray DWORD 47 DUP(?)
.code
Fib proc uses esi ecx
	; esi = array offset (OFFSET fibarray)
	; ecx = values of array (47)
	; Fib(0) = 0
	; Fib(1) = 1
	; Fib(n - 1) + Fib(n - 2) whatever
	; Fib(2) = 1
	; Fib(3) = 2
	mov [esi],0
	mov [esi + 4],1
	sub ecx,2
	add esi,TYPE DWORD * 2;
loop:
	mov [esi],[esi - TYPE DWORD];
	add [esi],[esi - TYPE DWORD * 2];
	add esi,TYPE DWORD;
	loop
	ret
Fib endp

main proc
	mov esi,OFFSET fibarray
	mov ecx,47
	invoke ExitProcess,0
main endp
end main; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
fibarray DWORD 47 DUP(?)
.code
Fib proc uses
	; esi = array offset (OFFSET fibarray)
	; ecx = values of array (47)
	; Fib(0) = 0
	; Fib(1) = 1
	; Fib(n - 1) + Fib(n - 2) whatever
	; Fib(2) = 1
	; Fib(3) = 2
	mov [esi],0
	mov [esi + 4],1
	sub ecx,2
	add esi,TYPE DWORD * 2;
loop:
	mov [esi],[esi - TYPE DWORD];
	add [esi],[esi - TYPE DWORD * 2];
	add esi,TYPE DWORD * 2;
	loop
	ret
Fib endp

main proc
	mov esi,OFFSET fibarray
	mov ecx,47
	invoke ExitProcess,0
main endp
end main
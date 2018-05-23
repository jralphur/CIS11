; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
rows BYTE ?
cols BYTE ?
.code
main proc
	mov ecx,100
	call GetMaxXY
	mov rows,al
	mov cols,dl

poop:
	mov al,rows ; lower 8 in eax
	call RandomRange
	mov dh,al ; arg1 in gotoxy

	mov al,cols ; lower 8 in eax
	call RandomRange
	mov dl,al arg2 in gotoxy

	call GoToXY

	mov al,'#'
	call WriteChar

	mov eax,100
	call Delay

	loop poop
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
Fib proc uses esi ecx eax
	; esi = array offset (OFFSET fibarray)
	; ecx = values of array (47)
	; Fib(0) = 0
	; Fib(1) = 1
	; Fib(n - 1) + Fib(n - 2) whatever
	; Fib(2) = 1
	; Fib(3) = 2
    mov eax,0
	mov [esi],1
    mov eax,1
    mov [esi + 4],eax
	sub ecx,2
	add esi,TYPE DWORD * 2
woop:
	mov eax,fibarray[esi - TYPE DWORD]
	add eax,fibarray[esi - TYPE DWORD * 2]
	mov [esi],eax
	add esi,TYPE DWORD
	loop woop
	ret
Fib endp

main proc
	mov esi,OFFSET fibarray
	mov ecx,47
	invoke ExitProcess,0
main endp
end main

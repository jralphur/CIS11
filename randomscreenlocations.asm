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
end main
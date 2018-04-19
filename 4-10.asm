; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')
.code

main proc
	mov ecx,SIZEOF source - 1
	mov esi,0

cycle:
	mov al,source[ecx - 1]
	mov target[esi],al
	inc esi
	loop cycle

	mov target[esi],0
	mov edx,OFFSET target
	call WriteString
main endp
end main
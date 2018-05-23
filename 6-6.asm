; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example
Include Irvine32.inc
.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
.data
EXIT_KEY = 53
CaseTable BYTE '1'
		  DWORD and_proc
TableSize = ($ - CaseTable) 
			BYTE '2'
			DWORD or_proc
			BYTE '3'
			DWORD not_proc
			BYTE '4'
			DWORD xor_proc
entries = ($ - CaseTable) / TableSize

line1 BYTE "1. A AND B",13,10,0
line2 BYTE "2. A OR B",13,10,0
line3 BYTE "3. A NOT B",13,10,0
line4 BYTE "4. A XOR B",13,10,0
line5 BYTE "5. Exit",13,10,0
prompt BYTE "Enter 1-5: ",13,10,0

sub_prompt1 BYTE "First number: ",0
sub_prompt2 BYTE "Second number: ",0

lhs DWORD 0
rhs DWORD 0

.code
menu proc uses edx
	mov edx,OFFSET line1
	call WriteString
	mov edx,OFFSET line2
	call WriteString
	mov edx,OFFSET line3
	call WriteString
	mov edx,OFFSET line4
	call WriteString
	mov edx,OFFSET prompt
	call WriteString
	ret
menu endp

and_proc proc uses edx
	mov eax,lhs
	and eax,rhs
	ret
and_proc endp

or_proc proc uses edx
	mov eax,lhs
	or eax,rhs
	ret
or_proc endp

not_proc proc uses edx
	mov eax,lhs
	not eax
	ret
not_proc endp

xor_proc proc uses edx
	mov eax,lhs
	xor eax,rhs

	ret
xor_proc endp

main proc
while_true:
	call menu
	call ReadChar
	call ReadChar
	cmp al,EXIT_KEY ; exit key (5) pressed?
	je to_exit ; yes
	mov ebx,offset CaseTable 
	mov ecx,entries
L1:
	cmp al,[ebx] ; compare values
	jne L2	; not found?
	mov edx,OFFSET sub_prompt1
	call WriteString
	call ReadHex
	mov lhs,eax
	mov edx,OFFSET sub_prompt2
	call WriteString
	call ReadHex
	mov rhs,eax
	call NEAR PTR [ebx + 1]; call the procedure if found
	call WriteHex
	call Crlf
	mov eax,7000
	jmp while_true
L2:
	add ebx,TableSize ; next entry in table
	loop L1
	jmp while_true
to_exit:
	exit
main endp
end main
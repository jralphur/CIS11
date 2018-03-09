# Chapter 3.1


```
; AddTwo program, MASM syntax
main PROC
    mov eax,5            ; move 5 to the eax register
    add eax,6            ; add 6 to the eax register

    INVOKE ExitProcess,0 ; end the program
main ENDP
```

line 1: main procedure (main())

line 2: int 5 on eax register (int eax = 5)

line 3: add 6 to eax (eax += 6)

line 5: run ExitProcess (function)

line 6: ending marker of main() (})

## Adding variables

under .data *segment*

not case sensitive

## syntax: `*identifier* *size_keyword* *initial_value*`

**segments**: areas for code (.data, .code, .stack)

`.data`: segment for defining variables

`.code`: segment for definiting executable instructions

`.stack [number_literal]`: identifies the runtime stack

## real number literals
**encoded reals**: a real number in hexadecimal

## reserved words
* not case sensitive

* mnemonics; mov, add, mul
* register names
* directives
* attributes (BYTE, WORD)
* operators
* predefined symbols that return constant integer values at asm time

## Directives

**directive**
: commands ran by the assembler; does not exec on runtime; define a running procedures

```
myVAR DWORD 26  ; assembler reserves DWORD
mov   eax,myVar ; runs on runtime
```

*not all directives are alike*

## Instructions

anatomy:
* label (optional)
* instruction mnemonic (required)
* operands (usually required)
* comment optional

syntax: `[*label*:] *mnemonic* [*operands*] [*;comment*]`

### Label

**generic definition**: place market for instructions and data; labels imply address

#### data labels

Variables, basically

`count DWORD 100`
`array DWORD, 1024, 2048
       DWORD  4096, 8192`

#### code labels

Just like in C/C++

```
target:
    mov ax, bx
    ...
```

##




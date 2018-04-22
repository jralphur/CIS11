# Chapter 9, Strings and Arrays

## 9.2 String Primitive Instructions
* specialized instructions to move string primitives (arrays)
* uses `ESI` and/or `EDI`
* uses AL, AX or EAX

* b = byte, w = word, d = double word, s = string
* accumulator: al, ax, edx
* moves once
* MOVS(B, W, D) - move string data from esi to edi
* CMPS(B, W, D) - compare [esi] and [edi]
* SCAS(B, W, D) - compare (AL, AX, EDX) to EDI
* STOS(B, W, D) - store (AL, AX, EDX) to EDI
* LODS(B, W, D) - load ESI to (AL, AX, EDX)

### Repeat Prefixes
* repeats string primitive instructions
* allows to iterate through entire string with one instruction
* uses ECX as counter

* `rep` - while ECX > 0
* `REPZ, REPE` - while zero_flag = 1 && ECX > 0
* `REPNZ, REPNE` - while zero_flag = 0 && ECX > 0

``` 
; Example
cld     ; clear direction flag
mov esi, OFFSET string1 ; src
mov edi, OFFSET string2 ;  target
mov ecx,10              : set counter to 10
rep movsb               : move 10 bytes
; ESI and EDi are incremented/decremented by MOVSB
```

### Direction Flag
* ESI/EDI increments/decrements depending on direction flag
```
CLD ; clear flag, forward direction
STD ; set flag, reverse direction
```




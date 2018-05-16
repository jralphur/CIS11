# Chapter 5
## 5.1 Stack Operations
* LIFO (Last In, First Out)
* `ESP` points to the last value pushed on stack
* modified with `CALL`, `RET`, `PUSH`, and `POP`
* for subroutines
* stack grows downwaard in memory hi -> low

### Push Operation
* ESP -= 4
* *ESP = value

### Pop Operation
* value is removed
* ESP then moved to the next location

### Stack Applications
* has a save area for registers for multi uses
* when `CALL` execs, CPU saves return address on stack
* push arguments on stack to use for args on functions
* functions provides local variables

### PUSH and POP
```
PUSH/POP reg/mem16
PUSH/POP reg/mem32
PUSH imm32
```
* pop copies the contents of the stack
* increment/decrement by 2 on 16-bit op
* increment/decrement by 4 on 16-bit op

### PUSHFD and POPFD Instructions
```
pushfd
popfd
```

Pushes/pops eflags on stack
* great for saving flags since `mov` does not copy flags 
* can pop flags into a variable

### PUSHAD, PUSHA, POPAD, POPA
Pushes/pops all 32 bit registers on the stack
* Pushes in ascending order
* Pops in opposite order
`PUSHA/POPA` are the same, but for 16 bit
* If registers are used in a function, used PUSHAD/POPAD to save and restore these functions

### Procedures
Basically functions
* Other than main, functions must end with `ret`
Syntax:
```
sample PROC
    ...
    ...
    ret
sample ENDP
```

### CALL and RET
* `CALL` pushes return address on stack
* also pushes fnction address to instruction pointer
* CALLS a function()

### Passing arguments
* no real arguments, everything is basically global variables

### Savings registers
* Save ECX and ESI especially for arrays
* Don't push and restore return values (don't override them)

### USES Operator
Generates push and pop operations in functions
`Syntax: functioname PROC USES register1 register2 ...`

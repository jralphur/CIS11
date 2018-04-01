# Conditional Processing
* `if` statements, `switch`, `for` loops, etc
* bitwise operations (`AND`, `OR`, `NOT`)
* nested if
* set and clear bits

```
AND/OR  reg,reg
AND/OR  reg,mem
AND/OR  reg,imm
AND/OR  mem,reg
AND/OR  mem,imm
```

## AND
**bit masking**: clear bits without interfering with other bits
* clears Overflow and Carry
* Sign, Zero and Parity matches value assigned to dest

## OR
* good for setting on bits 
* same flag changes in `AND`
* sign flag and zero flag check for positivity/zero/negativity of value

## NOT
* reverses all the bits

## XOR
* use this to check for parity with zero
* parity = 1; even bits
* parity = 0; odd bits
# TEST
* AND but does not change the destination
* sets the Sign, Zero, and Parity flags
## 6.2.4 Bit-Mapped Sets
**bit vector/map**: bit field to indicate membership of a set
    * use `AND` and zero flag with a value to check for membership
        * if zero = 1, after `and`, then source value exists in bit field
    * use `NOT` to set complement
    * use `AND` with a same sized set for recieve an intersection of sets
    * use `OR` with same sized set field to receive a union of sets

## 6.2.8 CMP Instruction
* used for comparing integers
* implied substraction, no actual modification
* changes Overflow, Sign, Zero, Carry, Aux Carry, Parity
* two unsigned op comparison:
    * dest \< src: zf = 0; cf = 1
    * dest \> src: zf = 0; cf = 0
    * dest = src: zf = 1; cf = 0

## Setting CPU Flags

### Zero

```
test al,0 ; set ZF
and  al,0 ; set ZF
or   al,1 ; clear ZF
```

### Sign
* to set, OR highest bit with 1
* to clear, AND highest bit with zero

### Carry
stc ; set Carry
clc ; clear Carry

### Overflow
* add two positives to create negative
* OR with zero to clear

### Conditional Jumps
```
jz label: jump if ZF = 1
jnz label ; jump if ZF = 0
jc label; ; jump if carry
jnc label ; jump if no carry
jz label ; jump if zero
jnz label; jump if not zero
je label ; jump if equal (zero flag on)
jl label ; jump if less
jg label ; jump if greater than
jo label ; jump if overflow
jno label ; jump if not overflow
js label ; jump if signed
jns label ; jump if not signed
jp label ; parity
jnp label ; jump no parity
```
* previous register from cmp/and/or is checked

### Equality Comparision
* jump is based on `cx`, `ecx`, or `rcx`
* `CMP leftOp, rightOp`
```
je ; jump if left == right
jne ; jump if left != right
jcxz ; jump if cx = 0
jecxz ; jump if ecx = 0
jrcxz = jump if rcx = 0
```

### Unsigned Comparisons
```
ja ; left > right
jnbe ; left not below or equal
jae ; left >= right
jnb ; jump if not below
jb ; left < right
jnae ; jump if not above or equal
jbe ; jump if below or equal
jna ; jump if not above
```

### Signed Comparison
```
jg ; jump if left > right
jnle ; jump if not less or equal
jge ; left >= right
jnl ; jump if not less
jl ; jump if less left < right
jnge ; jump if not greater or equal
jle ; jump if left <= right
jng ; jump if not greater
```

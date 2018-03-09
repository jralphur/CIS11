# 3.4 Defining Data

## 3.4.2 Data Definition

`[*name*] *directive* *initializer* [,*initializer*]...`

**byte**:  8 bit unsigned

**sbyte**: 8 bit signed

**word**: 16 bit unsigned

**sword**: 16-bit signed

**dword**: 32bit unsigned

**sdword**: 32bit signed

**fword**: 48 bit (far pointer in protected mode)

**qword**: 64 bit signed

**tbyte**: 80bit (10 byte)

**REAL4**: 32bit (4 byte) IEEE short real

**REAL8**: 64bit (8 byte) IEEE long real

**REAL10**: 80-bit (10-byte) IEEE extended real


## Initialization Rules

Required, use ? if you want a random value (uninitalized)

The label marks the offset from the beginning segment

Name of multiple initializers only refers to first initalizer

## Defining strings

`greeting1 BYTE "Good afternoon",0`

0 indicates the string is null terminated

`0Dh`: carriage return `0Ah` indicate end of line characters


`\`` concats two source lines into one; must be last line


## DUP Operator

Allocates for mulitple data items, integer argument for count

Use for arrays or strings

```
BYTE 20 DUP(0) ; 20 bytes, all equal zero
BYTE 20 DUP(?) ; 20 bytes, all uninitialized
BYTE 4  DUP("STACK"); "STACKSTACKSTACKSTACK"
```

## Arrays

`myList WORD 1,2,3,4,5`

or

`myList WORD 5 DUP(?)`

Offset of each number in a multiple initialization sequence is multiple by position * size

## DWORD

`DWORD` can be used to declare a variable that contains the 32-bit offset of another variable

`pVal DWORD val3`

## Defining PACKED BCD (TBYTE) Data

**binary coded decimal** in a ten byte package

* Each byte except the highest contains two dec digits
* every half byte holds a dec digit
* highest is the sign
* 80h on highest = negative

Use `TBYTE` to declare `BCD` variables; initializers in hex

`intVal TBYTE 800000000000001234h`

To encode number as packed BCD:
* load floating point stack with FLD
* use FBSTP to convert BCD
* floating rounds to nearest integer

```
.data
posVal REAL8 1.5
bcdVal TBYTE ?
.code
fld posVal ; load onto floating-point stack
fbstp bcdVal ; rounds up to 2 as packed BCD
```

## Defining Float-Point Types

`REAL*n*`: n precision value; requires initalizer

## Declaring Uninitialized Data

Use `.DATA?` directive/segment for uninitialized data to reduce size

You can switch back and forth `.code` and `.data` to use for localized variables



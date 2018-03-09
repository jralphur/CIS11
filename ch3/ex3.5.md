# Symbolic Constants
An association with an integer or some text

Does not reserve storage


## 3.5.1 

**equal sign directive** associates symbol name with int expr**

`name = expression`

*analogous to the `#define` macro in C++*

Getting the list size of an array:

`ListSize = ($ - list)`

* Instruction immediately after the list other the ListSize will be too large/offset wrong

`$` gives the address of the current offset


If the array is something other than bytes, divide by the size of the type.


## 64-bit programming

```
.386
.model flat,stdcall
.stack 4096
```

is useless in 64bit

Remove the arguments in the prototype

`mov ecx.0
call ExitProcess`

instead of `INVOKE ExitProcess`

## 3.5.3 EQU Directive

* cannot be redefined

*associates a symbolic name with an integer expression or some arbitrary text*

```
*name* EQU *expression* ; expression: int expression, evaluated before use
*name* EQU *symbol* ; existing sumbol defined with = or EQU
*name* EQU *<text>* : text in the brackets, good for values that do not eval to int; text is copied 
```

## TEXTEQU Directive

*text macro*

* can be reassigned

```
*name* TEXTEQU *<text>* ; assigns text
*name* TEXTEQU *textmacro ; assigns from existing text macro
*name* TEXTEQU *%constExpr* ; constant integer expression
```


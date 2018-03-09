# Example 3.2
## Adding and Subtracting example


```
; AddTwo Part 2
;
.386
.model flat,stdcall
.stack 4096 ; size of a memory page
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
    mov     eax,5
    add,    eax,6

    INVOKE ExitProcess,0
main ENDP
END main
```

`.386`: identifies this as 32 bit prog

`.model, flat, stdcall`: selects memory model (`flat`) and calling conventions (`stdcall`)

`flat` is related to protected mode

`stdcall`: how to run the runtime stack 

`stdcall` required by windows services

`PROC`: define a procedure

`ENDP`: end procedure

`END`: define opening procedure, mark end of program

### Function Prototypes

```
*function_name* PROTO, *parameter_name*:*parameter_type*
```





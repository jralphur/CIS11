1. Describe a stack frame
    A segment or partition of the stack that is occupied for a specific procedure's return address, parameters, as well as local variables.
2. Describe calling conventions
    A protocol on how to handle parameters in a procedure in a stack; how arguments to a procedure are handled; as well as restoring or handling the stack after the procedure execution path.
3. Why do functions start with `push ebp` and `mov ebp, esp` ?
    `push ebp` - push base point into the stack, storing it 
    `mov ebp, esp` - move current stack pointer value to ebp

    This is used for extracting procedure parameters that are relative in distance to ebp (after `mov`)


4. What is the x64 equivalent to `push epb` and `mov ebp, esp` ?
   ```
   push rpb
   mov rbp, rsp
   ```

5. What are the differences between the Microsoft x64 calling convention
    and the System V AMD64 ABI calling convention
Microsoft x64:
    * RCX, RDX, R8, R9 are used for the first 4 subroutine arguments
    * XMM(0-3) for floating point arguments
    * additional arguments are put into the stack (bottom to top)
    * integer values are sent to RAX if value is less than 32bits
    * float values are put to XMM0
    * parameters less than 64bits are not zero extended, high bits not zerod
    * only one calling convention
    * caller must allocate 32bits of shadow space before calling the function
    * caller must free the shadowspace after the call
    * RAX, RCX, EDX, R9, R10, R11 are volatile
    * RBX, RBP, RDI, RSI, RSP, R(12-15) are nonvolatile
System V AMD64 ABI:
    * RDI, RSI, RDX, RCX, R8, R9 is used for the first 6 arguments to a subroutine
    * XMM(0-7) are used for floating point arguments
    * Additional arguments are put into the stack
    * int ret values up to 64 are stored in RAX
    * int ret values up to 128bit are stored in RAX and RDX
    * float ret values are stored in XMM0 and XMM1
    * to use RBX, RBP, R12-R15, their values must be restored before exiting the subroutine
    * all other registers must be saved by caller to preserve their values
    * shadow space is not provided
    * return address adjacent to 7th int arg in stack
    * if the subroutine has var args, then the number of floating point args must be provided by caller in RAX

```
void myFunction(int a, int b, int c, int d, int e, int f) {
    // code
}
```

6. What does the stack look like when using x64 calling convention?
    [d, e, f]
7. What does the stack look like using the stdcall convention?
    [f, e, d, c, b, a]

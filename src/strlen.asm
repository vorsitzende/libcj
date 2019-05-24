; STRLEN.ASM - Routine to count number of bytes in a C-style string.
; Claudia Jughashvili, 2019
;   Accepts:
;     1:  Pointer to C-string.
;   Returns:
;     -   Unsigned 32bit integer.
;   State Changes:
;     -   None.
;   C Definition to take the form of:
;     -   extern unsigned int strlen (const char*);
global  _strlen
section .text
_strlen:push  ebp
        mov   ebp, esp
        push  esi
        mov   eax, dword [ebp+8]
        lea   esi, [eax]
        xor   eax, eax
    .A0:cmp   byte [esi], 0
        jz    .A1
        inc   esi
        inc   eax
        jmp   .A0
    .A1:pop   esi
        ret

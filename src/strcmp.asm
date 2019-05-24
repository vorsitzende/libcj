; STRCMP.ASM - Routine to compare two strings
; Claudia Jughashvili, 2019
;   Accepts:
;     1:  Pointer to C-string.
;     2:  Pointer to C-string.
;   Returns:
;     -   EAX set if strings identical.  Unset if different.
;   State Changes:
;     -   None.
;   C Definition to take the form of:
;     -   extern unsigned char strcmp (const char*, const char*);
;   C++ Definition to take the form of:
;     -   extern "C" bool strcmp (const char*, const char*);
global  _strcmp
extern  _strlen
section .text
_strcmp:push  ebp
        mov   ebp, esp
        push  ecx
        push  esi
        push  edi
        xor   ecx, ecx
        mov   eax, dword [ebp+8]
        lea   esi, [eax]
        push  eax
        call  _strlen
        add   esp, 8
        mov   ecx, eax
        mov   eax, dword [ebp+12]
        lea   edi, [eax]
        push  eax
        call  _strlen
        add   esp, 8
        cmp   eax, ecx
        jne   .A1
    .A0:cmp   ecx, 0
        jz    .A2
        mov   eax, dword [esi]
        cmp   eax, dword [edi]
        jne   .A1
        inc   esi
        inc   edi
        dec   ecx
        jmp   .A0
    .A1:xor   eax, eax
        jmp   .A3
    .A2:mov   eax, 1
    .A3:pop   edi
        pop   esi
        pop   ecx
        pop   ebp
        ret

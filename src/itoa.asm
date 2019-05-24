; ITOA.ASM - Routine to convert a given value to an ASCII string.
; Claudia Jughashvili, 2019
;   Accepts:
;     1:  32bit integer.  Routine checks and accounts for signage.
;     2:  Pointer to output buffer.
;   Returns:
;     -   Pointer to output buffer (EAX).  Equal to second parameter.
;   State Changes:
;     -   Routine populates a string incrementally beginning at provided
;         pointer.  A terminating \0 is automatically added following the
;         string.
;     -   The maximum number of bytes altered is 12. (eg "-2147483648" + '\0')
;     -   The minimum number of bytes altered is 2. (eg "0" + '\0')
;   C Definition to take the form of:
;     -   extern const char* itoa (int, char*);
global _itoa
section .text
_itoa:  push  ebp
        mov   ebp, esp
        push  esi
        mov   eax, dword [ebp+8]
        mov   ebx, dword [ebp+12]
        lea   esi, [ebx]
        cmp   eax, 0
        jz    .A1
        test  eax, eax
        jns   .A0
        neg   eax
        mov   byte [esi], '-'
        inc   esi
    .A0:call  .A2
        mov   byte [esi], 0
        lea   esi, [ebx]
        jmp   .A4
    .A1:mov   byte [esi], '0'
        mov   byte [esi+1], 0
        jmp   .A4
    .A2:push  eax
        push  ebx
        push  edx
        xor   edx, edx
        cmp   eax, 0
        jz    .A3
        mov   ebx, 10
        div   ebx
        call  .A2
        mov   eax, edx
        add   al, 0x30
        mov   byte [esi], al
        inc   esi
    .A3:pop   edx
        pop   ebx
        pop   eax
        ret
    .A4:pop   esi
        pop   ebp
        ret

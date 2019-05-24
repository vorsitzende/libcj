; ITOA.ASM - Routine to convert a given value to an ASCII string.
; Claudia Jughashvili, 2019
;   Accepts:
;     1:  32bit integer.  Routine checks and accounts for signage.
;     2:  Pointer to output buffer.
;     3:  32bit unsigned integer representing radix (10 or 16 currently).
;   Returns:
;     -   Pointer to output buffer (EAX).  Equal to second parameter.
;     -   NULL if radix unsupported.
;   State Changes:
;     -   Routine populates a string incrementally beginning at provided
;         pointer.  A terminating \0 is automatically added following the
;         string.
;     -   The maximum number of bytes altered is 12. (eg "-2147483648" + '\0')
;     -   The minimum number of bytes altered is 2. (eg "0" + '\0')
;   C Definition to take the form of:
;     -   extern const char* itoa (int, char*, unsigned char);
global _itoa
section .data
abcs    db    "0123456789ABCDEF"
section .text
_itoa:  push  ebp
        mov   ebp, esp
        pusha
        mov   eax, dword [ebp+16]
        cmp   eax, 10
        je    .A0
        cmp   eax, 16
        je    .A5
        xor   eax, eax
        jmp   .Ax
    .A0:mov   eax, dword [ebp+8]
        mov   ebx, dword [ebp+12]
        lea   esi, [ebx]
        cmp   eax, 0
        jz    .A2
        test  eax, eax
        jns   .A1
        neg   eax
        mov   byte [esi], '-'
        inc   esi
    .A1:call  .A3
        mov   byte [esi], 0
        lea   eax, [ebx]
        jmp   .Ax
    .A2:mov   byte [esi], '0'
        mov   byte [esi+1], 0
        jmp   .Ax
    .A3:push  eax
        push  ebx
        push  edx
        xor   edx, edx
        cmp   eax, 0
        jz    .A4
        mov   ebx, 10
        div   ebx
        call  .A3
        mov   eax, edx
        add   al, 0x30
        mov   byte [esi], al
        inc   esi
    .A4:pop   edx
        pop   ebx
        pop   eax
        ret
    .A5:mov   eax, dword [ebp+8]
        mov   ebx, dword [ebp+12]
        lea   esi, [ebx]
        movzx edi, al
        shr   eax, 8
        movzx ecx, al
        shr   eax, 8
        movzx ebx, al
        shr   eax, 8
        mov   edx, eax
        cmp   edx, 0
        jz    .A6
        call  xtoab
    .A6:mov   edx, ebx
        cmp   edx, 0
        jz    .A7
        call  xtoab
    .A7:mov   edx, ecx
        cmp   edx, 0
        jz    .A8
        call  xtoab
    .A8:mov   edx, edi
        call  xtoab
        mov   byte [esi], 0
        mov   eax, dword [ebp+12]
    .Ax:popa
        pop   ebp
        ret
xtoab:  push  eax
        push  ebx
        lea   ebx, [abcs]
        mov   al, dl
        shr   al, 4
        xlatb
        mov   byte [esi], al
        inc   esi
        mov   al, dl
        and   al, 0x0F
        xlatb
        mov   byte [esi], al
        inc   esi
        pop   ebx
        pop   eax
        ret
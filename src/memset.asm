; MEMSET.ASM - Writes a byte value to a memory location a number of times.
; Claudia Jughashvili, 2019
;   Accepts:
;     1:  Pointer to destination.
;     2:  Byte value to write.
;     3:  Number of times to write.
;   Returns:
;     -   Pointer to output buffer (EAX).
;   State Changes:
;     -   Routine writes a byte value incrementally to a memory location the
;         number of times specified.
;   C Definition to take the form of:
;     -   extern void* memset (void*, unsigned char, std::size_t);
global    _memset
section   .text
_memset:  push  ebp
          mov   ebp, esp
          push  esi
          push  ecx
          mov   esi, dword [ebp+8]
          mov   eax, dword [ebp+12]
          mov   ecx, dword [ebp+16]
      .A0:cmp   ecx, 0
          jz    .A1
          mov   byte [esi], al
          inc   esi
          dec   ecx
          jmp   .A0
      .A1:mov   eax, dword [ebp+8]
          pop   ecx
          pop   esi
          pop   ebp
          ret
; MEMCPY.ASM - Move one block of memory to another location.
; Claudia Jughashvili, 2019
;   Accepts:
;     1:  Pointer to destination.
;     2:  Pointer to source.
;     3:  Number of bytes to copy.
;   Returns:
;     -   Pointer to output buffer (EAX).
;   State Changes:
;     -   Routine reads memory from source location and copies the number of
;         bytes requested.  Does not append a '\0' to the end.
;   C Definition to take the form of:
;     -   extern void* memcpy (void*, const void*, std::size_t);
global _memcpy
section .text
_memcpy:  push  ebp
          mov   ebp, esp
          push  esi
          push  edi
          push  ecx
          mov   esi, dword [ebp+8]
          mov   edi, dword [ebp+12]
          mov   ecx, dword [ebp+16]
      .A0:cmp   ecx, 0
          jz    .A1
          mov   al, byte [edi]
          mov   byte [esi], al
          inc   edi
          inc   esi
          dec   ecx
          jmp   .A0
      .A1:mov   eax, dword [ebp+12]
          pop   ecx
          pop   edi
          pop   esi
          pop   ebp
          ret

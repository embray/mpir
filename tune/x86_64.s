;  x86 pentium time stamp counter access routine.
;
;  Copyright 1999, 2000, 2003, 2004, 2005 Free Software Foundation, Inc.
;
;  This file is part of the GNU MP Library.
;
;  The GNU MP Library is free software; you can redistribute it and/or
;  modify it under the terms of the GNU Lesser General Public License as
;  published by the Free Software Foundation; either version 2.1 of the
;  License, or (at your option) any later version.
;
;  The GNU MP Library is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;  Lesser General Public License for more details.
;
;  You should have received a copy of the GNU Lesser General Public
;  License along with the GNU MP Library; see the file COPYING.LIB.  If
;  not, write to the Free Software Foundation, Inc., 51 Franklin Street,
;  Fifth Floor, Boston, MA 02110-1301, USA.


; void speed_cyclecounter (unsigned p[2]);
;
; Get the pentium rdtsc cycle counter, storing the least significant word in
; p[0] and the most significant in p[1].
;
; cpuid is used to serialize execution.  On big measurements this won't be
; significant but it may help make small single measurements more accurate.

    bits 64
    section .text

    global speed_cyclecounter:function

speed_cyclecounter:
	; rdi	p

	mov     r10, rbx
	xor     eax, eax
	cpuid
	rdtsc
	mov	    [rdi], eax 
	mov     [rdi+4], edx
	mov     rbx, r10
	ret

    end

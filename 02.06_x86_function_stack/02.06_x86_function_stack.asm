%include "asm_io.inc"

;creating a funciton - label - function name, ret - end of function, 
;call - calls function and pushes return address of nect instruction onto the stack, Jumps to the address of the function - EIP is set to the function address.
;ret instruction will return from a function - pops off the address on the top of the stack and set EIP to that address.
;Debugging with GEF like GDB for C/C++ : wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
;git clone https://github.com/hugsy/gef.git
;echo source `pwd`/gef/gef.py >> ~/.gdbinit
; after gdb - (gdb) pi import urllib.request as u, tempfile as t; g=t.NamedTemporaryFile(suffix='-gef.py'); open(g.name, 'wb+').write(u.urlopen('https://tinyurl.com/gef-main').read()); gdb.execute('source %s' % g.name)

;Script : Implement simple function called clearEAX


segment .data 

segment .bss 

segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha
	;***************CODE STARTS HERE***************************
	mov eax, 0FEEDBEEFh
        push eax
        mov eax, 0BEEFBEEFh
        push eax
        call clearEAX
        add esp, 8
	;***************CODE ENDS HERE*****************************
        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

clearEAX:
        mov eax, 0
        ret

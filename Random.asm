;;;  Zufallszahlengenerator + CASE-Anweisung + SATISTIK ----
;;;  Zufallszahl in R2 E {0,...,7}
;;;  Statistik in 030h - 038h 
;;;
;;EQU	ZUF8R, 0x20		;ein byte
RNDM EQU 51h
CSEG At 0H
jmp init
ORG 100H

;-----------MAIN-----------------------------------
init:
ANF:
;-----------GENERIER EINE ZUFALLSZAHL----------
	 call ZUFALL         ;Zufallszahl A bestimmen zwischen 00h und ffh
;----------- CASE-ANWEISUNG-------------------------
         mov R7,#00h        ;Zähler initialisieren mit 0 
neu:	 add A,#020h        ;die Zufallszahl plus 32 
         inc R7            ;Zähler um 1 erhöhen
	 jnc neu           ;falls schon Überlauf, dann weiter - sonst  addiere 32
	
	 mov A, R7          ;schreib Zahl in A

;--------Kontrolle/Statistik------------
        cjne A,#01h, keine1
        inc 0x30
        jmp ANF 
keine1:
        cjne A,#02h, keine2
        inc 0x31
        jmp ANF 
keine2:  cjne A,#03h, keine3
        inc 0x32
        jmp ANF  
keine3:  cjne A,#04h, keine4
        inc 0x33
        jmp ANF  
keine4:  cjne A,#05h, keine5
        inc 0x34
        jmp ANF 
keine5:
        cjne A,#06h, keine6
        inc 0x35
        jmp ANF 
keine6:  cjne A,#07h, keine7
        inc 0x36
        jmp ANF  
keine7:  inc 0x37
        jmp ANF                     ;von vorn!
;--------------------------------------------------

; ------ Zufallszahlengenerator-----------------
ZUFALL:	mov	A, RNDM   ; initialisiere A mit ZUF8R
	jnz	ZUB
	cpl	A
	mov	RNDM, A
ZUB:	anl	a, #10111000b
	mov	C, P
	mov	A, RNDM
	rlc	A
	mov	RNDM, A
	ret
end

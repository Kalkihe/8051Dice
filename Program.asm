;Dice simulator with different modes

;Initialisierung

CSEG at 0h
JMP init
CSEG at 100h

RNDM EQU 51h

org 0bh		;Adresse von Timer 0 Interrupt
call TIMER0ISR  ;ISR von Timer 0 aufrufen
ret		;Zurueckkehren von Interrupt

;init
init:
LCALL initTimer
LCALL initSwitches
LCALL switchDetermination

;File for the main routine, polling switches

initSwitches:
;only once
mov R4,P0
ret

switchDetermination:
inc RNDM
;call this everytime after you called "init" once
mov A,P0
xrl A,R4
JB A.0,switch1		;A.0 is the pin for switch1
JB A.1,switch2 		;A.1 is the pin for switch2
JB A.2,switch3		;A.2 is the pin for switch3
jmp switchDetermination

saveSwitchStates:
mov R4,P0
ret

switch1:
;0-9 dice
call saveSwitchStates
mov A,R4
clr A.6
setb A.7
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
call Wuerfeln

switch2:
;1-6 dice
call saveSwitchStates
mov A,R4
setb A.6
clr A.7
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
call Wuerfeln

switch3:
;8051 dice
call saveSwitchStates
mov A,R4
setb A.6
setb A.7
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
call Wuerfeln

;File for timer isr and all related stuff



initTimer:
;Timer mir passenden Werten initialiseren
setb ET0 	;Interrupt für Timer 0 aktivieren
setb EA		;Interrupts aktivieren
setb ES		;Seriellen Interrupt aktivieren

mov R6,#00h	;Zählregister für Interrupts zurücksetzen

mov TMOD,#00000010b	;Timer0: 8 Bit Reload Modus

mov tl0, #0c0h
mov th0, #0c0h

ret

Timer0ISR:
inc R6
cjne R6,#02h,keineNeueZahl
mov R6,#00h
inc R5
cjne R5,#05h,nichtDieLetzteZahl
clr TR0		;Timer deaktivieren
mov R5,#00h	;Zaehler zuruecksetzen
nichtdieLetzteZahl:
CaLL LadeZahl
CALL display
keineNeueZahl:
reti


Wuerfeln:
setb TR0	;Timer starten
mov R5,#00h	;Zähler der gezeigten Zahlen zurücksetzen
jmp SwitchDetermination

LadeZahl:
mov A,R4
jnb A.6,Hole0bis9
jnb A.7,Hole1bis6
call Hole8051
EndeLadeZahl:
ret

Hole0bis9:
lcall ANF
jmp EndeLadeZahl
Hole1bis6:
; Aufruf
jmp EndeLadeZahl
Hole8051:
; Aufruf
jmp EndeLadeZahl

display:
mov DPTR, #table ;Load table data to data pointers location
mov A, R7 ;Move number into A
movc A, @A+DPTR  ;Get matching 7 segment pattern
mov P1, A ;Move pattern into Port 1
ret

table:	;Contains 7 segment data for each number
db 11000000b
db 11111001b, 10100100b, 10110000b
db 10011001b, 10010010b, 10000010b
db 11111000b, 10000000b, 10010000b

;-----------MAIN-----------------------------------
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
        ret
keine1:
        cjne A,#02h, keine2
        inc 0x31
        ret 
keine2:  cjne A,#03h, keine3
        inc 0x32
        ret  
keine3:  cjne A,#04h, keine4
        inc 0x33
        ret  
keine4:  cjne A,#05h, keine5
        inc 0x34
        ret 
keine5:
        cjne A,#06h, keine6
        inc 0x35
        ret 
keine6:  cjne A,#07h, keine7
        inc 0x36
        ret  
keine7:  inc 0x37
        ret                     ;von vorn!
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




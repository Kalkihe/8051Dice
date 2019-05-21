RNDMSEED EQU 50h
RNDM EQU 51h

CSEG at 0h
LJMP init
;-----------------------------
; Interupt-Einsprung Adressen

ORG 0Bh
INC RNDM		; Generierung Startwert für Zufallszahl
RETI

;-----------------
; Initialisierung
;-----------------
ORG 0100h
init:
MOV RNDM, #0d		; Startwert für Zufallszahlen mit 0 initialisieren

;-----------------------------------------------------------------------------
; Unterprogramm um eine (Pseudo-)Zufallszahl aus einem Startwert zu Berechnen
;-----------------------------------------------------------------------------
zufall:
MOV A, RNDM		; initialisiere A mit R0
JNZ zub			; Startwert darf nicht 0 sein
CPL A			; complementiere, falls doch 0
MOV RNDM, A
zub:
ANL A, #10111000b	;
MOV C, P		;
MOV A, RNDM		;
RLC A			;
MOV RNDM, A		;
RET

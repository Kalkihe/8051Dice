;File for timer isr and all related stuff

org 0bh		;Adresse von Timer 0 Interrupt
call TIMER0ISR  ;ISR von Timer 0 aufrufen
reti		;Zurueckkehren von Interrupt

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
; HIER NEUE ZAHL HOLEN
LJMP display
keineNeueZahl:
ret


Wuerfeln:
setb TR0	;Timer starten
mov R5,#00h	;Zähler der gezeigten Zahlen zurücksetzen
ret
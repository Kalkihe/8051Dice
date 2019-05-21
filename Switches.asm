;File for the main routine, polling switches

initSwitches:
;only once
mov R4,#00h
ret

switchDetermination:
;call this everytime after you called "init" once
mov A,P0
xrl A,R4
JB A.0,switch1		;A.0 is the pin for switch1
JB A.1,switch2 		;A.1 is the pin for switch2
JB A.2,switch3		;A.2 is the pin for switch3
ret

saveSwitchStates:
mov R4,P0
ret

switch1:
;0-9 dice
jmp saveSwitchStates
mov A,R4
anl A,11111100b		;reset last 2 bits
orl A,11111101b		;last 2 bits used for setting used dice-mode
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
ret

switch2:
;1-6 dice
jmp saveSwitchStates
mov A,R4
anl A,11111100b		;reset last 2 bits
orl A,00000010b		;last 2 bits used for setting used dice-mode
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
ret

switch3:
;8051 dice
jmp saveSwitchStates
mov A,R4
anl A,11111100b		;reset last 2 bits
orl A,00000011b		;last 2 bits used for setting used dice-mode
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
ret
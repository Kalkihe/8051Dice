;File for the main routine, polling switches

initSwitches:
;only once
mov R4,#00h
ret

switchDetermination:
;call this everytime after you called "init" once
mov A,P0.0 		;P0.0 is the pin for switch1
cjne A,R4.0,switch1
mov A,P0.1 		;P0.1 is the pin for switch2
cjne A,R4.1,switch2
mov A,P0.2 		;P0.2 is the pin for switch3
cjne A,R4.2,switch3
ret

saveSwitchStates:
mov R4.0,P0.0 		;save current state of switch1
mov R4.1,P0.1 		;save current state of switch2
mov R4.2,P0.2 		;save current state of switch3
ret

switch1:
;0-9 dice
jmp saveSwitchStates
mov R4.6,0		;last 2 bits used for setting used dice-mode
mov R4.7,1		;set mode bits to "01" (1) for 0-9 dice
ret

switch2:
;1-6 dice
jmp saveSwitchStates
mov R4.6,1		;last 2 bits used for setting used dice-mode
mov R4.7,0		;set mode bits to "10" (2) for 1-6 dice
ret

switch3:
;8051 dice
jmp saveSwitchStates
mov R4.6,1		;last 2 bits used for setting used dice-mode
mov R4.7,1		;set mode bits to "11" (3) for 8051 dice
ret
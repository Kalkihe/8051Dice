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
jmp switchDetermination

saveSwitchStates:
mov R4,P0
ret

switch1:
;0-9 dice
jmp saveSwitchStates
mov A,R4
clr A.6
setb A.7
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
ret

switch2:
;1-6 dice
jmp saveSwitchStates
mov A,R4
setb A.6
clr A.7
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
ret

switch3:
;8051 dice
jmp saveSwitchStates
mov A,R4
setb A.6
setb A.7
mov R4,A		;set mode bits to "01" (1) for 0-9 dice
ret
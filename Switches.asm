;File for the main routine, polling switches

jmp init 
jmp switchDetermination

init:
;only once
mov R4.0,0
mov R4.1,0
mov R4.2,0
ret

switchDetermination:
;call this everytime after you called "init" once
mov A,P0.0 ;P0.0 is the pin for switch1
cjne A,R4.0,switch1
mov A,P0.1 ;P0.1 is the pin for switch2
cjne A,R4.1,switch2
mov A,P0.2 ;P0.2 is the pin for switch3
cjne A,R4.2,switch3
ret

saveSwitchStates:
mov R4.0,P0.0 ;save current state of switch1
mov R4.1,P0.1 ;save current state of switch2
mov R4.2,P0.2 ;save current state of switch3
ret

switch1:
;0-9 dice
jmp saveSwitchStates
jmp dice1 ;placeholder
ret

switch2:
;1-6 dice
jmp saveSwitchStates
jmp dice2 ;placeholder
ret

switch3:
;8051 dice
jmp saveSwitchStates
jmp dice3 ;placeholder
ret
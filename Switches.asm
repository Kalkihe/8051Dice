;File for the main routine, polling switches

jmp init 
jmp schalterBestimmung

init:
mov R4.0,0
mov R4.1,0
mov R4.2,0
ret

schalterBestimmung:
mov A,P0.0
cjne A,R4.0,schalter1
mov A,P0.1
cjne A,R4.1,schalter2
mov A,P0.2
cjne A,R4.2,schalter3
ret

aenderungsSpeicherung:
mov R4.0,P0.0
mov R4.1,P0.1
mov R4.2,P0.2
ret

schalter1:
;0-9 wuerfel
jmp aenderungsSpeicherung
jmp wuerfel1 ;placeholder
ret

schalter2:
;1-6 wuerfel
jmp aenderungsSpeicherung
jmp wuerfel2 ;placeholder
ret

schalter3:
;8051 wuerfel
jmp aenderungsSpeicherung
jmp wuerfel3 ;placeholder
ret
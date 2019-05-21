;File for the main routine, polling switches

jmp initialisierung
jmp aenderunsAbfrage
ret

initialisierung:
mov R4,#00h
mov A,P0.0
mov B,P0.1
mov C,P0.2
jmp aenderungsAbfrage
ret

aenderungsAbfrage:
cjne A,R4.0,schalter1
cjne B,R4.1,schalter2
cjne C,R4.2,schalter3
ret

aenderungsSpeicherung:
mov R4,P0
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
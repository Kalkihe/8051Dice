;File for the main routine, polling switches

mov R6,#00h
call aenderungsAbfrage

aenderungsAbfrage:
cjne P0,R6,welcherSchalter0

aenderungsSpeicherung:
mov R6,P0
ret

welcherSchalter0:
cjne R6, #00000000, welcherSchalter1 ;00000000
jmp aenderungsSpeicherung
cjne P0, #10000000, schalter1 ;soll springen wenns richtig ist ...
cjne P0, #01000000, schalter2
cjne P0, #00100000, schalter3

welcherSchalter1:
cjne R6, #00100000, welcherSchalter2 ;00100000
jmp aenderungsSpeicherung
cjne P0, #10100000, schalter1
cjne P0, #01100000, schalter2
cjne P0, #00000000, schalter3

welcherSchalter2:
cjne R6, #01000000, welcherSchalter3
jmp aenderungsSpeicherung
cjne P0, #11000000, schalter1
cjne P0, #00000000, schalter2
cjne P0, #01100000, schalter3

welcherSchalter3:
cjne R6, #01100000, welcherSchalter4
jmp aenderungsSpeicherung
cjne P0, #11100000, schalter1
cjne P0, #00100000, schalter2
cjne P0, #01000000, schalter3

welcherSchalter4:
cjne R6, #10000000, welcherSchalter5
jmp aenderungsSpeicherung
cjne P0, #00000000, schalter1
cjne P0, #11000000, schalter2
cjne P0, #10100000, schalter3

welcherSchalter5:
cjne R6, #10100000, welcherSchalter6
jmp aenderungsSpeicherung
cjne P0, #00100000, schalter1
cjne P0, #11100000, schalter2
cjne P0, #10000000, schalter3

welcherSchalter6:
cjne R7, #11000000, welcherSchalter7
jmp aenderungsSpeicherung
cjne P0, #01000000, schalter1
cjne P0, #10000000, schalter2
cjne P0, #11100000, schalter3

welcherSchalter7: ;11100000
jmp aenderungsSpeicherung
cjne P0, #01100000, schalter1
cjne P0, #10100000, schalter2
cjne P0, #11000000, schalter3

schalter1:
;0-9 wuerfel

schalter2:
;1-6 wuerfel

schalter3:
;8051 wuerfel
;Dice simulator with different modes

;Initialisierung

CSEG at 0h
AJMP init
CSEG at 100h

;init
init:
LJMP initTimer



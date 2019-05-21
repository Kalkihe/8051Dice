display:
mov DPTR, #table
mov a, R7
movc a, @a+dptr
mov P1, a
ret

org 300h
table:
db 11000000b
db 11111001b, 10100100b, 10110000b
db 10011001b, 10010010b, 10000010b
db 11111000b, 10000000b, 10010000b

end
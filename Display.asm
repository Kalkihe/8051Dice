display:
mov DPTR, #table ;Load table data to data pointers location
mov A, R7 ;Move number into A
movc A, @A+DPTR  ;Get matching 7 segment pattern
mov P1, A ;Move pattern into Port 1
ret

table:	;Contains 7 segment data for each number
db 11000000b
db 11111001b, 10100100b, 10110000b
db 10011001b, 10010010b, 10000010b
db 11111000b, 10000000b, 10010000b

end

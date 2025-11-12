NUM_ODD_EGGS EQU 7

prob: MACRO
prob_total += \1
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
; entries correspond to OddEggs (below)
	table_width 2, OddEggProbabilities
prob_total = 0
	prob 14
	prob 14
	prob 14
	prob 14
	prob 14
	prob 14
	prob 16
	assert_table_length NUM_ODD_EGGS
	assert prob_total == 100, "OddEggProbabilities do not sum to 100%!"

OddEggs:
	table_width NICKNAMED_MON_STRUCT_LENGTH, OddEggs

	db CHIMCHAR
	db NO_ITEM
	db SCRATCH, LEER, 0, 0
	dw 00666 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 13, 15, 15 ; DVs
	db 35, 30, 0, 0 ; PP
	db 10 ; step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
    bigdw 0
    bigdw 12
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
	db "Egg@@@@@@@@"

	db FROAKIE
	db NO_ITEM
	db POUND, SMOKESCREEN, 0, 0
	dw 00666 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 13, 15, 15 ; DVs
	db 35, 20, 0, 0 ; PP
	db 10 ; step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
    bigdw 0
    bigdw 11
    bigdw 6
    bigdw 5
    bigdw 6
    bigdw 6
    bigdw 6
	db "Egg@@@@@@@@"

	db TREECKO
	db NO_ITEM
	db POUND, FOCUS_ENERGY, 0, 0
	dw 00666 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 13, 15, 15 ; DVs
	db 35, 30, 0, 0 ; PP
	db 10 ; step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
    bigdw 0
    bigdw 11
    bigdw 6
    bigdw 5
    bigdw 6
    bigdw 6
    bigdw 6
	db "Egg@@@@@@@@"

	db CHARMANDER
	db NO_ITEM
	db SCRATCH, GROWL, 0, 0
	dw 00666 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 13, 15, 15 ; DVs
	db 35, 40, 0, 0 ; PP
	db 10 ; step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
    bigdw 0
    bigdw 11
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
	db "Egg@@@@@@@@"

	db SQUIRTLE
	db NO_ITEM
	db TACKLE, TAIL_WHIP, 0, 0
	dw 00666 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 13, 15, 15 ; DVs
	db 35, 30, 0, 0 ; PP
	db 10 ; step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
    bigdw 0
    bigdw 12
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
	db "Egg@@@@@@@@"

	db BULBASAUR
	db NO_ITEM
	db TACKLE, GROWL, 0, 0
	dw 00666 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 13, 15, 15 ; DVs
	db 35, 30, 0, 0 ; PP
	db 10 ; step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
    bigdw 0
    bigdw 12
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
	db "Egg@@@@@@@@"

	db MUDKIP
	db NO_ITEM
	db TACKLE, WATER_GUN, 0, 0
	dw 00666 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 15, 13, 15, 15 ; DVs
	db 35, 25, 0, 0 ; PP
	db 10 ; step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
    bigdw 0
    bigdw 12
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
    bigdw 6
	db "Egg@@@@@@@@"

	assert_table_length NUM_ODD_EGGS

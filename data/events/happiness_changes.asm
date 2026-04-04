HappinessChanges:
; entries correspond to HAPPINESS_* constants
	table_width 3
	; change if happiness < 100, change if happiness < 200, change otherwise
	db  +10, +7,  +5 ; Gained a level
	db  +5,  +3,  +2 ; Vitamin
	db  +1,  +1,  +0 ; X Item
	db  +2,  +2,  +1 ; Battled a Gym Leader
	db  +1,  +1,  +0 ; Learned a move
	db  -1,  -1,  -1 ; Lost to an enemy
	db  -5,  -5, -10 ; Fainted due to poison
	db  -5,  -5, -10 ; Lost to a much stronger enemy
	db  +10, +10, +5 ; Haircut (older brother) 1
	db  +15, +15, +7 ; Haircut (older brother) 2
	db  +20, +20, +10 ; Haircut (older brother) 3
	db  +10, +10, +5 ; Haircut (younger brother) 1
	db  +15, +15, +7 ; Haircut (younger brother) 2
	db  +20, +20, +10 ; Haircut (younger brother) 3
	db  -5,  -5, -10 ; Used Heal Powder or Energypowder (bitter)
	db -10, -10, -15 ; Used Energy Root (bitter)
	db -15, -15, -20 ; Used Revival Herb (bitter)
	db +30, +30, +30 ; Grooming
	db +15, +10, +7 ; Gained a level in the place where it was caught
	db +250, +150, +50 ; Ambrosia
	assert_table_length NUM_HAPPINESS_CHANGES

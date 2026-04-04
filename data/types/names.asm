TypeNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2

	dw Normal
	dw Fighting
	dw Flying
	dw Poison
	dw Ground
	dw Rock
	dw Fairy
	dw Bug
	dw Ghost
	dw Steel
	assert_table_length UNUSED_TYPES

rept UNUSED_TYPES_END - UNUSED_TYPES - 1 ; discount CURSE_TYPE
	dw Normal
endr
	dw CurseType
	assert_table_length UNUSED_TYPES_END

	dw Fire
	dw Water
	dw Grass
	dw Electric
	dw Psychic
	dw Ice
	dw Dragon
	dw Dark
	dw Uber
	assert_table_length TYPES_END

Normal:    db "Normal@"
Fighting:  db "Fighting@"
Flying:    db "Flying@"
Poison:    db "Poison@"
CurseType: db "???@"
Fire:      db "Fire@"
Water:     db "Water@"
Grass:     db "Grass@"
Electric:  db "Electric@"
Psychic:   db "Psychic@"
Ice:       db "Ice@"
Ground:    db "Ground@"
Rock:      db "Rock@"
Fairy:     db "Fairy@"
Bug:       db "Bug@"
Ghost:     db "Ghost@"
Steel:     db "Steel@"
Dragon:    db "Dragon@"
Dark:      db "Dark@"
Uber:      db "Uber@"

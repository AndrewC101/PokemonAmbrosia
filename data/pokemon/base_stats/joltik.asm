	db JOLTIK ; 167

	db  50,  47,  50,  65,  57,  50
	;   hp  atk  def  spd  sat  sdf

	db BUG, ELECTRIC ; type
	db 190 ; catch rate
	db 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, GIGA_DRAIN, SUBSTITUTE, SOLARBEAM, RETURN, DOUBLE_EDGE, DIG, PSYCHIC_M, SLEEP_TALK, SLUDGE_BOMB, REST, FLASH, THUNDERBOLT, THUNDER_WAVE, THUNDER, X_SCISSOR, SWIFT
	; end

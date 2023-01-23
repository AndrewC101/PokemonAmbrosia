	db SANDSLASH ; 028

	db  60, 65, 65,  70,  134,  114
	;   hp  atk  def  spd  sat  sdf

	db GHOST, GHOST ; type
	db 60 ; catch rate
	db 178 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/sandslash/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, HIDDEN_POWER, GIGA_DRAIN, AURA_SPHERE, PROTECT, SUBSTITUTE, RETURN, SHADOW_BALL, SLEEP_TALK, SWIFT, REST, FLASH, NASTY_PLOT
	; end

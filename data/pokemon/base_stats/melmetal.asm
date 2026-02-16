	db MELMETAL ; 199

	db  135, 143, 143, 34, 80, 65
	;   hp  atk  def  spd  sat  sdf

	db STEEL, STEEL ; type
	db 45 ; catch rate
	db 250 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 10 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/melmetal/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, BULK_UP, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, PROTECT, SUBSTITUTE, EARTHQUAKE, ROCK_SLIDE, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, X_SCISSOR, CUT, STRENGTH, THUNDER_WAVE, THUNDERBOLT, THUNDERPUNCH, FIRE_PUNCH, ICE_PUNCH, DRAIN_PUNCH
	; end

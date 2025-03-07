	db KINGAMBIT ; 040

	db  100, 135, 120, 50,  60,  85
	;   hp  atk  def  spd  sat  sdf

	db DARK, STEEL ; type
	db 25 ; catch rate
	db 250 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, RAIN_DANCE, SUNNY_DAY, SANDSTORM, AIR_SLASH, THUNDER_WAVE, HYPER_BEAM, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, X_SCISSOR, CUT, STRENGTH, SWORDS_DANCE, DARK_PULSE, THUNDERPUNCH, IRON_HEAD, ROCK_SLIDE, DRAIN_PUNCH, AURA_SPHERE
	; end

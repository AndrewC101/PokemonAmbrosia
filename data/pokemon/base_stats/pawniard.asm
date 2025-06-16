	db PAWNIARD ; 043

	db  45,  85,  70,  60,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db DARK, STEEL ; type
	db 120 ; catch rate
	db 70 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonair/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, RAIN_DANCE, SUNNY_DAY, SANDSTORM, THUNDER_WAVE, HYPER_BEAM, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, X_SCISSOR, CUT, STRENGTH, SWORDS_DANCE, DARK_PULSE, THUNDERPUNCH, IRON_HEAD, ROCK_SLIDE, DRAIN_PUNCH, AURA_SPHERE, TAUNT
	; end

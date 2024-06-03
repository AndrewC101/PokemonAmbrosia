	db ELECTIVIRE ; 084

	db  75,  123,  67,  95,  95,  85
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 30 ; catch rate
	db 199 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 25 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, PSYCHIC_M, AURA_SPHERE, ICE_PUNCH, SLEEP_TALK, SWIFT, THUNDERPUNCH, REST, FIRE_PUNCH, STRENGTH, FLASH, THUNDERBOLT, THUNDER_WAVE, EARTHQUAKE, ROCK_SLIDE
	; end

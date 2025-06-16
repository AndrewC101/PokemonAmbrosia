	db GLIGAR ; 207

	db  65,  75, 105,  85,  35,  65
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FLYING ; type
	db 60 ; catch rate
	db 108 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/gligar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, BODY_SLAM, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, SLEEP_TALK, SLUDGE_BOMB, SANDSTORM, SWIFT, REST, ROCK_SLIDE, X_SCISSOR, CUT, STRENGTH, ROOST, SWORDS_DANCE, EARTHQUAKE, EARTH_POWER, FISSURE, TAUNT
	; end

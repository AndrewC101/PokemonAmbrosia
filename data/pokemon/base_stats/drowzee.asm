	db DROWZEE ; 096

	db  130, 140, 105, 50, 45,  80
	;   hp  atk  def  spd  sat  sdf

	db GROUND, NORMAL ; type
	db 20 ; catch rate
	db 250 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F0 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, BULK_UP, HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SUBSTITUTE, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, DIG, ICE_PUNCH, SLEEP_TALK, SWIFT, THUNDERPUNCH, REST, ROCK_SLIDE, FIRE_PUNCH, CUT, STRENGTH, SWORDS_DANCE, IRON_HEAD, X_SCISSOR
	; end

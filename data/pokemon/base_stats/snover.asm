	db SNOVER ; 054

	db  60,  62,  50,  40,  62,  70
	;   hp  atk  def  spd  sat  sdf

	db GRASS, ICE ; type
	db 120 ; catch rate
	db 67 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_PLANT ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICE_BEAM, ICY_WIND, ICE_PUNCH, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, ICE_PUNCH, GIGA_DRAIN, SOLARBEAM, SLEEP_TALK, SWIFT, REST, STRENGTH, EARTHQUAKE, EARTH_POWER, AURA_SPHERE
	; end

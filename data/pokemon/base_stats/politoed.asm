	db POLITOED ; 186

	db  90,  75,  75,  70,  90, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 45 ; catch rate
	db 185 ; base exp
	db NO_ITEM, KINGS_ROCK ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/politoed/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, PSYCHIC_M, ICE_PUNCH, SLEEP_TALK, REST, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, THUNDER, CALM_MIND
	; end

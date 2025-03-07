	db DRACOVISH ; 051

	db  90, 90,  100, 75,  70,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, DRAGON ; type
	db 45 ; catch rate
	db 177 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICE_BEAM, HYPER_BEAM, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, DRAGON_PULSE, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, SURF, STRENGTH, WHIRLPOOL, WATERFALL, BODY_SLAM, ROCK_SLIDE, EARTHQUAKE, EARTH_POWER
	; end

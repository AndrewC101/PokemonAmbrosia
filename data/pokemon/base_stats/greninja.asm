	db GRENINJA ; 160

	db  72, 95, 67,  122,  103,  71
	;   hp  atk  def  spd  sat  sdf

	db WATER, DARK ; type
	db 45 ; catch rate
	db 210 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/greninja/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, BODY_SLAM, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, EARTHQUAKE, RETURN, DOUBLE_EDGE, DIG, ICE_PUNCH, SLEEP_TALK, REST, CUT, SURF, STRENGTH, WHIRLPOOL, WATERFALL, ICE_BEAM, NASTY_PLOT, DARK_PULSE, PSYCHIC_M, AURA_SPHERE, SWIFT, TAUNT
	; end

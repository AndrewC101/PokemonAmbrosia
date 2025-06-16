	db YVELTAL ; 239

	db  126,  131,  95,  99,  131,  98
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
    db 3 ; catch rate
	db 255 ; base exp
	db LIFE_ORB, LIFE_ORB ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/yveltal/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, BODY_SLAM, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, GIGA_DRAIN, SUBSTITUTE, IRON_HEAD, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SANDSTORM, SWIFT, REST, FLY, ROOST, STRENGTH, ICE_BEAM, NASTY_PLOT, CUT, FLASH, THUNDER_WAVE, THUNDERBOLT, THUNDER, TAUNT
	; end

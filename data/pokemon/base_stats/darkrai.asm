	db DARKRAI ; 150

	db 70, 90,  90, 125, 135,  90
	;  hp  atk  def  spd  sat  sdf

	db DARK, DARK ; type
	db 3 ; catch rate
	db 220 ; base exp
	db BLACKGLASSES, BLACKGLASSES ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/darkrai/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, SOLARBEAM, THUNDER, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, ICE_PUNCH, SLEEP_TALK, FIRE_BLAST, SWIFT, THUNDERPUNCH, REST, FIRE_PUNCH, STRENGTH, FLASH, NASTY_PLOT, TAUNT
	; end

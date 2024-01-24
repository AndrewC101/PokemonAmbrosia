	db LOPUNNY ; 022

	db  65,  76,  84, 105,  54,  96
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FIGHTING ; type
	db 60 ; catch rate
	db 178 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, HEADBUTT, CURSE, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICE_BEAM, ICY_WIND, PROTECT, SUBSTITUTE, IRON_HEAD, THUNDER, RETURN, DOUBLE_EDGE, DIG, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SWIFT, REST, FIRE_PUNCH, ICE_PUNCH, THUNDERPUNCH, SWORDS_DANCE
	; end

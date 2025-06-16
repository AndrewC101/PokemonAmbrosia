	db GENESECT ; 185

	db  71, 120, 95,  99,  120,  95
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
    db 45 ; catch rate
	db 220 ; base exp
	db METAL_COAT, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

    ; tm/hm learnset
	tmhm DRAIN_PUNCH, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, SOLARBEAM, IRON_HEAD, THUNDER, RETURN, DOUBLE_EDGE, SHADOW_BALL, DARK_PULSE, ICE_PUNCH, SLEEP_TALK, FIRE_BLAST, SWIFT, THUNDERPUNCH, REST, FIRE_PUNCH, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, ICE_BEAM, X_SCISSOR, AURA_SPHERE, FLY
	; end

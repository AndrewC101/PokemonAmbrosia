	db PORYGONZ ; 184

	db 85,  70,  70,  90,  145,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
    db 30 ; catch rate
	db 241 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/porygonz/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, SOLARBEAM, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, THUNDER, RETURN, DOUBLE_EDGE, PSYCHIC_M, AURA_SPHERE, SLEEP_TALK, SWIFT, REST, FLASH, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM, BODY_SLAM, DARK_PULSE, SHADOW_BALL, NASTY_PLOT, HEADBUTT, DIG, IRON_HEAD
	; end

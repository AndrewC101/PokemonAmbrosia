	db CHINCHOU ; 170

	db  65,  75,  45,  55,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, ICE ; type
	db 45 ; catch rate
	db 64 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/chinchou/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, ICE_BEAM, ICY_WIND, BLIZZARD, DRAGON_PULSE, ICE_PUNCH, RAIN_DANCE, DIG, BODY_SLAM, SWORDS_DANCE, IRON_HEAD, HEADBUTT, ICE_PUNCH, WATERFALL
	; end

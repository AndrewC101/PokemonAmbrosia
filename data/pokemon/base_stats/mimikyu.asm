	db MIMIKYU ; 101

	db  115, 145, 92, 87,  75,  86
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, ICE ; type
	db 10 ; catch rate
	db 250 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm CURSE, HIDDEN_POWER, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, ICE_BEAM, ICY_WIND, BLIZZARD, DRAGON_PULSE, ICE_PUNCH, RAIN_DANCE, DIG, BODY_SLAM, SWORDS_DANCE, IRON_HEAD, HEADBUTT, THUNDERPUNCH, DRAIN_PUNCH, EARTHQUAKE, HYPER_BEAM, ICE_PUNCH, WATERFALL
	; end

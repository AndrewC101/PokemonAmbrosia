	db ARCTOZOLT ; 050

	db  90, 100,  90,  55,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ICE ; type
	db 45 ; catch rate
	db 177 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/DRAGONITE/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_MONSTER, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, FLASH, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM, BLIZZARD, THUNDERPUNCH, ICE_PUNCH, BODY_SLAM, TAUNT
	; end

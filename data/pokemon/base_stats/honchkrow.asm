	db HONCHKROW ; 119

	db  100,  125,  52,  71,  105,  52
	;   hp  atk  def  spd  sat  sdf

	db DARK, FLYING ; type
	db 30 ; catch rate
	db 177 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, ICY_WIND, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SWIFT, REST, FLY, ROOST, NASTY_PLOT, FLASH, THUNDER_WAVE, ROCK_SMASH, TAUNT
	; end

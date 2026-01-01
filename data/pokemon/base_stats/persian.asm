	db PERSIAN ; 053

	db  65,  80,  60, 115,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/persian/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, ICY_WIND, PROTECT, SUBSTITUTE, IRON_HEAD, THUNDER, RETURN, DOUBLE_EDGE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SWIFT, REST, THUNDERBOLT, NASTY_PLOT, TAUNT, SWORDS_DANCE
	; end

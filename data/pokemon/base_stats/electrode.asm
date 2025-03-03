	db ELECTRODE ; 101

	db  60,  70,  70, 150,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/electrode/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, FLASH, THUNDERBOLT, THUNDER_WAVE, SELFDESTRUCT, EXPLOSION
	; end

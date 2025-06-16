	db STARAVIA ; 017

	db  55,  75,  50,  80,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 120 ; catch rate
	db 113 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/staravia/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_FLYING, EGG_FLYING ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, FLY, DOUBLE_EDGE, ROOST, IRON_HEAD, ROCK_SMASH, TAUNT
	; end

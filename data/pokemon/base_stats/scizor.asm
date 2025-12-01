	db SCIZOR ; 212

	db  70, 130, 100,  65,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, STEEL ; type
	db 25 ; catch rate
	db 200 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/scizor/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, DRAIN_PUNCH, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SLEEP_TALK, SANDSTORM, SWIFT, REST, X_SCISSOR, CUT, STRENGTH, THUNDERPUNCH, ROOST, SWORDS_DANCE, FLY
	; end

	db VENIPEDE ; 010

	db  30,  45,  59,  57,  30,  39
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 255 ; catch rate
	db 52 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/venipede/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, HEADBUTT, PROTECT, DOUBLE_EDGE, TOXIC, SLUDGE_BOMB, X_SCISSOR, SOLARBEAM, GIGA_DRAIN, SUBSTITUTE, REST, DIG, CUT, RETURN, SLEEP_TALK, TAUNT, HIDDEN_POWER
	; end

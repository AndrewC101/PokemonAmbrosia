	db AEGISLASH ; 015

	db  60,  150,  60,  20,  150,  60
	;   hp  atk  def  spd  sat  sdf

	db STEEL, GHOST ; type
	db 45 ; catch rate
	db 234 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_MINERAL, EGG_MINERAL ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, DRAIN_PUNCH, CURSE, ROCK_SMASH, HIDDEN_POWER, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, SLEEP_TALK, REST, STRENGTH, CUT, ROCK_SLIDE, EARTHQUAKE, FISSURE, SHADOW_BALL, DARK_PULSE, X_SCISSOR, SWIFT, SWORDS_DANCE, NASTY_PLOT, AURA_SPHERE
	; end

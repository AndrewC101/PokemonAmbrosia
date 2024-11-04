	db ZYGARDE ; 046

	db  216,  100,  121,  85,  91,  95
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, GROUND ; type
	db 2 ; catch rate
	db 255 ; base exp
	db NO_ITEM, NO_ITEM ; items
    db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/arceus/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, HYPER_BEAM, PROTECT, SUBSTITUTE, IRON_HEAD, DRAGON_PULSE, RETURN, DOUBLE_EDGE, SLEEP_TALK, SANDSTORM, SWIFT, REST, X_SCISSOR, CUT, STRENGTH, EARTHQUAKE, EARTH_POWER, ROCK_SLIDE, BULK_UP, DIG, FISSURE
	; end

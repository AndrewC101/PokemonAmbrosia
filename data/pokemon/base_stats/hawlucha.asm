	db HAWLUCHA ; 047

	db  78,  92,  75,  118,  74,  63
	;   hp  atk  def  spd  sat  sdf

	db FLYING, FIGHTING ; type
	db 100 ; catch rate
	db 175 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonair/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm CURSE, DRAIN_PUNCH, BODY_SLAM, THUNDERPUNCH, FIRE_PUNCH, HIDDEN_POWER, HYPER_BEAM, SUNNY_DAY, RAIN_DANCE, PROTECT, SUBSTITUTE, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, FLY, DOUBLE_EDGE, ROOST, BULK_UP, SWORDS_DANCE, IRON_HEAD, ROCK_SLIDE, DIG, AURA_SPHERE, EARTHQUAKE, TAUNT
	; end

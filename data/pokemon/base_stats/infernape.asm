	db INFERNAPE ; 157

	db  76,  104,  71, 108, 104,  71
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIGHTING ; type
	db 45 ; catch rate
	db 209 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/infernape/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, BULK_UP, HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SUBSTITUTE, IRON_HEAD, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, FIRE_BLAST, SWIFT, THUNDERPUNCH, REST, FIRE_PUNCH, CUT, STRENGTH, FLAMETHROWER, SWORDS_DANCE, NASTY_PLOT, THUNDERPUNCH, FIRE_PUNCH, ROCK_SLIDE, FLASH, AURA_SPHERE, GIGA_DRAIN
	; end

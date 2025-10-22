	db GROUDON ; 226

	db  100,  150,  140,  90,  100, 90
	;   hp  atk  def  spd  sat  sdf

	db GROUND, FIRE ; type
    db 3 ; catch rate
	db 255 ; base exp
	db NO_ITEM, CHARCOAL ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/groudon/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BULK_UP, BODY_SLAM, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SUBSTITUTE, SOLARBEAM, IRON_HEAD, THUNDER, RETURN, DOUBLE_EDGE, ICE_PUNCH, SLEEP_TALK, FIRE_BLAST, THUNDERPUNCH, REST, FIRE_PUNCH, STRENGTH, FLAMETHROWER, THUNDERBOLT, THUNDER_WAVE, ROCK_SLIDE, SWORDS_DANCE, FISSURE, HORN_DRILL, FLASH, CUT, EARTHQUAKE, EARTH_POWER, DIG, TAUNT
	; end

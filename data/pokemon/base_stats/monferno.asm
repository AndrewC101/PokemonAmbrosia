	db MONFERNO ; 156

	db  64,  78,  52,  81,  78,  52
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIGHTING ; type
	db 45 ; catch rate
	db 142 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/monferno/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, BULK_UP, HEADBUTT, CURSE, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, PROTECT, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, CUT, STRENGTH, FLAMETHROWER, SWORDS_DANCE, NASTY_PLOT, THUNDERPUNCH, FIRE_PUNCH, ROCK_SLIDE, FLASH, AURA_SPHERE, GIGA_DRAIN, TAUNT
	; end

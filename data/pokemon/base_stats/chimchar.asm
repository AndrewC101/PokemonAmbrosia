	db CHIMCHAR ; 155

	db  44,  58,  44,  61,  58,  44
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F12_5 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/chimchar/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BULK_UP, BODY_SLAM, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, CUT, FLAMETHROWER, SWORDS_DANCE, NASTY_PLOT, THUNDERPUNCH, FIRE_PUNCH, FLASH, AURA_SPHERE, GIGA_DRAIN, TAUNT
	; end

	db CONKELDURR ; 189

	db  105,  140,  95, 45,  55,  65
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 193 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/conkeldurr/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_HUMANSHAPE, EGG_HUMANSHAPE ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BULK_UP, BODY_SLAM, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SUBSTITUTE, EARTHQUAKE, ROCK_SLIDE, RETURN, DOUBLE_EDGE, DIG, ICE_PUNCH, SLEEP_TALK, FIRE_BLAST, THUNDERPUNCH, REST, ROCK_SLIDE, FIRE_PUNCH, STRENGTH, IRON_HEAD, FISSURE, AURA_SPHERE, TAUNT
	; end

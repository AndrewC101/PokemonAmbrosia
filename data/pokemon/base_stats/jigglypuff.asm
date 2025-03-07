	db JIGGLYPUFF ; 039

	db 50, 85,  100,  50,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db STEEL, FAIRY ; type
	db 90 ; catch rate
	db 133 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_FAST ; growth rate
	dn EGG_FAIRY, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, IRON_HEAD, BODY_SLAM, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, PROTECT, RAIN_DANCE, SUBSTITUTE, RETURN, DOUBLE_EDGE, ICE_PUNCH, SLEEP_TALK, THUNDERPUNCH, REST, FIRE_PUNCH, STRENGTH, FLASH, ROCK_SLIDE, SOLARBEAM, ICY_WIND, SANDSTORM, SWORDS_DANCE, FLAMETHROWER, ICE_BEAM, FIRE_BLAST, SLUDGE_BOMB, SHADOW_BALL, DARK_PULSE, AURA_SPHERE, PSYCHIC_M, EARTHQUAKE, DIG
	; end

	db NINETALES ; 038

	db  73,  76,  75, 100, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FAIRY ; type
	db 75 ; catch rate
	db 178 ; base exp
	db BURNT_BERRY, BURNT_BERRY ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ninetales/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, ROAR, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, SUBSTITUTE, IRON_HEAD, RETURN, DOUBLE_EDGE, DIG, SLEEP_TALK, FIRE_BLAST, SWIFT, REST, FLAMETHROWER, NASTY_PLOT, AURA_SPHERE, GIGA_DRAIN, SHADOW_BALL, DARK_PULSE, PSYCHIC_M, FLASH, EARTH_POWER, SOLARBEAM
	; end

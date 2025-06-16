	db HO_OH ; 250

	db 106, 130,  90,  90, 110, 154
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 255 ; base exp
	db SACRED_ASH, SACRED_ASH ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/ho_oh/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm CURSE, BODY_SLAM, ROAR, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, RAIN_DANCE, GIGA_DRAIN, SUBSTITUTE, SOLARBEAM, DRAGON_PULSE, THUNDER, EARTHQUAKE, EARTH_POWER, RETURN, DOUBLE_EDGE, PSYCHIC_M, SWORDS_DANCE, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWIFT, REST, FLY, ROOST, STRENGTH, FLASH, FLAMETHROWER, THUNDERBOLT, CUT
	; end

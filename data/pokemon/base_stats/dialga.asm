	db DIALGA ; 236

	db  100,  150,  120,  90,  120,  100
	;   hp  atk  def  spd  sat  sdf

	db STEEL, DRAGON ; type
    db 3 ; catch rate
	db 255 ; base exp
	db METAL_COAT, METAL_COAT ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/rayquaza/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BULK_UP, BODY_SLAM, HEADBUTT, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, BLIZZARD, ICE_BEAM, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, DRAGON_PULSE, THUNDER, RETURN, DOUBLE_EDGE, ICE_PUNCH, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWIFT, THUNDERPUNCH, REST, FIRE_PUNCH, SURF, STRENGTH, FLAMETHROWER, THUNDERBOLT, THUNDER_WAVE, ICE_BEAM, CUT, EARTHQUAKE, EARTH_POWER, CALM_MIND, AURA_SPHERE, DIG, TAUNT, FLASH, FISSURE, HORN_DRILL
	; end

	db XERNEAS ; 238

	db  126,  131,  95,  99,  131,  98
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
    db 3 ; catch rate
	db 255 ; base exp
	db POLKADOT_BOW, POLKADOT_BOW ; items
	db GENDER_UNKNOWN ; gender ratio
	db 100 ; unknown 1
	db 120 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/xerneas/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_NONE, EGG_NONE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, BODY_SLAM, CURSE, TOXIC, ROCK_SMASH, HIDDEN_POWER, SUNNY_DAY, SANDSTORM, HYPER_BEAM, PROTECT, RAIN_DANCE, SUBSTITUTE, SOLARBEAM, GIGA_DRAIN, THUNDER, RETURN, DOUBLE_EDGE, PSYCHIC_M, CALM_MIND, AURA_SPHERE, SHADOW_BALL, DARK_PULSE, SLEEP_TALK, SWIFT, REST, STRENGTH, FLASH, THUNDERBOLT, THUNDER_WAVE, EARTH_POWER, EARTHQUAKE, IRON_HEAD, CUT, SWORDS_DANCE, TAUNT, HORN_DRILL
	; end

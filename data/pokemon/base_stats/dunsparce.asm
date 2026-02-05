	db DUNSPARCE ; 206

db  92,  105, 90,  98,  125,  90
	;   hp  atk  def  spd  sat  sdf

	db DARK, DRAGON ; type
	db 45 ; catch rate
	db 240 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/dragonite/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_DRAGON, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, SUBSTITUTE, THUNDER_WAVE, RETURN, DOUBLE_EDGE, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, REST, FLAMETHROWER, NASTY_PLOT, TAUNT, DRAGON_PULSE, DARK_PULSE, AURA_SPHERE, EARTH_POWER, ROOST, SHADOW_BALL, X_SCISSOR, IRON_HEAD, BODY_SLAM, ROCK_SLIDE, RAIN_DANCE, SUNNY_DAY, ROCK_SMASH, FLY, FLASH, CUT, STRENGTH, SURF, EARTHQUAKE, FISSURE
	; end

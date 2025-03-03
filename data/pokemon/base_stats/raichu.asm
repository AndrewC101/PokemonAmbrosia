	db RAICHU ; 026

	db  60,  90,  55, 111,  85,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp
	db MAGNET, NO_ITEM ; items
	db GENDER_F25 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/raichu/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_GROUND, EGG_FAIRY ; egg groups

	; tm/hm learnset
	tmhm DRAIN_PUNCH, BODY_SLAM, HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, SUBSTITUTE, IRON_HEAD, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, THUNDERPUNCH, REST, STRENGTH, FLASH, THUNDERBOLT, THUNDER_WAVE, NASTY_PLOT, SURF, AURA_SPHERE
	; end

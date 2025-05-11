	db MIMIKYU ; 101

	db  55, 100,  80, 96,  50,  105
	;   hp  atk  def  spd  sat  sdf

	db GHOST, FAIRY ; type
	db 45 ; catch rate
	db 167 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F75 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/abra/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, HYPER_BEAM, PROTECT, RAIN_DANCE, SUNNY_DAY, SUBSTITUTE, THUNDER, RETURN, DOUBLE_EDGE, SLEEP_TALK, SWIFT, REST, FLASH, THUNDERBOLT, SHADOW_BALL, DARK_PULSE, GIGA_DRAIN, X_SCISSOR, SWORDS_DANCE, THUNDER_WAVE, DRAIN_PUNCH, BULK_UP, FIRE_PUNCH, THUNDERPUNCH, ICE_PUNCH
	; end

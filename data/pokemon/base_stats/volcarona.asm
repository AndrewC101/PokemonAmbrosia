	db VOLCARONA ; 049

	db  85,  60,  65,  100,  135,  105
	;   hp  atk  def  spd  sat  sdf

	db BUG, FIRE ; type
	db 15 ; catch rate
	db 248 ; base exp
	db SILVERPOWDER, SILVERPOWDER ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 5 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/volcarona/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_BUG, EGG_BUG ; egg groups

	; tm/hm learnset
	tmhm CURSE, TOXIC, HIDDEN_POWER, SUNNY_DAY, HYPER_BEAM, PROTECT, GIGA_DRAIN, SUBSTITUTE, SOLARBEAM, RETURN, DOUBLE_EDGE, PSYCHIC_M, SLEEP_TALK, SLUDGE_BOMB, SWIFT, REST, FLASH, FIRE_BLAST, ROOST, X_SCISSOR, FLY, FLAMETHROWER, EARTH_POWER
	; end

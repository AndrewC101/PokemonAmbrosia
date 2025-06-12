Marts:
; entries correspond to MART_* constants (see constants/mart_constants.asm)
	table_width 2, Marts
	dw MartCherrygrove
	dw MartCherrygroveDex
	dw MartViolet
	dw MartAzalea
	dw MartCianwood
	dw MartGoldenrod2F1
	dw MartGoldenrod2F2
	dw MartGoldenrod3F
	dw MartGoldenrod4F
	dw MartGoldenrod5F
	dw MartOlivine
	dw MartEcruteak
	dw MartMahogany1
	dw MartMahogany2
	dw MartBlackthorn
	dw MartViridian
	dw MartPewter
	dw MartCerulean
	dw MartLavender
	dw MartVermilion
	dw MartCeladon2F1
	dw MartCeladon2F2
	dw MartCeladon3F
	dw MartCeladon4F
	dw MartCeladon5F1
	dw MartCeladon5F2
	dw MartFuchsia
	dw MartSaffron
	dw MartMtMoon
	dw MartIndigoPlateau
	dw MartUnderground
	dw MartPatches
	dw MartFrontier
	dw MartBerry
	assert_table_length NUM_MARTS

MartCherrygrove:
	db 4 ; # items
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartCherrygroveDex:
	db 5 ; # items
	db POKE_BALL
	db POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db -1 ; end

MartViolet:
	db 11 ; # items
	db POKE_BALL
	db LEVEL_BALL
	db POTION
	db ETHER
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db X_DEFEND
	db X_ATTACK
	db X_SPEED
	db FLOWER_MAIL
	db -1 ; end

MartAzalea:
	db 8 ; # items
	db CHARCOAL
	db POKE_BALL
	db POTION
	db ETHER
	db SUPER_POTION
	db ANTIDOTE
	db PARLYZ_HEAL
	db FRIEND_BALL
	db -1 ; end

MartCianwood:
	db 6 ; # items
	db POTION
	db SUPER_POTION
	db HYPER_POTION
	db MAX_ETHER
	db FULL_HEAL
	db REVIVE
	db -1 ; end

MartGoldenrod2F1:
	db 8 ; # items
	db POTION
	db SUPER_POTION
	db ETHER
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db -1 ; end

MartGoldenrod2F2:
	db 6 ; # items
	db POKE_BALL
	db GREAT_BALL
	db LOVE_BALL
	db REVIVE
	db FULL_HEAL
	db FLOWER_MAIL
	db -1 ; end

MartGoldenrod3F:
	db 7 ; # items
	db FIRE_STONE
	db WATER_STONE
	db LEAF_STONE
	db THUNDERSTONE
	db MOON_STONE
	db SUN_STONE
	db EVIOLITE
	db -1 ; end

MartGoldenrod4F:
	db 6 ; # items
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db HP_UP
	db PP_UP
	db -1 ; end

MartGoldenrod5F:
	db 3 ; # items
	db TM_THUNDERPUNCH
	db TM_FIRE_PUNCH
	db TM_ICE_PUNCH
	db -1 ; end

MartOlivine:
	db 10 ; # items
	db GREAT_BALL
	db LURE_BALL
	db SUPER_POTION
	db HYPER_POTION
	db MAX_ETHER
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db ICE_HEAL
	db SURF_MAIL
	db -1 ; end

MartEcruteak:
	db 12 ; # items
	db POKE_BALL
	db GREAT_BALL
	db MOON_BALL
	db POTION
	db SUPER_POTION
	db MAX_ETHER
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db ICE_HEAL
	db REVIVE
	db -1 ; end

MartMahogany1:
	db 4 ; # items
	db TINYMUSHROOM
	db SLOWPOKETAIL
	db POKE_BALL
	db POTION
	db -1 ; end

MartMahogany2:
	db 10 ; # items
	db RAGECANDYBAR
	db GREAT_BALL
	db FAST_BALL
	db SUPER_POTION
	db HYPER_POTION
	db ELIXER
	db ANTIDOTE
	db PARLYZ_HEAL
	db REVIVE
	db FLOWER_MAIL
	db -1 ; end

MartBlackthorn:
	db 11 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db HEAVY_BALL
	db HYPER_POTION
	db MAX_POTION
	db ELIXER
	db FULL_HEAL
	db REVIVE
	db X_DEFEND
	db X_ATTACK
	db -1 ; end

MartViridian:
	db 10 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_ETHER
	db FULL_HEAL
	db REVIVE
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db FLOWER_MAIL
	db -1 ; end

MartPewter:
	db 7 ; # items
	db GREAT_BALL
	db SUPER_POTION
	db MAX_ETHER
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartCerulean:
	db 8 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db MAX_ETHER
	db FULL_HEAL
	db X_DEFEND
	db X_ATTACK
	db SURF_MAIL
	db -1 ; end

MartLavender:
	db 8 ; # items
	db GREAT_BALL
	db POTION
	db SUPER_POTION
	db MAX_ETHER
	db ANTIDOTE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db -1 ; end

MartVermilion:
	db 9 ; # items
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db MAX_ETHER
	db REVIVE
	db PARLYZ_HEAL
	db AWAKENING
	db BURN_HEAL
	db LITEBLUEMAIL
	db -1 ; end

MartCeladon2F1:
	db 5 ; # items
	db MAX_POTION
	db FULL_RESTORE
	db REVIVE
	db MAX_REVIVE
	db MAX_ELIXER
	db -1 ; end

MartCeladon2F2:
	db 9 ; # items
	db POKE_BALL
	db GREAT_BALL
	db ULTRA_BALL
	db FULL_HEAL
	db ANTIDOTE
	db BURN_HEAL
	db ICE_HEAL
	db AWAKENING
	db PARLYZ_HEAL
	db -1 ; end

MartCeladon3F:
	db 3 ; # items
    db TM_SELFDESTRUCT
	db TM_EXPLOSION
    db TM_HYPER_BEAM
	db -1 ; end

MartCeladon4F:
	db 3 ; # items
	db POKE_DOLL
	db LOVELY_MAIL
	db SURF_MAIL
	db -1 ; end

MartCeladon5F1:
	db 6 ; # items
	db HP_UP
	db PROTEIN
	db IRON
	db CARBOS
	db CALCIUM
	db PP_UP
	db -1 ; end

MartCeladon5F2:
	db 16 ; # items
	db PINK_BOW
	db BLACKBELT_I
	db SHARP_BEAK
	db SOFT_SAND
	db HARD_STONE
	db SILVERPOWDER
	db SPELL_TAG
	db CHARCOAL
	db MYSTIC_WATER
	db MIRACLE_SEED
	db MAGNET
	db TWISTEDSPOON
	db NEVERMELTICE
	db DRAGON_SCALE
	db BLACKGLASSES
	db POLKADOT_BOW
	db -1 ; end

MartFuchsia:
	db 9 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db SUPER_POTION
	db HYPER_POTION
	db MAX_ELIXER
	db MAX_REVIVE
	db FULL_HEAL
	db FLOWER_MAIL
	db HEAVY_BOOTS
	db -1 ; end

MartSaffron:
	db 11 ; # items
	db GREAT_BALL
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db MAX_ELIXER
	db MAX_REVIVE
	db FULL_HEAL
	db X_ATTACK
	db X_DEFEND
	db FLOWER_MAIL
	db -1 ; end

MartMtMoon:
	db 6 ; # items
	db POKE_DOLL
	db FRESH_WATER
	db SODA_POP
	db LEMONADE
	db PORTRAITMAIL
	db MOON_STONE
	db -1 ; end

MartIndigoPlateau:
	db 8 ; # items
	db ULTRA_BALL
	db HYPER_POTION
	db MAX_POTION
	db FULL_RESTORE
	db MAX_ELIXER
	db MAX_REVIVE
	db REVIVE
	db FULL_HEAL
	db -1 ; end

MartUnderground:
	db 4 ; # items
	db ENERGYPOWDER
	db ENERGY_ROOT
	db HEAL_POWDER
	db REVIVAL_HERB
	db -1 ; end

MartPatches:
    db 16 ; # items
    db RARE_CANDY
    db MASTER_BALL
    db LEFTOVERS
    db LIFE_ORB
    db CHOICE_BAND
    db CHOICE_SPECS
    db ASSAULT_VEST
    db FOCUS_SASH
    db MUSCLE_BAND
    db WISE_GLASSES
    db EXPERT_BELT
    db FLAME_ORB
    db HEAVY_BOOTS
    db QUICK_CLAW
    db BRIGHTPOWDER
    db SACRED_ASH
    db -1

MartFrontier:
    db 16 ; # items
    db FULL_RESTORE
    db MAX_REVIVE
    db MAX_ELIXER
    db LEFTOVERS
    db LIFE_ORB
    db CHOICE_BAND
    db CHOICE_SPECS
    db ASSAULT_VEST
    db FOCUS_SASH
    db MUSCLE_BAND
    db WISE_GLASSES
    db EXPERT_BELT
    db FLAME_ORB
    db HEAVY_BOOTS
    db SCOPE_LENS
    db LUCKY_EGG
    db -1

MartBerry:
 	db 9 ; # items
 	db BERRY
 	db PSNCUREBERRY
 	db BITTER_BERRY
 	db PRZCUREBERRY
 	db BURNT_BERRY
 	db ICE_BERRY
 	db MINT_BERRY
 	db GOLD_BERRY
 	db MIRACLEBERRY
 	db -1 ; end

DefaultMart:
	db 2 ; # items
	db POKE_BALL
	db POTION
	db -1 ; end

; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemDescriptions (see data/items/descriptions.asm)
; - ItemAttributes (see data/items/attributes.asm)
; - ItemEffects (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM      ; 00
	const MASTER_BALL  ; 01
	const ULTRA_BALL   ; 02
	const BRIGHTPOWDER ; 03
	const GREAT_BALL   ; 04
	const POKE_BALL    ; 05
	const TOWN_MAP     ; 06
	const BICYCLE      ; 07
	const MOON_STONE   ; 08
	const ANTIDOTE     ; 09
	const BURN_HEAL    ; 0a
	const ICE_HEAL     ; 0b
	const AWAKENING    ; 0c
	const PARLYZ_HEAL  ; 0d
	const FULL_RESTORE ; 0e
	const MAX_POTION   ; 0f
	const HYPER_POTION ; 10
	const SUPER_POTION ; 11
	const POTION       ; 12
	const ESCAPE_POD   ; 13
	const WARP_DEVICE  ; 14
	const MAX_ELIXER   ; 15
	const FIRE_STONE   ; 16
	const THUNDERSTONE ; 17
	const WATER_STONE  ; 18
	const POCKET_PC    ; 19
	const HP_UP        ; 1a
	const PROTEIN      ; 1b
	const IRON         ; 1c
	const CARBOS       ; 1d
	const HOLY_CROWN   ; 1e
	const CALCIUM      ; 1f
	const RARE_CANDY   ; 20
	const X_ACCURACY   ; 21
	const LEAF_STONE   ; 22
	const CHOICE_SPECS ; 23
	const NUGGET       ; 24
	const POKE_DOLL    ; 25
	const FULL_HEAL    ; 26
	const REVIVE       ; 27
	const MAX_REVIVE   ; 28
	const ASSAULT_VEST ; 29
	const GOLD_DICE    ; 2a
	const RUNNING_SHOES; 2b
	const REPULSOR     ; 2c
	const MARK_OF_GOD  ; 2d
	const FRESH_WATER  ; 2e
	const SODA_POP     ; 2f
	const LEMONADE     ; 30
	const X_ATTACK     ; 31
	const HAND_OF_GOD  ; 32
	const X_DEFEND     ; 33
	const X_SPEED      ; 34
	const X_SPECIAL    ; 35
	const COIN_CASE    ; 36
	const ITEMFINDER   ; 37
	const POKE_FLUTE   ; 38
	const EXP_SHARE    ; 39
	const OLD_ROD      ; 3a
	const GOOD_ROD     ; 3b
	const SILVER_LEAF  ; 3c  find a use for this?
	const SUPER_ROD    ; 3d
	const PP_MAX        ; 3e
	const ETHER        ; 3f
	const MAX_ETHER    ; 40
	const ELIXER       ; 41
	const REMEMBRALL   ; 42
	const SECRETPOTION ; 43
	const S_S_TICKET   ; 44
	const MYSTERY_EGG  ; 45
	const CLEAR_BELL   ; 46
	const SILVER_WING  ; 47
	const MOOMOO_MILK  ; 48  this can be changed?
	const QUICK_CLAW   ; 49
	const PSNCUREBERRY ; 4a
	const GOLD_LEAF    ; 4b  find a use for this
	const SOFT_SAND    ; 4c
	const SHARP_BEAK   ; 4d
	const PRZCUREBERRY ; 4e
	const BURNT_BERRY  ; 4f
	const ICE_BERRY    ; 50
	const POISON_BARB  ; 51
	const KINGS_ROCK   ; 52
	const BITTER_BERRY ; 53
	const MINT_BERRY   ; 54
	const RED_APRICORN ; 55
	const TINYMUSHROOM ; 56
	const BIG_MUSHROOM ; 57
	const SILVERPOWDER ; 58
	const BLU_APRICORN ; 59
	const FLAME_ORB    ; 5a
	const AMULET_COIN  ; 5b
	const YLW_APRICORN ; 5c
	const GRN_APRICORN ; 5d
	const CLEANSE_TAG  ; 5e
	const MYSTIC_WATER ; 5f
	const TWISTEDSPOON ; 60
	const WHT_APRICORN ; 61
	const BLACKBELT_I  ; 62
	const BLK_APRICORN ; 63
	const HEAVY_BOOTS  ; 64
	const PNK_APRICORN ; 65
	const BLACKGLASSES ; 66
	const SLOWPOKETAIL ; 67
	const PINK_BOW     ; 68
	const MUSCLE_BAND  ; 69
	const RED_EYE_ORB  ; 6a
	const NEVERMELTICE ; 6b
	const MAGNET       ; 6c
	const MIRACLEBERRY ; 6d
	const PEARL        ; 6e
	const BIG_PEARL    ; 6f
	const EVIOLITE    ; 70
	const SPELL_TAG    ; 71
	const RAGECANDYBAR ; 72
	const GS_BALL      ; 73
	const BLUE_CARD    ; 74
	const MIRACLE_SEED ; 75
	const THICK_CLUB   ; 76
	const FOCUS_SASH   ; 77
	const STAR_PRIZE   ; 78
	const ENERGYPOWDER ; 79
	const ENERGY_ROOT  ; 7a
	const HEAL_POWDER  ; 7b
	const REVIVAL_HERB ; 7c
	const HARD_STONE   ; 7d
	const LUCKY_EGG    ; 7e
	const CARD_KEY     ; 7f
	const MACHINE_PART ; 80
	const EGG_TICKET   ; 81
	const LOST_ITEM    ; 82
	const STARDUST     ; 83
	const STAR_PIECE   ; 84
	const BASEMENT_KEY ; 85
	const PASS         ; 86
	const EXPERT_BELT  ; 87
	const LIFE_ORB     ; 88
	const CHOICE_BAND  ; 89
	const CHARCOAL     ; 8a
	const AMBROSIA     ; 8b
	const SCOPE_LENS   ; 8c
	const ITEM_8D      ; 8d
	const ITEM_8E      ; 8e
	const METAL_COAT   ; 8f
	const DRAGON_FANG  ; 90
	const ITEM_91      ; 91
	const LEFTOVERS    ; 92
	const ITEM_93      ; 93
	const ITEM_94      ; 94
	const ITEM_95      ; 95
	const MYSTERYBERRY ; 96
	const DRAGON_SCALE ; 97
	const BERSERK_GENE ; 98
	const ITEM_99      ; 99
	const ITEM_9A      ; 9a
	const ITEM_9B      ; 9b
	const SACRED_ASH   ; 9c
	const HEAVY_BALL   ; 9d - for heavy mon
	const FLOWER_MAIL  ; 9e
	const LEVEL_BALL   ; 9f - for low level mon
	const LURE_BALL    ; a0 - for rod mon
	const FAST_BALL    ; a1 - for fast mon
	const ITEM_A2      ; a2
	const LIGHT_BALL   ; a3
	const FRIEND_BALL  ; a4 - friendly ball
	const MOON_BALL    ; a5 - moon stone pokemon
	const LOVE_BALL    ; a6 - opposite gender
	const SILVER_PRIZE   ; a7
	const GOLD_PRIZE ; a8
	const SUN_STONE    ; a9
	const POLKADOT_BOW ; aa
	const ITEM_AB      ; ab
	const WISE_GLASSES ; ac
	const BERRY        ; ad
	const GOLD_BERRY   ; ae
	const SQUIRTBOTTLE ; af
	const ITEM_B0      ; b0
	const PARK_BALL    ; b1
	const RAINBOW_WING ; b2
	const ITEM_B3      ; b3
	const BRICK_PIECE  ; b4
	const SURF_MAIL    ; b5
	const LITEBLUEMAIL ; b6
	const PORTRAITMAIL ; b7
	const LOVELY_MAIL  ; b8
	const EON_MAIL     ; b9
	const MORPH_MAIL   ; ba
	const BLUESKY_MAIL ; bb
	const MUSIC_MAIL   ; bc
	const MIRAGE_MAIL  ; bd
	const ITEM_BE      ; be
NUM_ITEMS EQU const_value - 1

__tmhm_value__ = 1

add_tmnum: MACRO
\1_TMNUM EQU __tmhm_value__
__tmhm_value__ += 1
ENDM

add_tm: MACRO
; Defines three constants:
; - TM_\1: the item id, starting at $bf
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
TM{02d:__tmhm_value__}_MOVE = \1
	add_tmnum \1
ENDM

; see data/moves/tmhm_moves.asm for moves
TM01 EQU const_value
	add_tm DRAIN_PUNCH  ; bf
	add_tm HEADBUTT     ; c0
	add_tm CURSE        ; c1
	add_tm AURA_SPHERE  ; c2
	const ITEM_C3       ; c3
	add_tm ROAR         ; c4
	add_tm TOXIC        ; c5
	add_tm BODY_SLAM    ; c6
	add_tm ROCK_SMASH   ; c7
	add_tm ROOST        ; c8
	add_tm HIDDEN_POWER ; c9
	add_tm SUNNY_DAY    ; ca
	add_tm SELFDESTRUCT ; cb
	add_tm EXPLOSION    ; cc
	add_tm BLIZZARD     ; cd
	add_tm HYPER_BEAM   ; ce
	add_tm ICY_WIND     ; cf
	add_tm PROTECT      ; d0
	add_tm RAIN_DANCE   ; d1
	add_tm GIGA_DRAIN   ; d2
	add_tm HORN_DRILL   ; d3
	add_tm FISSURE      ; d4
	add_tm SOLARBEAM    ; d5
	add_tm IRON_HEAD    ; d6
	add_tm DRAGON_PULSE ; d7
	add_tm THUNDER      ; d8
	add_tm EARTHQUAKE   ; d9
	add_tm RETURN       ; da
	add_tm DIG          ; db
	const ITEM_DC       ; dc
	add_tm PSYCHIC_M    ; dd
	add_tm SHADOW_BALL  ; de
	add_tm THUNDERBOLT  ; df
	add_tm FLAMETHROWER ; e0
	add_tm ICE_PUNCH    ; e1
	add_tm EARTH_POWER  ; e2
	add_tm SLEEP_TALK   ; e3
	add_tm SLUDGE_BOMB  ; e4
	add_tm SANDSTORM    ; e5
	add_tm FIRE_BLAST   ; e6
	add_tm SWIFT        ; e7
	add_tm DOUBLE_EDGE  ; e8
	add_tm THUNDERPUNCH ; e9
	add_tm SUBSTITUTE   ; ea
	add_tm ICE_BEAM     ; eb
	add_tm REST         ; ec
	add_tm TAUNT        ; ed
	add_tm ROCK_SLIDE   ; ee
	add_tm THUNDER_WAVE ; ef
	add_tm FIRE_PUNCH   ; f0
	add_tm X_SCISSOR    ; f1
	add_tm DARK_PULSE   ; f2
NUM_TMS EQU __tmhm_value__ - 1

add_hm: MACRO
; Defines three constants:
; - HM_\1: the item id, starting at $f3
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
HM_VALUE = __tmhm_value__ - NUM_TMS
HM{02d:HM_VALUE}_MOVE = \1
	add_tmnum \1
ENDM

HM01 EQU const_value
	add_hm CUT          ; f3
	add_hm FLY          ; f4
	add_hm SURF         ; f5
	add_hm STRENGTH     ; f6
	add_hm FLASH        ; f7
	add_hm WHIRLPOOL    ; f8
	add_hm WATERFALL    ; f9
NUM_HMS EQU __tmhm_value__ - NUM_TMS - 1

add_mt: MACRO
; Defines two constants:
; - \1_TMNUM: the learnable TM/HM flag, starting at 58
; - MT##_MOVE: alias for the move id, equal to the value of \1
MT_VALUE = __tmhm_value__ - NUM_TMS - NUM_HMS
MT{02d:MT_VALUE}_MOVE = \1
	add_tmnum \1
ENDM

MT01 EQU const_value
	add_mt CALM_MIND
	add_mt BULK_UP
	add_mt NASTY_PLOT
	add_mt SWORDS_DANCE
NUM_TUTORS = __tmhm_value__ - NUM_TMS - NUM_HMS - 1

NUM_TM_HM_TUTOR EQU NUM_TMS + NUM_HMS + NUM_TUTORS

	const ITEM_FA       ; fa

USE_SCRIPT_VAR EQU $00
ITEM_FROM_MEM  EQU $ff

; leftovers from red
SAFARI_BALL    EQU $08 ; MOON_STONE
MOON_STONE_RED EQU $0a ; BURN_HEAL
FULL_HEAL_RED  EQU $34 ; X_SPEED

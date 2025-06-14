; item_attributes struct members (see data/items/attributes.asm)
rsreset
ITEMATTR_PRICE       rw
rsset ITEMATTR_PRICE
ITEMATTR_PRICE_LO    rb
ITEMATTR_PRICE_HI    rb
ITEMATTR_EFFECT      rb
ITEMATTR_PARAM       rb
ITEMATTR_PERMISSIONS rb
ITEMATTR_POCKET      rb
ITEMATTR_HELP        rb
ITEMATTR_STRUCT_LENGTH EQU _RS

; item types
	const_def 1
	const ITEM     ; 1
	const KEY_ITEM ; 2
	const BALL     ; 3
	const TM_HM    ; 4
NUM_ITEM_TYPES EQU const_value - 1

; item menu types
; UseItem.dw indexes (see engine/items/pack.asm)
; UseRegisteredItem.SwitchTo indexes (see engine/overworld/select_menu.asm)
	const_def
	const ITEMMENU_NOUSE   ; 0
	const_skip 3
	const ITEMMENU_CURRENT ; 4
	const ITEMMENU_PARTY   ; 5
	const ITEMMENU_CLOSE   ; 6

; item actions
CANT_SELECT_F EQU 6
CANT_TOSS_F   EQU 7

NO_LIMITS   EQU 0
CANT_SELECT EQU 1 << CANT_SELECT_F
CANT_TOSS   EQU 1 << CANT_TOSS_F

; pack pockets
	const_def
	const ITEM_POCKET     ; 0
	const BALL_POCKET     ; 1
	const KEY_ITEM_POCKET ; 2
	const TM_HM_POCKET    ; 3
NUM_POCKETS EQU const_value

; DevNote - BackPack
MAX_ITEMS     EQU 40
MAX_BALLS     EQU 12
MAX_KEY_ITEMS EQU 30
MAX_PC_ITEMS  EQU 40

MAX_ITEM_STACK EQU 99

; mail
MAIL_LINE_LENGTH   EQU $10
MAIL_MSG_LENGTH    EQU $20
MAILBOX_CAPACITY   EQU 10
MAIL_STRUCT_LENGTH EQU $2f ; mailmsg struct

; held item effects
	const_def
	const HELD_NONE
	const HELD_BERRY
	const HELD_CHOICE_BAND
	const HELD_LEFTOVERS
	const HELD_EXPERT_BELT
	const HELD_LIFE_ORB
	const HELD_RESTORE_PP
	const HELD_MUSCLE_BAND
	const HELD_CLEANSE_TAG

	const_next 10
	const HELD_HEAL_POISON
	const HELD_HEAL_FREEZE
	const HELD_HEAL_BURN
	const HELD_HEAL_SLEEP
	const HELD_HEAL_PARALYZE
	const HELD_HEAL_STATUS
	const HELD_HEAL_CONFUSION

	const_next 20
	const HELD_PREVENT_POISON
	const HELD_PREVENT_BURN
	const HELD_PREVENT_FREEZE
	const HELD_PREVENT_SLEEP
	const HELD_PREVENT_PARALYZE
	const HELD_PREVENT_CONFUSE

	const_next 30
	const HELD_EVIOLITE
	const HELD_ATTACK_UP
	const HELD_DEFENSE_UP
	const HELD_SPEED_UP
	const HELD_SP_ATTACK_UP
	const HELD_SP_DEFENSE_UP
	const HELD_ACCURACY_UP
	const HELD_EVASION_UP
	const HELD_ASSAULT_VEST

	const_next 40
	const HELD_HOLY_CROWN
	const HELD_WISE_GLASSES
	const HELD_CHOICE_SPECS
	const HELD_FLAME_ORB
	const HELD_HEAVY_BOOTS

	const_next 50
	const HELD_NORMAL_BOOST
	const HELD_FIGHTING_BOOST
	const HELD_FLYING_BOOST
	const HELD_POISON_BOOST
	const HELD_GROUND_BOOST
	const HELD_ROCK_BOOST
	const HELD_BUG_BOOST
	const HELD_GHOST_BOOST
	const HELD_FIRE_BOOST
	const HELD_WATER_BOOST
	const HELD_GRASS_BOOST
	const HELD_ELECTRIC_BOOST
	const HELD_PSYCHIC_BOOST
	const HELD_ICE_BOOST
	const HELD_DRAGON_BOOST
	const HELD_DARK_BOOST
	const HELD_STEEL_BOOST
	const HELD_FAIRY_BOOST

	const_next 70
	const HELD_CATCH_CHANCE
	const HELD_71
	const HELD_ESCAPE
	const HELD_CRITICAL_UP
	const HELD_QUICK_CLAW
	const HELD_FLINCH
	const HELD_AMULET_COIN
	const HELD_BRIGHTPOWDER
	const_skip
	const HELD_FOCUS_BAND

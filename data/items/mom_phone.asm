momitem: MACRO
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM

MomItems_1:
	momitem      0,   600, MOM_ITEM, MIRACLEBERRY
	momitem      0,    90, MOM_ITEM, RARE_CANDY
	momitem      0,   180, MOM_ITEM, ULTRA_BALL
	momitem      0,   450, MOM_ITEM, PP_UP
	momitem      0,   500, MOM_ITEM, GOLD_BERRY
.End

MomItems_2:
	momitem   4000,   600, MOM_ITEM, MUSCLE_BAND
	momitem   5000,   600, MOM_ITEM, WISE_GLASSES
	momitem   7000,   600, MOM_ITEM, PINK_BOW
	momitem  10000,  1800, MOM_DOLL, DECO_CHARMANDER_DOLL
	momitem  15000,  3000, MOM_ITEM, FOCUS_SASH
	momitem  20000,   600, MOM_ITEM, ASSAULT_VEST
	momitem  30000,  4800, MOM_DOLL, DECO_CLEFAIRY_DOLL
	momitem  40000,   900, MOM_DOLL, DECO_PIKACHU_DOLL
	momitem  50000,  8000, MOM_DOLL, DECO_BIG_SNORLAX_DOLL
	momitem  80000, 10000, MOM_ITEM, LEFTOVERS
    momitem  90000, 10000, MOM_ITEM, LIFE_ORB
    momitem 100000, 10000, MOM_ITEM, CHOICE_BAND
    momitem 110000, 10000, MOM_ITEM, CHOICE_SPECS
	momitem 120000, 60000, MOM_ITEM, AMBROSIA
.End

	dt 0 ; unused

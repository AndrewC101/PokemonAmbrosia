MACRO npctrade
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3
	dname \4, NAME_LENGTH
	db \5, \6, \7
	dw \8
	dname \9, NAME_LENGTH
	db \<10>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH, NPCTrades
	npctrade TRADE_DIALOGSET_COLLECTOR, TEDDIURSA,   MAWILE,       "Arelle", $FE, $FF, METAL_COAT, 52042,    "Maxwell", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, LARVITAR,    CHARMANDER,   "Dante", $FF, $FE, CHARCOAL, 01314,      "Sparda", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     ALAKAZAM,    METAGROSS,    "ED209", $DD, $DD, METAL_COAT,   00209,  "OCP", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DRATINI,     BAGON,        "Vergil", $FF, $FE, DRAGON_SCALE, 01314,  "Eva", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    MIMIKYU,     LOPUNNY,      "Judy", $FE, $FF, AMULET_COIN,  02016,  "Nick", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_COLLECTOR, EXCADRILL,   AERODACTYL,   "Blitz", $DD, $DD, QUICK_CLAW,   01939,  "Wilhelm", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, LUCARIO,     KINGAMBIT,    "Terminator", ATKDEFDV_SHINY_1, SPDSPCDV_SHINY_1, EXPERT_BELT,  00101,  "Skynet", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DITTO,       MR__MIME,     "Bob", $DD, $DD, LUCKY_EGG,    01210, "Cat", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES

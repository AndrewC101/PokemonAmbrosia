npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1, \2, \3, \4, \5, \6, \7
	dw \8
	db \9, \<10>, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	table_width NPCTRADE_STRUCT_LENGTH, NPCTrades
	npctrade TRADE_DIALOGSET_COLLECTOR, TEDDIURSA,   MAWILE,       "Venus@@@@@@", $DD, $DD, METAL_COAT, 00666,    "Maxwell@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, LARVITAR,    CHARMANDER,   "Dante@@@@@@", $DD, $DD, CHARCOAL, 01314,      "Sparda@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_HAPPY,     ALAKAZAM,    METAGROSS,    "ED209@@@@@@", $DD, $DD, METAL_COAT,   00209,  "OCP@@@@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      KINGDRA,     SNORLAX,      "Hakuho@@@@@", $FF, $FF, LEFTOVERS,    01187,  "Miyagino@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    GARDEVOIR,   LOPUNNY,      "Pamela@@@@@", $DD, $DD, AMULET_COIN,  58008,  "Hefner@@@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_COLLECTOR, EXCADRILL,   AERODACTYL,   "Blitzkrieg@", $DD, $DD, QUICK_CLAW,   01939,  "Wilhelm@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, LUCARIO,     GENESECT,     "Terminator@", ATKDEFDV_SHINY_1, SPDSPCDV_SHINY_1, EXPERT_BELT,  00101,  "Skynet@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      DITTO,       MR__MIME,     "Bob@@@@@@@@", $DD, $DD, LUCKY_EGG,    01210, "Cat@@@@@@@@", TRADE_GENDER_EITHER
	assert_table_length NUM_NPC_TRADES

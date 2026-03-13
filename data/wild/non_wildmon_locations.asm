MACRO casinomon
; species, coins needed
	db \1
	dw \2
ENDM

MACRO specialencounter
; requested mon, offered mon, item, OT ID, OT name, gender requested
	db \1
	dw \2
	map_id \3
	dw \4
ENDM

CasinoMons::
; usually 3 per region, but not a hard coded limit
	; region map ; 2 bytes (group/ID)
	; species, coins (2 bytes)

	; johto, from maps\goldenrodgamecorner.asm
	map_id GOLDENROD_GAME_CORNER
	casinomon EEVEE, GOLDENRODGAMECORNER_ABRA_COINS
	casinomon PORYGON, GOLDENRODGAMECORNER_CUBONE_COINS
	casinomon MELTAN, GOLDENRODGAMECORNER_WOBBUFFET_COINS
	db -1
	; kanto, from maps\celadongamecornerprizeroom.asm
	map_id CELADON_GAME_CORNER_PRIZE_ROOM
	casinomon SMEARGLE, CELADONGAMECORNERPRIZEROOM_PIKACHU_COINS
	casinomon CHANSEY, CELADONGAMECORNERPRIZEROOM_PORYGON_COINS
	casinomon DITTO, CELADONGAMECORNERPRIZEROOM_LARVITAR_COINS
	db -1

NPCTradeMons_Locations::
; corresponds to NPCTrades:: in data\events\npc_trades.asm
	table_width 2 ; map is 2 bytes
	map_id SPROUT_TOWER_B1F         ; MAWILE
	map_id VIOLET_KYLES_HOUSE		; CHARMANDER
	map_id OLIVINE_TIMS_HOUSE 		; METAGROSS
	map_id BLACKTHORN_EMYS_HOUSE 	; BAGON
	map_id SAFFRON_CITY 	        ; LOPUNNY
	map_id ROUTE_2_GATE 			; AERODACTYL
	map_id POWER_PLANT 				; LUCARIO
	map_id COPYCATS_HOUSE_2F 	    ; MR MIME
	assert_table_length NUM_NPC_TRADES

EventWildMons::
; BROKEN: replace map_id with -1 to hide location but keep hint
; specialencounter 	 SPECIES,   EVENT_FLAG,                         map_id, blurb string ptr
	specialencounter MIMIKYU, 	EVENT_FOUGHT_SPIRITOMB, 		ROUTE_36, DefaultWildEventDescription
	specialencounter GYARADOS, 	EVENT_LAKE_OF_RAGE_RED_GYARADOS,LAKE_OF_RAGE, DefaultWildEventDescription
	specialencounter SNORLAX, 	EVENT_FOUGHT_SNORLAX,           VERMILION_CITY, DefaultWildEventDescription
	specialencounter ARTICUNO, 	EVENT_CAUGHT_ARTICUNO, 			SEAFOAM_GYM, DefaultWildEventDescription
	specialencounter ZAPDOS, 	EVENT_CAUGHT_ZAPDOS, 			POWER_PLANT, DefaultWildEventDescription
	specialencounter MOLTRES, 	EVENT_CAUGHT_MOLTRES, 			ROUTE_2, DefaultWildEventDescription
	specialencounter RAIKOU, 	EVENT_CAUGHT_RAIKOU, 			ROUTE_45, DefaultWildEventDescription
	specialencounter ENTEI, 	EVENT_CAUGHT_ENTEI, 			RUINS_OF_ALPH_INNER_CHAMBER, DefaultWildEventDescription
	specialencounter SUICUNE, 	EVENT_FOUGHT_SUICUNE, 			TIN_TOWER_1F, DefaultWildEventDescription
	specialencounter MEW, 	    EVENT_GOT_MEW, 			        BILLS_HOUSE, DefaultWildEventDescription
	specialencounter CELEBI, 	EVENT_CAUGHT_CELEBI, 			ILEX_FOREST, DefaultWildEventDescription
	specialencounter LATIAS, 	EVENT_CAUGHT_LATIAS, 			FUCHSIA_CITY, DefaultWildEventDescription
	specialencounter LATIOS, 	EVENT_CAUGHT_LATIOS, 			ROUTE_28, DefaultWildEventDescription
	specialencounter DEOXYS, 	EVENT_CAUGHT_DEOXYS, 			MUSEUM, DefaultWildEventDescription
	specialencounter DARKRAI, 	EVENT_CAUGHT_DARKRAI, 			ROCK_TUNNEL_B1F, DefaultWildEventDescription
	specialencounter SHAYMIN, 	EVENT_CAUGHT_SHAYMIN, 			LAVENDER_FOREST, DefaultWildEventDescription
	specialencounter GENESECT, 	-1, 			                ANCIENT_RUIN_PRESENT, DefaultWildEventDescription
	specialencounter LUGIA, 	EVENT_FOUGHT_LUGIA, 			WHIRL_ISLAND_LUGIA_CHAMBER, DefaultWildEventDescription
	specialencounter HO_OH, 	EVENT_FOUGHT_HO_OH, 			TIN_TOWER_ROOF, DefaultWildEventDescription
	specialencounter GROUDON, 	EVENT_CAUGHT_GROUDON, 			ELEMENT_CAVE, DefaultWildEventDescription
	specialencounter KYOGRE, 	EVENT_CAUGHT_KYOGRE, 			ELEMENT_CAVE, DefaultWildEventDescription
	specialencounter RAYQUAZA, 	EVENT_CAUGHT_RAYQUAZA, 			DRAGONS_DEN_B1F, DefaultWildEventDescription
	specialencounter DIALGA, 	EVENT_CAUGHT_DIALGA, 			SILVER_CAVE_ITEM_ROOMS, DefaultWildEventDescription
	specialencounter PALKIA, 	EVENT_CAUGHT_PALKIA, 			SILVER_CAVE_ITEM_ROOMS, DefaultWildEventDescription
	specialencounter GIRATINA, 	EVENT_CAUGHT_GIRATINA, 			ABYSS, DefaultWildEventDescription
	specialencounter REGIGIGAS, EVENT_CAUGHT_REGIGIGAS, 		CERULEAN_CAVE, DefaultWildEventDescription
	specialencounter XERNEAS, 	EVENT_CAUGHT_XERNEAS, 			ANCIENT_RUIN_PAST, DefaultWildEventDescription
	specialencounter YVELTAL, 	EVENT_CAUGHT_YVELTAL, 			ANCIENT_RUIN_PRESENT, DefaultWildEventDescription
	specialencounter ZYGARDE, 	EVENT_CAUGHT_ZYGARDE, 			ANCIENT_HALL, DefaultWildEventDescription
	specialencounter MEWTWO, 	EVENT_CAUGHT_MEWTWO, 			DESTINY_SQUARE, DefaultWildEventDescription
	specialencounter ARCEUS, 	EVENT_CAUGHT_ARCEUS, 			HALL_OF_ORIGIN, DefaultWildEventDescription
	db -1

; LoadWildMon Dex Hints, max 18 chars per line
DefaultWildEventDescription:
    db "A true fateful"
    next "encounter.@"


GiftMons::
; replace map_id with -1 to hide location but keep hint
; species, EVENT_FLAG, map_id, blurb string ptr
	specialencounter PIKACHU, 	EVENT_GOT_KENYA, 					ROUTE_35_GOLDENROD_GATE, DefaultGiftDescription
	specialencounter DRATINI, 	EVENT_GOT_DRATINI, 					DRAGON_SHRINE, DefaultGiftDescription
	specialencounter EEVEE,	 	EVENT_GOT_EEVEE, 					BILLS_FAMILYS_HOUSE, DefaultGiftDescription
	specialencounter LUCARIO, 	EVENT_GOT_LUCARIO_FROM_KIYO, 		MOUNT_MORTAR_1F_OUTSIDE, DefaultGiftDescription
	db -1

; GivePoke Dex Hints, max 18 chars per line
DefaultGiftDescription:
    db "Awaiting a good"
    next "trainer.@"

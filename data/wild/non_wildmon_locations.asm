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
	specialencounter MIMIKYU, 	EVENT_FOUGHT_SPIRITOMB, 		ROUTE_36, OverworldEncounterDescription
	specialencounter GYARADOS, 	EVENT_LAKE_OF_RAGE_RED_GYARADOS,LAKE_OF_RAGE, OverworldEncounterDescription
	specialencounter SNORLAX, 	EVENT_FOUGHT_SNORLAX,           VERMILION_CITY, OverworldEncounterDescription
	specialencounter ARTICUNO, 	EVENT_CAUGHT_ARTICUNO, 			SEAFOAM_GYM, LegendaryEncounterDescription
	specialencounter ZAPDOS, 	EVENT_CAUGHT_ZAPDOS, 			POWER_PLANT, LegendaryEncounterDescription
	specialencounter MOLTRES, 	EVENT_CAUGHT_MOLTRES, 			ROUTE_2, LegendaryEncounterDescription
	specialencounter RAIKOU, 	EVENT_CAUGHT_RAIKOU, 			ROUTE_45, LegendaryEncounterDescription
	specialencounter ENTEI, 	EVENT_CAUGHT_ENTEI, 			RUINS_OF_ALPH_INNER_CHAMBER, LegendaryEncounterDescription
	specialencounter SUICUNE, 	EVENT_FOUGHT_SUICUNE, 			TIN_TOWER_1F, LegendaryEncounterDescription
	specialencounter MEW, 	    EVENT_GOT_MEW, 			        BILLS_HOUSE, LegendaryEncounterDescription
	specialencounter CELEBI, 	EVENT_CAUGHT_CELEBI, 			ILEX_FOREST, LegendaryEncounterDescription
	specialencounter LATIAS, 	EVENT_CAUGHT_LATIAS, 			FUCHSIA_CITY, LegendaryEncounterDescription
	specialencounter LATIOS, 	EVENT_CAUGHT_LATIOS, 			ROUTE_28, LegendaryEncounterDescription
	specialencounter DEOXYS, 	EVENT_CAUGHT_DEOXYS, 			MUSEUM, LegendaryEncounterDescription
	specialencounter DARKRAI, 	EVENT_CAUGHT_DARKRAI, 			ROCK_TUNNEL_B1F, LegendaryEncounterDescription
	specialencounter SHAYMIN, 	EVENT_CAUGHT_SHAYMIN, 			LAVENDER_FOREST, LegendaryEncounterDescription
	specialencounter GENESECT, 	-1, 			                ANCIENT_RUIN_PRESENT, LegendaryEncounterDescription
	specialencounter LUGIA, 	EVENT_FOUGHT_LUGIA, 			WHIRL_ISLAND_LUGIA_CHAMBER, LegendaryEncounterDescription
	specialencounter HO_OH, 	EVENT_FOUGHT_HO_OH, 			TIN_TOWER_ROOF, LegendaryEncounterDescription
	specialencounter GROUDON, 	EVENT_CAUGHT_GROUDON, 			ELEMENT_CAVE, LegendaryEncounterDescription
	specialencounter KYOGRE, 	EVENT_CAUGHT_KYOGRE, 			ELEMENT_CAVE, LegendaryEncounterDescription
	specialencounter RAYQUAZA, 	EVENT_CAUGHT_RAYQUAZA, 			DRAGONS_DEN_B1F, LegendaryEncounterDescription
	specialencounter DIALGA, 	EVENT_CAUGHT_DIALGA, 			SILVER_CAVE_ITEM_ROOMS, LegendaryEncounterDescription
	specialencounter PALKIA, 	EVENT_CAUGHT_PALKIA, 			SILVER_CAVE_ITEM_ROOMS, LegendaryEncounterDescription
	specialencounter GIRATINA, 	EVENT_CAUGHT_GIRATINA, 			ABYSS, LegendaryEncounterDescription
	specialencounter REGIGIGAS, EVENT_CAUGHT_REGIGIGAS, 		CERULEAN_CAVE, LegendaryEncounterDescription
	specialencounter XERNEAS, 	EVENT_CAUGHT_XERNEAS, 			ANCIENT_RUIN_PAST, LegendaryEncounterDescription
	specialencounter YVELTAL, 	EVENT_CAUGHT_YVELTAL, 			ANCIENT_RUIN_PRESENT, LegendaryEncounterDescription
	specialencounter ZYGARDE, 	EVENT_CAUGHT_ZYGARDE, 			ANCIENT_HALL, LegendaryEncounterDescription
	specialencounter MEWTWO, 	EVENT_CAUGHT_MEWTWO, 			DESTINY_SQUARE, LegendaryEncounterDescription
	specialencounter ARCEUS, 	EVENT_CAUGHT_ARCEUS, 			HALL_OF_ORIGIN, LegendaryEncounterDescription

	; new bark town
	specialencounter STARLY,    -1, NEW_BARK_TOWN, OverworldEncounterDescription

	; route 29
	specialencounter RATICATE,    -1, ROUTE_29, OverworldEncounterDescription
	specialencounter URSARING,    -1, ROUTE_29, OverworldEncounterNight20Description
	specialencounter BUNEARY,    -1, ROUTE_29, OverworldEncounterDescription
	specialencounter NIDORAN_M,    -1, ROUTE_29, OverworldEncounterDescription
	specialencounter NIDORAN_F,    -1, ROUTE_29, OverworldEncounterDescription
	specialencounter CLEFAIRY,    -1, ROUTE_29, OverworldEncounterDescription
	specialencounter JOLTIK,    -1, ROUTE_29, OverworldEncounterDayDescription
	specialencounter MEOWTH,    -1, ROUTE_29, OverworldEncounterDescription
	specialencounter RIOLU,    -1, ROUTE_29, OverworldEncounterShinyDescription

	; cherrygrove
	specialencounter PIKACHU,    -1, CHERRYGROVE_CITY, OverworldEncounterDescription

    ; ROUTE 30
    specialencounter PERSIAN,    -1, ROUTE_30, OverworldEncounter50Description
    specialencounter NOCTOWL,    -1, ROUTE_30, OverworldEncounterNightDescription
    specialencounter MARILL,    -1, ROUTE_30, OverworldEncounterDescription
    specialencounter MUDKIP,    -1, ROUTE_30, OverworldEncounterDescription
    specialencounter VULPIX,    -1, ROUTE_30, OverworldEncounterDescription
    specialencounter VENIPEDE,    -1, ROUTE_30, OverworldEncounterDayDescription
    specialencounter GROWLITHE,    -1, ROUTE_30, OverworldEncounter50Description
    specialencounter RALTS,    -1, ROUTE_30, OverworldEncounterShinyDescription

    ; route 31
    specialencounter HOUNDOUR,    -1, ROUTE_31, OverworldEncounterDescription
    specialencounter HOUNDOOM,    -1, ROUTE_31, OverworldEncounterNightDescription
    specialencounter MAREEP,    -1, ROUTE_31, OverworldEncounterDescription
    specialencounter TIMBURR,    -1, ROUTE_31, OverworldEncounterDescription

    ; violet city
    specialencounter MURKROW,    -1, VIOLET_CITY, OverworldEncounterDescription
    specialencounter HOOTHOOT,    -1, VIOLET_CITY, OverworldEncounterDescription
    specialencounter STARAPTOR,    -1, VIOLET_CITY, OverworldEncounterDescription
    specialencounter MEOWTH,    -1, VIOLET_CITY, OverworldEncounterShiny50Description
    specialencounter STARLY,    -1, VIOLET_CITY, OverworldEncounterShinyDescription

    ; sprout tower
    specialencounter LAMPENT,    -1, SPROUT_TOWER_B1F, OverworldEncounterDescription
    specialencounter DOUBLADE,    -1, SPROUT_TOWER_B1F, OverworldEncounterDescription
    specialencounter HOUNDOUR,    -1, SPROUT_TOWER_B1F, OverworldEncounterShinyDescription
    specialencounter RATTATA,    -1, SPROUT_TOWER_2F, OverworldEncounterDescription
    specialencounter GASTLY,    -1, SPROUT_TOWER_2F, OverworldEncounterDescription
    specialencounter LITWICK,    -1, SPROUT_TOWER_3F, OverworldEncounterDescription
    specialencounter HONEDGE,    -1, SPROUT_TOWER_3F, OverworldEncounter50Description
    specialencounter BELLSPROUT,    -1, SPROUT_TOWER_3F, OverworldEncounterDescription

    ; route 32
    specialencounter CROBAT,    -1, ROUTE_32, OverworldEncounterDescription
    specialencounter MARSHTOMP,    -1, ROUTE_32, OverworldEncounter20Description
    specialencounter MUDKIP,    -1, ROUTE_32, OverworldEncounterDescription
    specialencounter SEADRA,    -1, ROUTE_32, OverworldEncounterDescription
    specialencounter SHELLDER,    -1, ROUTE_32, OverworldEncounterDescription
    specialencounter RIOLU,    -1, ROUTE_32, OverworldEncounterDescription

    ; ruins of alph
    specialencounter SNEASEL,    -1, RUINS_OF_ALPH_OUTSIDE, OverworldEncounterDescription
    specialencounter RALTS,    -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
    specialencounter ABRA,    -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
    specialencounter SOLOSIS,    -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
    specialencounter MELTAN,    -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
    specialencounter BELDUM,    -1, RUINS_OF_ALPH_KABUTO_WORD_ROOM, OverworldEncounterDescription
    specialencounter NOWN,    -1, RUINS_OF_ALPH_OMANYTE_WORD_ROOM, OverworldEncounterDescription
    specialencounter REUNICLUS,    -1, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, OverworldEncounterDescription
    specialencounter METAGROSS,    -1, RUINS_OF_ALPH_HO_OH_WORD_ROOM, OverworldEncounterDescription

    ; union cave
    specialencounter GOLEM,    -1, UNION_CAVE_B1F, OverworldEncounterDescription
    specialencounter GARCHOMP,    -1, UNION_CAVE_B1F, OverworldEncounterDescription
    specialencounter DRACOVISH,    -1, UNION_CAVE_B1F, OverworldEncounterDescription
    specialencounter GIBLE,    -1, UNION_CAVE_B1F, OverworldEncounterShinyDescription
	db -1

; LoadWildMon Dex Hints, max 18 chars per line
LegendaryEncounterDescription:
    db "A legendary"
    next "encounter.@"

OverworldEncounterDescription:
    db "An overworld"
    next "encounter.@"

OverworldEncounterNightDescription:
    db "An overworld"
    next "encounter."
    next "Night.@"

OverworldEncounterDayDescription:
    db "An overworld"
    next "encounter."
    next "Day.@"

OverworldEncounter50Description:
    db "An overworld"
    next "encounter."
    next "50<%>@"

OverworldEncounterShiny50Description:
    db "An overworld"
    next "encounter."
    next "Shiny 50<%>@"

OverworldEncounter20Description:
    db "An overworld"
    next "encounter."
    next "20<%>@"

OverworldEncounterShinyDescription:
    db "An overworld"
    next "encounter."
    next "Shiny 20<%>@"

OverworldEncounterNight20Description:
    db "An overworld"
    next "encounter."
    next "Night 20<%>@"


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

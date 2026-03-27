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
	specialencounter MIMIKYU, 	EVENT_FOUGHT_SPIRITOMB, 		ROUTE_36, LegendaryEncounterDescription
	specialencounter GYARADOS, 	EVENT_LAKE_OF_RAGE_RED_GYARADOS,LAKE_OF_RAGE, LegendaryEncounterShinyDescription
	specialencounter SNORLAX, 	EVENT_FOUGHT_SNORLAX,           VERMILION_CITY, LegendaryEncounterDescription
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

	specialencounter TREECKO, -1, ROUTE_6, OverworldEncounterDescription
	specialencounter SCEPTILE, -1, SILVER_CAVE_OUTSIDE, OverworldEncounterDescription
	specialencounter CHIMCHAR, -1, ROUTE_8, OverworldEncounterDescription
	specialencounter INFERNAPE, -1, SILVER_CAVE_OUTSIDE, OverworldEncounterDescription
	specialencounter FROAKIE, -1, CELADON_CITY, OverworldEncounterDescription
	specialencounter GRENINJA, -1, LAKE_OF_RAGE, OverworldEncounterNightDescription
	specialencounter GRENINJA, -1, SILVER_CAVE_OUTSIDE, OverworldEncounterDescription
	specialencounter BULBASAUR, -1, ROUTE_2, OverworldEncounterDayDescription
	specialencounter BULBASAUR, -1, ROUTE_21, OverworldEncounterShiny50Description
	specialencounter IVYSAUR, -1, NATIONAL_PARK, OverworldEncounterDayDescription
	specialencounter VENUSAUR, -1, ROUTE_15, OverworldEncounter50Description
	specialencounter CHARMANDER, -1, ROUTE_3, OverworldEncounterDescription
	specialencounter CHARMANDER, -1, ROUTE_21, OverworldEncounterShiny50Description
	specialencounter CHARIZARD, -1, ROUTE_28, OverworldEncounterDescription
	specialencounter SQUIRTLE, -1, CERULEAN_CITY, OverworldEncounterDescription
	specialencounter SQUIRTLE, -1, ROUTE_21, OverworldEncounterShiny50Description
	specialencounter BLASTOISE, -1, ROUTE_4, OverworldEncounter50Description
	specialencounter MUDKIP, -1, ROUTE_32, OverworldEncounterDescription
	specialencounter MUDKIP, -1, ROUTE_32, OverworldEncounterShinyDescription
	specialencounter SWAMPERT, -1, ROUTE_43, OverworldEncounterDescription
	specialencounter STARLY, -1, NEW_BARK_TOWN, OverworldEncounterDescription
	specialencounter STARLY, -1, VIOLET_CITY, OverworldEncounterShinyDescription
	specialencounter STARAVIA, -1, ROUTE_2, OverworldEncounterDescription
	specialencounter STARAPTOR, -1, VIOLET_CITY, OverworldEncounterDescription
	specialencounter BUNEARY, -1, ROUTE_29, OverworldEncounterDescription
	specialencounter LOPUNNY, -1, ROUTE_3, OverworldEncounterDescription
	specialencounter HOOTHOOT, -1, VIOLET_CITY, OverworldEncounterDescription
	specialencounter NOCTOWL, -1, ROUTE_30, OverworldEncounterNightDescription
	specialencounter RATTATA, -1, SPROUT_TOWER_2F, OverworldEncounterDescription
	specialencounter RATICATE, -1, ROUTE_29, OverworldEncounterDescription
	specialencounter PIKACHU, -1, CHERRYGROVE_CITY, OverworldEncounterDescription
	specialencounter PIKACHU, -1, ROUTE_1, OverworldEncounterShiny33Description
	specialencounter RAICHU, -1, ROUTE_9, OverworldEncounterDescription
	specialencounter RIOLU, -1, ROUTE_32, OverworldEncounterDescription
	specialencounter RIOLU, -1, ROUTE_29, OverworldEncounterShinyDescription
	specialencounter LUCARIO, -1, VICTORY_ROAD, OverworldEncounterDescription
	specialencounter VENIPEDE, -1, ROUTE_30, OverworldEncounterDescription
	specialencounter SCOLIPEDE, -1, ROUTE_42, OverworldEncounterDayDescription
	specialencounter SCOLIPEDE, -1, ROUTE_2, OverworldEncounterShinyDescription
	specialencounter HONEDGE, -1, SPROUT_TOWER_3F, OverworldEncounter50Description
	specialencounter DOUBLADE, -1, SPROUT_TOWER_B1F, OverworldEncounterDescription
	specialencounter AEGISLASH, -1, TIN_TOWER_8F, OverworldEncounterDescription
	specialencounter JOLTIK, -1, ROUTE_29, OverworldEncounterDayDescription
	specialencounter GALVANTULA, -1, ROUTE_26, OverworldEncounterDescription
	specialencounter GEODUDE, -1, ROUTE_46, OverworldEncounterDescription
	specialencounter GRAVELER, -1, UNION_CAVE_1F, OverworldEncounterDescription
	specialencounter GOLEM, -1, UNION_CAVE_B1F, OverworldEncounterDescription
	specialencounter GOLEM, -1, ROUTE_45, OverworldEncounterDescription
	specialencounter ZUBAT, -1, ROUTE_45, OverworldEncounterDescription
	specialencounter ZUBAT, -1, ROUTE_36, OverworldEncounterShinyDescription
	specialencounter GOLBAT, -1, ROUTE_33, OverworldEncounterDescription
	specialencounter CROBAT, -1, ROUTE_32, OverworldEncounterDescription
	specialencounter CLEFAIRY, -1, ROUTE_29, OverworldEncounterDescription
	specialencounter CLEFABLE, -1, ROUTE_35, OverworldEncounterNightDescription
	specialencounter MAWILE, -1, MOUNT_MOON, OverworldEncounterDescription
	specialencounter MIMIKYU, -1, ROUTE_37, OverworldEncounterDescription
	specialencounter TOGEPI, -1, ROUTE_44, OverworldEncounterShinyDescription
	specialencounter TOGEKISS, -1, ROUTE_44, OverworldEncounterDescription
	specialencounter ROTOM, -1, ROUTE_37, OverworldEncounterDescription
	specialencounter POLTEGEIST, -1, ROUTE_37, OverworldEncounterDescription
	specialencounter ARBOK, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter MAREEP, -1, ROUTE_31, OverworldEncounterDescription
	specialencounter FLAAFFY, -1, OLIVINE_CITY, OverworldEncounterDescription
	specialencounter AMPHAROS, -1, ROUTE_35, OverworldEncounterDescription
	specialencounter GASTLY, -1, SPROUT_TOWER_2F, OverworldEncounterDescription
	specialencounter HAUNTER, -1, ROUTE_37, OverworldEncounterShiny50Description
	specialencounter GENGAR, -1, ROUTE_37, OverworldEncounterDescription
	specialencounter NOWN, -1, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, OverworldEncounterDescription
	specialencounter NOWN, -1, DARK_CAVE_BLACKTHORN_ENTRANCE, OverworldEncounterDescription
	specialencounter ONIX, -1, UNION_CAVE_1F, OverworldEncounterDescription
	specialencounter STEELIX, -1, DIGLETTS_CAVE, OverworldEncounterDescription
	specialencounter BELLSPROUT, -1, SPROUT_TOWER_3F, OverworldEncounterDescription
	specialencounter VICTREEBEL, -1, ROUTE_6, OverworldEncounterDescription
	specialencounter HAWLUCHA, -1, CIANWOOD_CITY, OverworldEncounterDescription
	specialencounter POLIWAG, -1, ROUTE_32, OverworldEncounterDescription
	specialencounter POLIWHIRL, -1, OLIVINE_CITY, OverworldEncounterDescription
	specialencounter POLIWRATH, -1, ROUTE_40, OverworldEncounterDescription
	specialencounter POLITOED, -1, ROUTE_43, OverworldEncounterDescription
	specialencounter GYARADOS, -1, LAKE_OF_RAGE, OverworldEncounterDescription
	specialencounter SLOWPOKE, -1, SLOWPOKE_WELL_B1F, OverworldEncounterDescription
	specialencounter SLOWBRO, -1, SLOWPOKE_WELL_B2F, OverworldEncounterDescription
	specialencounter PAWNIARD, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterDescription
	specialencounter BISHARP, -1, ROUTE_38, OverworldEncounterNightDescription
	specialencounter KINGAMBIT, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterDescription
	specialencounter ABRA, -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
	specialencounter KADABRA, -1, ROUTE_4, OverworldEncounterDescription
	specialencounter ALAKAZAM, -1, ROUTE_16, OverworldEncounterDescription
	specialencounter DITTO, -1, ROUTE_13, OverworldEncounter50Description
	specialencounter NIDORAN_F, -1, ROUTE_29, OverworldEncounterDescription
	specialencounter NIDOQUEEN, -1, ROUTE_36, OverworldEncounter50Description
	specialencounter NIDORAN_M, -1, ROUTE_29, OverworldEncounterDescription
	specialencounter NIDOKING, -1, ROUTE_36, OverworldEncounter50Description
	specialencounter YANMA, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter YANMA, -1, ROUTE_35, OverworldEncounterShinyDescription
	specialencounter YANMEGA, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter EXEGGCUTE, -1, NATIONAL_PARK, OverworldEncounterDescription
	specialencounter EXEGGUTOR, -1, ROUTE_43, OverworldEncounterDay50Description
	specialencounter SCYTHER, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter SCIZOR, -1, ROUTE_38, OverworldEncounter50Description
	specialencounter KLEAVOR, -1, ROUTE_15, OverworldEncounterDescription
	specialencounter PINSIR, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter HERACROSS, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter WEEZING, -1, GOLDENROD_UNDERGROUND, OverworldEncounterDescription
	specialencounter FERROSEED, -1, ROUTE_33, OverworldEncounterDescription
	specialencounter FERROTHORN, -1, ROUTE_38, OverworldEncounterDayDescription	
	specialencounter FERROTHORN, -1, ROUTE_45, OverworldEncounterDescription
	specialencounter MAGNEMITE, -1, VERMILION_CITY, OverworldEncounterDescription
	specialencounter MAGNETON, -1, ROUTE_38, OverworldEncounterDescription
	specialencounter MAGNEZONE, -1, ROUTE_39, OverworldEncounter20Description
	specialencounter MAGNEZONE, -1, ROUTE_6, OverworldEncounterDescription
	specialencounter VULPIX, -1, ROUTE_30, OverworldEncounterDescription
	specialencounter NINETALES, -1, ROUTE_11, OverworldEncounterDescription
	specialencounter NINETALES_A, -1, ICE_PATH_B1F, OverworldEncounterDescription
	specialencounter GROWLITHE, -1, ROUTE_30, OverworldEncounter50Description
	specialencounter ARCANINE, -1, ROUTE_39, OverworldEncounterDescription
	specialencounter SHROOMISH, -1, ROUTE_33, OverworldEncounterDescription
	specialencounter BRELOOM, -1, ROUTE_43, OverworldEncounterDescription
	specialencounter MEOWTH, -1, ROUTE_29, OverworldEncounterDescription
	specialencounter MEOWTH, -1, VIOLET_CITY, OverworldEncounterShiny50Description
	specialencounter PERSIAN, -1, ROUTE_30, OverworldEncounter50Description
	specialencounter SNOVER, -1, ROUTE_33, OverworldEncounterDescription
	specialencounter ABOMASNOW, -1, ROUTE_44, OverworldEncounterDescription
	specialencounter MACHOP, -1, ROUTE_33, OverworldEncounterShinyDescription
	specialencounter MACHOKE, -1, CIANWOOD_CITY, OverworldEncounterDescription
	specialencounter MACHAMP, -1, ROUTE_17, OverworldEncounterDescription
	specialencounter TIMBURR, -1, ROUTE_31, OverworldEncounterDescription
	specialencounter GURDURR, -1, CIANWOOD_CITY, OverworldEncounterDescription
	specialencounter CONKELDURR, -1, ROUTE_17, OverworldEncounterDescription
	specialencounter SOLOSIS, -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
	specialencounter REUNICLUS, -1, RUINS_OF_ALPH_OMANYTE_WORD_ROOM, OverworldEncounterDescription
	specialencounter TAUROS, -1, ROUTE_39, OverworldEncounterDescription
	specialencounter MILTANK, -1, ROUTE_39, OverworldEncounterDescription
	specialencounter MAGMAR, -1, ROUTE_42, OverworldEncounterShiny50Description
	specialencounter MAGMORTAR, -1, ROUTE_42, OverworldEncounterDescription
	specialencounter JYNX, -1, ICE_PATH_1F, OverworldEncounterDescription
	specialencounter ELECTABUZZ, -1, ROUTE_38, OverworldEncounterDescription
	specialencounter ELECTABUZZ, -1, MOUNT_MORTAR_1F_INSIDE, OverworldEncounterShinyDescription
	specialencounter ELECTIVIRE, -1, ROUTE_38, OverworldEncounterDescription
	specialencounter MR__MIME, -1, ROUTE_8, OverworldEncounterDescription
	specialencounter TENTACRUEL, -1, ROUTE_40, OverworldEncounterDescription
	specialencounter FEEBAS, -1, WHIRL_ISLAND_B1F, OverworldEncounterShinyDescription
	specialencounter MILOTIC, -1, ROUTE_44, OverworldEncounter50Description
	specialencounter STARYU, -1, SLOWPOKE_WELL_B1F, OverworldEncounter50Description
	specialencounter STARMIE, -1, ROUTE_44, OverworldEncounterDescription
	specialencounter SHELLDER, -1, ROUTE_32, OverworldEncounterDescription
	specialencounter CLOYSTER, -1, ICE_PATH_1F, OverworldEncounterDescription
	specialencounter CLOYSTER, -1, ROUTE_20, OverworldEncounterShiny33Description
	specialencounter EEVEE, -1, ROUTE_1, OverworldEncounterDayDescription
	specialencounter VAPOREON, -1, ROUTE_12, OverworldEncounterDescription
	specialencounter JOLTEON, -1, ROUTE_6, OverworldEncounterNightDescription
	specialencounter FLAREON, -1, TIN_TOWER_9F, OverworldEncounterDescription
	specialencounter ESPEON, -1, ROUTE_16, OverworldEncounterDayDescription
	specialencounter UMBREON, -1, ROUTE_16, OverworldEncounterNightDescription
	specialencounter SYLVEON, -1, ROUTE_8, OverworldEncounter33Description
	specialencounter SEADRA, -1, ROUTE_32, OverworldEncounterDescription
	specialencounter KINGDRA, -1, ROUTE_41, OverworldEncounterDescription
	specialencounter GLIGAR, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterDescription
	specialencounter GLISCOR, -1, ROUTE_45, OverworldEncounterDescription
	specialencounter SWINUB, -1, ROUTE_46, OverworldEncounterDescription
	specialencounter PILOSWINE, -1, ICE_PATH_1F, OverworldEncounterDescription
	specialencounter MAMOSWINE, -1, ICE_PATH_B3F, OverworldEncounterDescription
	specialencounter TEDDIURSA, -1, ROUTE_46, OverworldEncounterDescription
	specialencounter URSARING, -1, ROUTE_46, OverworldEncounterDescription
	specialencounter URSALUNA, -1, ANCIENT_RUIN_PRESENT, OverworldEncounterDescription
	specialencounter URSALUNA_B, -1, ANCIENT_RUIN_PRESENT, OverworldEncounterDescription
	specialencounter COTTONEE, -1, ROUTE_34, OverworldEncounterDescription
	specialencounter SKARMORY, -1, ROUTE_45, OverworldEncounterDescription
	specialencounter PONYTA, -1, ROUTE_11, OverworldEncounterShinyDescription
	specialencounter RAPIDASH, -1, ROUTE_11, OverworldEncounter50Description
	specialencounter MARILL, -1, ROUTE_30, OverworldEncounterDescription
	specialencounter AZUMARILL, -1, ROUTE_36, OverworldEncounterDescription
	specialencounter DRILBUR, -1, UNION_CAVE_1F, OverworldEncounterDescription
	specialencounter EXCADRILL, -1, ROUTE_45, OverworldEncounterDescription
	specialencounter RHYHORN, -1, UNION_CAVE_1F, OverworldEncounterDescription
	specialencounter RHYPERIOR, -1, ROCK_TUNNEL_1F, OverworldEncounterDescription
	specialencounter MURKROW, -1, VIOLET_CITY, OverworldEncounterDescription
	specialencounter HONCHKROW, -1, ROUTE_43, OverworldEncounterNightDescription
	specialencounter HOUNDOUR, -1, ROUTE_31, OverworldEncounterDescription
	specialencounter HOUNDOOM, -1, ROUTE_31, OverworldEncounterNight33Description
	specialencounter SNEASEL, -1, RUINS_OF_ALPH_OUTSIDE, OverworldEncounterDescription
	specialencounter WEAVILE, -1, ROUTE_42, OverworldEncounterNightDescription
	specialencounter SNEASLER, -1, MOUNT_MORTAR_1F_OUTSIDE, OverworldEncounterDescription
	specialencounter MISDREAVUS, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterDescription
	specialencounter MISMAGIUS, -1, ROUTE_37, OverworldEncounterDescription
	specialencounter LITWICK, -1, SPROUT_TOWER_3F, OverworldEncounterDescription
	specialencounter LAMPENT, -1, SPROUT_TOWER_B1F, OverworldEncounterDescription
	specialencounter CHANDELURE, -1, LAVENDER_FOREST, OverworldEncounterDescription
	specialencounter PORYGON2, -1, ROUTE_11, OverworldEncounterDescription
	specialencounter PORYGONZ, -1, ROUTE_17, OverworldEncounterDescription
	specialencounter CHANSEY, -1, ROUTE_44, OverworldEncounter50Description
	specialencounter BLISSEY, -1, ROUTE_26, OverworldEncounter50Description
	specialencounter LAPRAS, -1, ROUTE_41, OverworldEncounterShinyDescription
	specialencounter RALTS, -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
	specialencounter RALTS, -1, ROUTE_30, OverworldEncounterShinyDescription
	specialencounter KIRLIA, -1, NATIONAL_PARK, OverworldEncounterDescription
	specialencounter GARDEVOIR, -1, NATIONAL_PARK, OverworldEncounterNight50Description
	specialencounter GARDEVOIR, -1, ROUTE_7, OverworldEncounterDescription
	specialencounter GALLADE, -1, ROUTE_7, OverworldEncounterDescription
	specialencounter ARCTOZOLT, -1, ICE_PATH_B3F, OverworldEncounterDescription
	specialencounter DRACOVISH, -1, UNION_CAVE_B1F, OverworldEncounterDescription
	specialencounter DRACOVISH, -1, ROUTE_20, OverworldEncounterShinyDescription
	specialencounter AERODACTYL, -1, ANCIENT_RUIN_PRESENT, OverworldEncounterDescription
	specialencounter SNORLAX, -1, ROUTE_28, OverworldEncounterDescription
	specialencounter LARVESTA, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter VOLCARONA, -1, ILEX_FOREST, OverworldEncounterDescription
	specialencounter DRATINI, -1, FUCHSIA_CITY, OverworldEncounterShinyDescription
	specialencounter DRATINI, -1, ROUTE_46, OverworldEncounterShinyDescription
	specialencounter DRAGONAIR, -1, BLACKTHORN_CITY, OverworldEncounterDescription
	specialencounter DRAGONITE, -1, DRAGONS_DEN_B1F, OverworldEncounterDescription
	specialencounter DRAGONITE, -1, ABYSS, OverworldEncounterDescription
	specialencounter LARVITAR, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterShinyDescription
	specialencounter PUPITAR, -1, DIGLETTS_CAVE, OverworldEncounterDescription
	specialencounter TYRANITAR, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterDescription
	specialencounter TYRANITAR, -1, ABYSS, OverworldEncounterDescription
	specialencounter BELDUM, -1, RUINS_OF_ALPH_KABUTO_WORD_ROOM, OverworldEncounterDescription
	specialencounter BELDUM, -1, SAFFRON_CITY, OverworldEncounter50Description
	specialencounter BELDUM, -1, ROUTE_38, OverworldEncounterShinyDescription
	specialencounter METANG, -1, ROUTE_9, OverworldEncounter50Description
	specialencounter METAGROSS, -1, MOUNT_MORTAR_B1F, OverworldEncounterDescription
	specialencounter METAGROSS, -1, ANCIENT_RUIN_PRESENT, OverworldEncounterDescription
	specialencounter BAGON, -1, ROUTE_35, OverworldEncounterDescription
	specialencounter BAGON, -1, ROUTE_22, OverworldEncounterDescription
	specialencounter SHELGON, -1, LAKE_OF_RAGE, OverworldEncounterDescription
	specialencounter SALAMENCE, -1, LAKE_OF_RAGE, OverworldEncounterDescription
	specialencounter SALAMENCE, -1, ABYSS, OverworldEncounterDescription
	specialencounter GIBLE, -1, FUCHSIA_CITY, OverworldEncounterDescription
	;specialencounter GIBLE, -1, UNION_CAVE_B1F, OverworldEncounterShinyDescription
	specialencounter GABITE, -1, DIGLETTS_CAVE, OverworldEncounterDescription
	;specialencounter GARCHOMP, -1, ROUTE_45, OverworldEncounterDescription
	specialencounter GARCHOMP, -1, ABYSS, OverworldEncounterDescription
	specialencounter DEINO, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterDescription
	specialencounter HYDREIGON, -1, DARK_CAVE_VIOLET_ENTRANCE, OverworldEncounterDescription
	;specialencounter HYDREIGON, -1, ABYSS, OverworldEncounterDescription
	specialencounter MELTAN, -1, RUINS_OF_ALPH_INNER_CHAMBER, OverworldEncounterDescription
	specialencounter MELMETAL, -1, ABYSS, OverworldEncounterDescription
	specialencounter FRIGIBAX, -1, ROUTE_45, OverworldEncounterDescription
	;specialencounter FRIGIBAX, -1, ICE_PATH_B1F, OverworldEncounterDescription
	specialencounter BAXCALIBUR, -1, ICE_PATH_B3F, OverworldEncounterDescription	
	;specialencounter BAXCALIBUR, -1, ABYSS, OverworldEncounterDescription
	db -1
	
	
; LoadWildMon Dex Hints, max 18 chars per line
LegendaryEncounterDescription:
	db "A one time"
	next "encounter.@"
LegendaryEncounterShinyDescription:
    db "A one time"
	next "encounter."
	next "Shiny.@"
OverworldEncounterDescription:
	db "An overworld"
	next "encounter.@"
OverworldEncounter50Description:
	db "An overworld"
	next "encounter."
	next "50<%>@"
OverworldEncounter33Description:
	db "An overworld"
	next "encounter."
	next "33<%>@"
OverworldEncounter20Description:
	db "An overworld"
	next "encounter."
	next "20<%>@"
OverworldEncounterNightDescription:
	db "An overworld"
	next "encounter."
	next "Night.@"
OverworldEncounterNight50Description:
	db "An overworld"
	next "encounter."
	next "Night 50<%>@"
OverworldEncounterNight33Description:
	db "An overworld"
	next "encounter."
	next "Night 33<%>@"
OverworldEncounterDayDescription:
	db "An overworld"
	next "encounter."
	next "Day.@"
OverworldEncounterDay50Description:
	db "An overworld"
	next "encounter."
	next "Day 50<%>@"
OverworldEncounterShiny50Description:
	db "An overworld"
	next "encounter."
	next "Shiny 50<%>@"
OverworldEncounterShiny33Description:
	db "An overworld"
	next "encounter."
	next "Shiny 33<%>@"
OverworldEncounterShinyDescription:
	db "An overworld"
	next "encounter."
	next "Shiny 20<%>@"

GiftMons::
; replace map_id with -1 to hide location but keep hint
; species, EVENT_FLAG, map_id, blurb string ptr
	specialencounter PIKACHU, 	EVENT_GOT_KENYA, 					ROUTE_35_GOLDENROD_GATE, DefaultGiftDescription
	specialencounter DRATINI, 	EVENT_GOT_DRATINI, 					DRAGON_SHRINE, DefaultGiftDescription
	specialencounter EEVEE,	 	EVENT_GOT_EEVEE, 					BILLS_FAMILYS_HOUSE, DefaultGiftDescription
	specialencounter LUCARIO, 	EVENT_GOT_LUCARIO_FROM_KIYO, 		MOUNT_MORTAR_1F_OUTSIDE, DefaultGiftDescription
	specialencounter LAPRAS, 	EVENT_GOT_ROUTE40_LAPRAS, 		    ROUTE_40, DefaultGiftDescription
	specialencounter SKARMORY, 	EVENT_GOT_BLACKTHORN_SKARM, 		BLACKTHORN_CITY, SkarmGiftDescription
	db -1

; GivePoke Dex Hints, max 18 chars per line
DefaultGiftDescription:
	db "Awaiting a good"
	next "trainer.@"

SkarmGiftDescription:
	db "Egg given to those"
	next "with less than 2"
	next "badges.@"
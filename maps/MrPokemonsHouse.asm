	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_script MrPokemonsHouseNoopScene,          SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

MrPokemonsHouseMeetMrPokemonScene:
	sdefer MrPokemonsHouseMrPokemonEventScript
	end

MrPokemonsHouseNoopScene:
	end

MrPokemonsHouseMrPokemonEventScript:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX

    setval TREECKO
	special EventSetSeenMon
	setval GROVYLE
	special EventSetSeenMon
	setval SCEPTILE
	special EventSetSeenMon
	setval CHIMCHAR
	special EventSetSeenMon
	setval MONFERNO
	special EventSetSeenMon
	setval INFERNAPE
	special EventSetSeenMon
	setval FROAKIE
	special EventSetSeenMon
	setval FROGADIER
	special EventSetSeenMon
	setval GRENINJA
	special EventSetSeenMon
	setval BULBASAUR
	special EventSetSeenMon
	setval IVYSAUR
	special EventSetSeenMon
	setval VENUSAUR
	special EventSetSeenMon
	setval CHARMANDER
	special EventSetSeenMon
	setval CHARMELEON
	special EventSetSeenMon
	setval CHARIZARD
	special EventSetSeenMon
	setval SQUIRTLE
	special EventSetSeenMon
	setval WARTORTLE
	special EventSetSeenMon
	setval BLASTOISE
	special EventSetSeenMon
	setval MUDKIP
	special EventSetSeenMon
	setval MARSHTOMP
	special EventSetSeenMon
	setval SWAMPERT
	special EventSetSeenMon
	setval STARLY
	special EventSetSeenMon
	setval STARAVIA
	special EventSetSeenMon
	setval STARAPTOR
	special EventSetSeenMon
	setval BUNEARY
	special EventSetSeenMon
	setval LOPUNNY
	special EventSetSeenMon
	setval HOOTHOOT
	special EventSetSeenMon
	setval NOCTOWL
	special EventSetSeenMon
	setval RATTATA
	special EventSetSeenMon
	setval RATICATE
	special EventSetSeenMon
	setval PIKACHU
	special EventSetSeenMon
	setval RAICHU
	special EventSetSeenMon
	setval RIOLU
	special EventSetSeenMon
	setval LUCARIO
	special EventSetSeenMon
	setval VENIPEDE
	special EventSetSeenMon
	setval WHIRLIPEDE
	special EventSetSeenMon
	setval SCOLIPEDE
	special EventSetSeenMon
	setval HONEDGE
	special EventSetSeenMon
	setval DOUBLADE
	special EventSetSeenMon
	setval AEGISLASH
	special EventSetSeenMon
	setval JOLTIK
	special EventSetSeenMon
	setval GALVANTULA
	special EventSetSeenMon
	setval GEODUDE
	special EventSetSeenMon
	setval GRAVELER
	special EventSetSeenMon
	setval GOLEM
	special EventSetSeenMon
	setval ZUBAT
	special EventSetSeenMon
	setval GOLBAT
	special EventSetSeenMon
	setval CROBAT
	special EventSetSeenMon
	setval CLEFAIRY
	special EventSetSeenMon
	setval CLEFABLE
	special EventSetSeenMon
	setval MAWILE
	special EventSetSeenMon
	setval MIMIKYU
	special EventSetSeenMon
	setval TOGEPI
	special EventSetSeenMon
	setval TOGETIC
	special EventSetSeenMon
	setval TOGEKISS
	special EventSetSeenMon
	setval ROTOM
	special EventSetSeenMon
	setval POLTEGEIST
	special EventSetSeenMon
	setval ARBOK
	special EventSetSeenMon
	setval MAREEP
	special EventSetSeenMon
	setval FLAAFFY
	special EventSetSeenMon
	setval AMPHAROS
	special EventSetSeenMon
	setval GASTLY
	special EventSetSeenMon
	setval HAUNTER
	special EventSetSeenMon
	setval GENGAR
	special EventSetSeenMon
	setval UNOWN
	special EventSetSeenMon
	setval NOWN
	special EventSetSeenMon
	setval ONIX
	special EventSetSeenMon
	setval STEELIX
	special EventSetSeenMon
	setval BELLSPROUT
	special EventSetSeenMon
	setval VICTREEBEL
	special EventSetSeenMon
	setval HAWLUCHA
	special EventSetSeenMon
	setval POLIWAG
	special EventSetSeenMon
	setval POLIWHIRL
	special EventSetSeenMon
	setval POLIWRATH
	special EventSetSeenMon
	setval POLITOED
	special EventSetSeenMon
	setval MAGIKARP
	special EventSetSeenMon
	setval GYARADOS
	special EventSetSeenMon
	setval SLOWPOKE
	special EventSetSeenMon
	setval SLOWBRO
	special EventSetSeenMon
	setval PAWNIARD
	special EventSetSeenMon
	setval BISHARP
	special EventSetSeenMon
	setval KINGAMBIT
	special EventSetSeenMon
	setval ABRA
	special EventSetSeenMon
	setval KADABRA
	special EventSetSeenMon
	setval ALAKAZAM
	special EventSetSeenMon
	setval DITTO
	special EventSetSeenMon
	setval NIDORAN_F
	special EventSetSeenMon
	setval NIDORINA
	special EventSetSeenMon
	setval NIDOQUEEN
	special EventSetSeenMon
	setval NIDORAN_M
	special EventSetSeenMon
	setval NIDORINO
	special EventSetSeenMon
	setval NIDOKING
	special EventSetSeenMon
	setval YANMA
	special EventSetSeenMon
	setval YANMEGA
	special EventSetSeenMon
	setval EXEGGCUTE
	special EventSetSeenMon
	setval EXEGGUTOR
	special EventSetSeenMon
	setval SCYTHER
	special EventSetSeenMon
	setval SCIZOR
	special EventSetSeenMon
	setval KLEAVOR
	special EventSetSeenMon
	setval PINSIR
	special EventSetSeenMon
	setval HERACROSS
	special EventSetSeenMon
	setval WEEZING
	special EventSetSeenMon
	setval FERROSEED
	special EventSetSeenMon
	setval FERROTHORN
	special EventSetSeenMon
	setval MAGNEMITE
	special EventSetSeenMon
	setval MAGNETON
	special EventSetSeenMon
	setval MAGNEZONE
	special EventSetSeenMon
	setval VULPIX
	special EventSetSeenMon
	setval NINETALES
	special EventSetSeenMon
	setval NINETALES_A
	special EventSetSeenMon
	setval GROWLITHE
	special EventSetSeenMon
	setval ARCANINE
	special EventSetSeenMon
	setval SHROOMISH
	special EventSetSeenMon
	setval BRELOOM
	special EventSetSeenMon
	setval MEOWTH
	special EventSetSeenMon
	setval PERSIAN
	special EventSetSeenMon
	setval SNOVER
	special EventSetSeenMon
	setval ABOMASNOW
	special EventSetSeenMon
	setval MACHOP
	special EventSetSeenMon
	setval MACHOKE
	special EventSetSeenMon
	setval MACHAMP
	special EventSetSeenMon
	setval TIMBURR
	special EventSetSeenMon
	setval GURDURR
	special EventSetSeenMon
	setval CONKELDURR
	special EventSetSeenMon
	setval SOLOSIS
	special EventSetSeenMon
	setval DUOSION
	special EventSetSeenMon
	setval REUNICLUS
	special EventSetSeenMon
	setval TAUROS
	special EventSetSeenMon
	setval MILTANK
	special EventSetSeenMon
	setval MAGMAR
	special EventSetSeenMon
	setval MAGMORTAR
	special EventSetSeenMon
	setval JYNX
	special EventSetSeenMon
	setval ELECTABUZZ
	special EventSetSeenMon
	setval ELECTIVIRE
	special EventSetSeenMon
	setval MR__MIME
	special EventSetSeenMon
	setval SMEARGLE
	special EventSetSeenMon
	setval TENTACOOL
	special EventSetSeenMon
	setval TENTACRUEL
	special EventSetSeenMon
	setval FEEBAS
	special EventSetSeenMon
	setval MILOTIC
	special EventSetSeenMon
	setval STARYU
	special EventSetSeenMon
	setval STARMIE
	special EventSetSeenMon
	setval SHELLDER
	special EventSetSeenMon
	setval CLOYSTER
	special EventSetSeenMon
	setval EEVEE
	special EventSetSeenMon
	setval VAPOREON
	special EventSetSeenMon
	setval JOLTEON
	special EventSetSeenMon
	setval FLAREON
	special EventSetSeenMon
	setval ESPEON
	special EventSetSeenMon
	setval UMBREON
	special EventSetSeenMon
	setval SYLVEON
	special EventSetSeenMon
	setval SEADRA
	special EventSetSeenMon
	setval KINGDRA
	special EventSetSeenMon
	setval GLIGAR
	special EventSetSeenMon
	setval GLISCOR
	special EventSetSeenMon
	setval SWINUB
	special EventSetSeenMon
	setval PILOSWINE
	special EventSetSeenMon
	setval MAMOSWINE
	special EventSetSeenMon
	setval TEDDIURSA
	special EventSetSeenMon
	setval URSARING
	special EventSetSeenMon
	setval URSALUNA
	special EventSetSeenMon
	setval URSALUNA_B
	special EventSetSeenMon
	setval COTTONEE
	special EventSetSeenMon
	setval WHIMSICOTT
	special EventSetSeenMon
	setval SKARMORY
	special EventSetSeenMon
	setval PONYTA
	special EventSetSeenMon
	setval RAPIDASH
	special EventSetSeenMon
	setval MARILL
	special EventSetSeenMon
	setval AZUMARILL
	special EventSetSeenMon
	setval DRILBUR
	special EventSetSeenMon
	setval EXCADRILL
	special EventSetSeenMon
	setval RHYHORN
	special EventSetSeenMon
	setval RHYDON
	special EventSetSeenMon
	setval RHYPERIOR
	special EventSetSeenMon
	setval MURKROW
	special EventSetSeenMon
	setval HONCHKROW
	special EventSetSeenMon
	setval HOUNDOUR
	special EventSetSeenMon
	setval HOUNDOOM
	special EventSetSeenMon
	setval SNEASEL
	special EventSetSeenMon
	setval WEAVILE
	special EventSetSeenMon
	setval SNEASLER
	special EventSetSeenMon
	setval MISDREAVUS
	special EventSetSeenMon
	setval MISMAGIUS
	special EventSetSeenMon
	setval LITWICK
	special EventSetSeenMon
	setval LAMPENT
	special EventSetSeenMon
	setval CHANDELURE
	special EventSetSeenMon
	setval PORYGON
	special EventSetSeenMon
	setval PORYGON2
	special EventSetSeenMon
	setval PORYGONZ
	special EventSetSeenMon
	setval CHANSEY
	special EventSetSeenMon
	setval BLISSEY
	special EventSetSeenMon
	setval LAPRAS
	special EventSetSeenMon
	setval RALTS
	special EventSetSeenMon
	setval KIRLIA
	special EventSetSeenMon
	setval GARDEVOIR
	special EventSetSeenMon
	setval GALLADE
	special EventSetSeenMon
	setval ARCTOZOLT
	special EventSetSeenMon
	setval DRACOVISH
	special EventSetSeenMon
	setval AERODACTYL
	special EventSetSeenMon
	setval SNORLAX
	special EventSetSeenMon
	setval LARVESTA
	special EventSetSeenMon
	setval VOLCARONA
	special EventSetSeenMon
	setval DRATINI
	special EventSetSeenMon
	setval DRAGONAIR
	special EventSetSeenMon
	setval DRAGONITE
	special EventSetSeenMon
	setval LARVITAR
	special EventSetSeenMon
	setval PUPITAR
	special EventSetSeenMon
	setval TYRANITAR
	special EventSetSeenMon
	setval BELDUM
	special EventSetSeenMon
	setval METANG
	special EventSetSeenMon
	setval METAGROSS
	special EventSetSeenMon
	setval BAGON
	special EventSetSeenMon
	setval SHELGON
	special EventSetSeenMon
	setval SALAMENCE
	special EventSetSeenMon
	setval GIBLE
	special EventSetSeenMon
	setval GABITE
	special EventSetSeenMon
	setval GARCHOMP
	special EventSetSeenMon
	setval DEINO
	special EventSetSeenMon
	setval ZWEILOUS
	special EventSetSeenMon
	setval HYDREIGON
	special EventSetSeenMon
	setval MELTAN
	special EventSetSeenMon
	setval MELMETAL
	special EventSetSeenMon
	setval FRIGIBAX
	special EventSetSeenMon
	setval ARCTIBAX
	special EventSetSeenMon
	setval BAXCALIBUR
	special EventSetSeenMon

	writetext OakGivesExpShareText
	waitbutton
	verbosegiveitem EXP_SHARE

	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	loadmem wExpShareToggle, 1

	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeOutToBlack
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInFromBlack
	special RestartMapMusic

	opentext
	writetext MrPokemonGiveRemembrallText
	waitbutton
	verbosegiveitem REMEMBRALL
	closetext

	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Who are you!?"

	para "A Hoenn spy!?"

	para "A double agent!?"

	para "...."

	para "Sorry, I've just"
	line "spent six months"
	cont "in Hoenn as a"
	cont "spy."

	para "It's hard to"
	line "switch off, you"
	cont "know."
	done

MrPokemonIntroText2:
	text "Here, I smuggled"
	line "this out of Hoenn."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> received"
	line "Mystery Egg."
	done

MrPokemonIntroText3:
	text "I believe it may"
	line "contain a Fairy"
	cont "#mon."

	para "Fairy #mon are"
	line "uniquely capable"
	cont "of fighting Dragon"
	cont "#mon."

	para "This makes them"
	line "dangerous to the"
	cont "Hoenn admiral."

	para "Admiral Drake."
	done

MrPokemonIntroText4:
	text "But that's not"
	line "why you're here."
	done

MrPokemonIntroText5:
	text "Prof Oak has"
	line "been expecting"
	cont "you."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Are you returning"
	line "to Prof.Elm?"

	para "Here, your #mon"
	line "should have some"
	cont "rest."
	done

MrPokemonText_ImDependingOnYou:
	text "I'm depending on"
	line "you!"
	done

MrPokemonGiveRemembrallText:
    text "Being a secret"
    line "agent I need to"
    cont "remember many"
    cont "little details."

    para "This helps me"
    line "remember things"
    cont "I have forgotten."

    para "It can help"
    line "#mon with"
    cont "moves they have"
    cont "forgotten too."

    para "Here, take it."

    para "You might not"
    line "need it now, but"
    cont "when you do, it"
    cont "will be a life"
    cont "saver."
    done

MrPokemonText_AlwaysNewDiscoveries:
	text "People would not"
	line "like me for"
	cont "saying this."

	para "But Hoenn really"
	line "is a beautiful"
	cont "place."

	para "It's easy to"
	line "forget its leader"
	cont "wants to bring"
	cont "pain and death"
	cont "to so many."
	done

MrPokemonsHouse_OakText1:
	text "Oak: Aha! So"
	line "you're <PLAY_G>!"

	para "I'm Oak! A #mon"
	line "researcher."

	para "Prof Elm speaks"
	line "very highly of"
	cont "you."

	para "He wants me to"
	line "help you become"
	cont "as strong as you"
	cont "can."

	para "Here, this is the"
	line "latest version of"
	cont "#dex."

	para "This powerful"
	line "tool contains all"
	cont "information about"
	cont "every known"
	cont "#mon."

	para "Their stats,"
	line "moves, evolution"
	cont "methods,"
	cont "everything!"

	para "And it comes"
	line "already with all"
	cont "225 known"
	cont "#mon."

	para "You don't have to"
	line "see or capture a"
	cont "#mon to unlock"
	cont "anything."

	para "Though there may"
	line "be more #mon"
	cont "to yet discover!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> received"
	line "#dex!"
	done

OakGivesExpShareText:
	text "This will help"
	line "you identify and"
	cont "capture #mon."

	para "But we don't have"
	line "much time."

	para "I have something"
	line "else."

	para "An experimental"
	line "device that no"
	cont "other trainer"
	cont "has."

	para "This device can"
	line "greatly accelerate"
	cont "a trainers"
	cont "progression."

	para "I have developed"
	line "it with Bill."

	para "The inventor of"
	line "the PC system."

	para "We call it the"
	line "Exp Share."
	done

MrPokemonsHouse_OakText2:
	text "This will allow"
	line "all your #mon"
	cont "to receive Exp in"
	cont "battle, even the"
	cont "ones that didn't"
	cont "fight."
	para "Here, I'll turn"
	line "it on for you!"
	para "You can always"
	line "turn it off, but"
	cont "why would you do"
	cont "that?"

	para "<PLAY_G>, I'm"
	line "putting my faith"
	cont "in you!"
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "It's packed with"
	line "foreign magazines."

	para "They must be"
	line "from Hoenn."
	done

MrPokemonsHouse_BrokenComputerText:
	text "It's a big"
	line "computer."
	cont "Hmm. It's broken."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "A whole pile of"
	line "strange coins!"

	para "Maybe they're from"
	line "Hoenn."
	done

MrPokemonDittoScrpt:
    opentext
    writetext MrPokemonDittoText
    cry DITTO
    waitbutton
    closetext
    end

MrPokemonDittoText:
    text "Ditto!"
    done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
	object_event  3,  4, SPRITE_DITTO, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MrPokemonDittoScrpt, -1

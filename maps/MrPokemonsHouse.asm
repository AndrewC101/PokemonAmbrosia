	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script .MeetMrPokemon ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	def_callbacks

.MeetMrPokemon:
	sdefer .MrPokemonEvent
	end

.DummyScene:
	end

.MrPokemonEvent:
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
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
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
	setscene SCENE_FINISHED
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

	para "A HOENN spy!?"

	para "A double agent!?"

	para "...."

	para "Sorry, I've just"
	line "spent six months"
	cont "in HOENN as a"
	cont "spy."

	para "It's hard to"
	line "switch off, you"
	cont "know."
	done

MrPokemonIntroText2:
	text "Here, I smuggled"
	line "this out of HOENN."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> received"
	line "MYSTERY EGG."
	done

MrPokemonIntroText3:
	text "I believe it may"
	line "contain a FAIRY"
	cont "#MON."

	para "FAIRY #MON are"
	line "uniquely capable"
	cont "of fighting DRAGON"
	cont "#MON."

	para "This makes them"
	line "dangerous to the"
	cont "HOENN admiral."

	para "ADMIRAL DRAKE."
	done

MrPokemonIntroText4:
	text "But that's not"
	line "why you're here."
	done

MrPokemonIntroText5:
	text "PROF OAK has"
	line "been expecting"
	cont "you."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "Are you returning"
	line "to PROF.ELM?"

	para "Here, your #MON"
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
    line "#MON with"
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

	para "But HOENN really"
	line "is a beautiful"
	cont "place."

	para "It's easy to"
	line "forget its leader"
	cont "wants to bring"
	cont "pain and death"
	cont "to so many."
	done

MrPokemonsHouse_OakText1:
	text "OAK: Aha! So"
	line "you're <PLAY_G>!"

	para "I'm OAK! A #MON"
	line "researcher."

	para "PROF ELM speaks"
	line "very highly of"
	cont "you."

	para "He wants me to"
	line "help you become"
	cont "as strong as you"
	cont "can."

	para "Here, this is the"
	line "latest version of"
	cont "#DEX."

	para "It automatically"
	line "records data on"
	cont "#MON you've"
	cont "seen or caught."

	para "It's a hi-tech"
	line "encyclopedia!"
	done

MrPokemonsHouse_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

OakGivesExpShareText:
	text "This will help"
	line "you identify and"
	cont "capture #MON."

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
	line "it with BILL."

	para "The inventor of"
	line "the PC system."

	para "We call it the"
	line "EXP SHARE."
	done

MrPokemonsHouse_OakText2:
	text "This will allow"
	line "all your #MON"
	cont "to receive EXP in"
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
	line "from HOENN."
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
	line "HOENN."
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

	object_const_def
	const CINNABARISLAND_BLUE

CinnabarIsland_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_CINNABAR
	endcallback

CinnabarIslandBlue:
	faceplayer
	opentext
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .notBeatE4
	writetext CinnabarIslandBlueText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement CINNABARISLAND_BLUE, CinnabarIslandBlueTeleport
	disappear CINNABARISLAND_BLUE
	clearevent EVENT_VIRIDIAN_GYM_BLUE
	end
.notBeatE4
    writetext CinnabarIslandBluePreE4Text
    waitbutton
    closetext
    end

CinnabarIslandGymSign:
	jumptext CinnabarIslandGymSignText

CinnabarIslandSign:
	jumptext CinnabarIslandSignText

CinnabarIslandPokecenterSign:
	jumpstd PokecenterSignScript

CinnabarIslandHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_CINNABAR_ISLAND_HIDDEN_RARE_CANDY

CinnabarIslandBlueTeleport:
	teleport_from
	step_end

CinnabarIslandBluePreE4Text:
	text "Well well, a JOHTO"
	line "trainer!"
	para "What are you doing"
	line "all the way out"
	cont "here?"
	para "There's not much"
	line "to see."
	para "This place could"
	line "be very dangerous"
	cont "for you and your"
	cont "#MON."
	para "They don't seem"
	line "too strong."
	para "You should go home"
	line "JOHTO trainer."
	done

CinnabarIslandBlueText:
	text "Who are you?"

	para "Ah you are the"
	line "JOHTO CHAMPION."

	para "There was a time"
	line "when being a"
	cont "CHAMPION meant"
	cont "something."

	para "Now it's just"
	line "a puppet of the"
	cont "#MON LEAGUE."

	para "I was a CHAMPION"
	line "myself for a"
	cont "time."

	para "Look at this"
	line "place."

	para "Destroyed by a"
	line "volcano in an"
	cont "instant."

	para "It's not the"
	line "only place to"
	cont "have problems."

	para "PEWTER had a"
	line "#RUS outbreak."

	para "And now the war"
	line "with HOENN."

	para "You know what the"
	line "LEAGUE does?"

	para "Nothing!"

	para "They must remain"
	line "politically"
	cont "neutral."

	para "That's why I"
	line "give up my title"
	cont "of CHAMPION."

	para "It means nothing."

	para "If you get seven"
	line "KANTO GYM BADGES"
	cont "and manage to fix"
	cont "the issues at the"
	cont "POWER PLANT then"
	cont "come see me in"
	cont "VIRIDIAN."

	para "I'm the GYM"
	line "LEADER."

	para "I'll show you"
	line "a real CHAMPION."
	done

CinnabarIslandGymSignText:
	text "There's a notice"
	line "here…"

	para "CINNABAR GYM has"
	line "relocated to"
	cont "SEAFOAM ISLANDS."

	para "BLAINE"
	done

CinnabarIslandSignText:
	text "CINNABAR ISLAND"

	para "The Fiery Town of"
	line "Burning Desire"
	done

ElementCaveBlockScript:
    checkevent EVENT_BEAT_WALLACE
    iffalse .block
    end
.block
    turnobject PLAYER, UP
	opentext
	writetext CinnabarElementCaveBlockText
    waitbutton
    closetext
    applymovement PLAYER, Movement_CinnabarTurnBack
    end

CinnabarElementCaveBlockText:
    text "The cave entrance"
    line "is blocked by"
    cont "rocks for now."
    done

Movement_CinnabarTurnBack:
	step DOWN
	step_end

CinnabarFlameOrb:
    itemball FLAME_ORB

CinnabarIsland_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 11, CINNABAR_POKECENTER_1F, 1
	warp_event 14, 5, ELEMENT_CAVE, 1

	def_coord_events
	coord_event 14, 6, SCENE_ALWAYS, ElementCaveBlockScript

	def_bg_events
	bg_event 12, 11, BGEVENT_READ, CinnabarIslandPokecenterSign
	bg_event  9, 11, BGEVENT_READ, CinnabarIslandGymSign
	bg_event  7,  7, BGEVENT_READ, CinnabarIslandSign
	bg_event  9,  1, BGEVENT_ITEM, CinnabarIslandHiddenRareCandy

	def_object_events
	object_event  9,  6, SPRITE_BLUE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CinnabarIslandBlue, EVENT_BLUE_IN_CINNABAR
	object_event  5,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, CinnabarFlameOrb, EVENT_CINNABAR_FLAME_ORB

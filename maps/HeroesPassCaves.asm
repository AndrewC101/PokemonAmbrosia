HeroesPassCavesInvaderSiegmeyerScript:
	trainer INVADER, SIEGMEYER_2, EVENT_BEAT_INVADER_SIEGMEYER, HeroesPassCavesInvaderSiegmeyerSeenText, HeroesPassCavesInvaderSiegmeyerBeatenText, HeroesPassCavesInvaderSiegmeyerWinText, .Script

.Script:
	endifjustbattled
	opentext
	writetext HeroesPassCavesInvaderSiegmeyerAfterText
	waitbutton
	closetext
	end

HeroesPassCavesInvaderSiegmeyerSeenText:
	text "Hmmmmm..."
	para "This must be the"
	line "great ash lake."
	para "By joining the"
	line "dragon covenant I"
	cont "shall finally find"
	cont "the bravery"
	cont "expected of a"
	cont "knight of"
	cont "Caterina."
	done

HeroesPassCavesInvaderSiegmeyerBeatenText:
	text "Heavens, me..."
	done

HeroesPassCavesInvaderSiegmeyerWinText:
	text "Quite the fix"
	line "indeed."
	done

HeroesPassCavesInvaderSiegmeyerAfterText:
	text "You never fail to"
	line "impress."
	para "I curse my own"
	line "inability."
	done

HeroesPassCaves_MapScripts:
	def_scene_scripts

	def_callbacks

HeroesPassCaves_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 13, HEROES_PASS, 1
	warp_event  3, 19, HEROES_PASS, 2
	warp_event 17, 27, HEROES_PASS, 3
	warp_event 21, 27, HEROES_PASS, 4
	warp_event 13, 13, HEROES_PASS, 5
	warp_event 13, 19, HEROES_PASS, 6
	warp_event  5, 27, HEROES_PASS, 7
	warp_event  5, 35, HEROES_PASS, 8
	warp_event 23, 19, HEROES_PASS, 9
	warp_event 23, 15, HEROES_PASS, 10
	warp_event 33, 19, HEROES_PASS, 11
	warp_event 33, 13, HEROES_PASS, 12
	warp_event  3,  3, HEROES_PASS, 13
	warp_event 37,  3, CIANWOOD_CITY, 8

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4, 31, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 3, HeroesPassCavesInvaderSiegmeyerScript, -1

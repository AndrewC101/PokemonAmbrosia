	object_const_def
	const RADIOTOWER3F_SUPER_NERD
	const RADIOTOWER3F_GYM_GUIDE
	const RADIOTOWER3F_COOLTRAINER_F
	;const RADIOTOWER3F_ROCKET1
	const RADIOTOWER3F_ROCKET2
	const RADIOTOWER3F_ROCKET3
	;const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, .CardKeyShutterCallback

.CardKeyShutterCallback:
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .Change
	endcallback

.Change:
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	endcallback

RadioTower3FSuperNerdScript:
	jumptextfaceplayer RadioTower3FSuperNerdText

RadioTower3FGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	writetext RadioTower3FGymGuideText_Rockets
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FGymGuideText
	waitbutton
	closetext
	end

RadioTower3FCooltrainerFScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .NoRockets
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	writetext RadioTower3FCooltrainerFPleaseSaveDirectorText
	waitbutton
	closetext
	end

.UsedCardKey:
	writetext RadioTower3FCooltrainerFIsDirectorSafeText
	waitbutton
	closetext
	end

.NoRockets:
	writetext RadioTower3FCooltrainerFYoureMyHeroText
	waitbutton
	closetext
	end

TrainerGruntM8:
	trainer GRUNTM, GRUNTM_8, EVENT_BEAT_ROCKET_GRUNTM_8, GruntM8SeenText, GruntM8BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM8AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM9:
	trainer GRUNTM, GRUNTM_9, EVENT_BEAT_ROCKET_GRUNTM_9, GruntM9SeenText, GruntM9BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	endifjustbattled
	opentext
	writetext GruntM9AfterBattleText
	waitbutton
	closetext
	end

CardKeySlotScript::
	opentext
	writetext RadioTower3FCardKeySlotText
	waitbutton
	checkevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	iftrue .UsedCardKey
	checkitem CARD_KEY
	iftrue .HaveCardKey
.UsedCardKey:
	closetext
	end

.HaveCardKey:
	writetext InsertedTheCardKeyText
	waitbutton
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	playsound SFX_ENTER_DOOR
	changeblock 14, 2, $2a ; open shutter
	changeblock 14, 4, $01 ; floor
	reloadmappart
	closetext
	waitsfx
	end

RadioTower3FPersonnelSign:
	jumptext RadioTower3FPersonnelSignText

RadioTower3FPokemonMusicSign:
	jumptext RadioTower3FPokemonMusicSignText

RadioTower3FSuperNerdText:
	text "I am working on"
	line "my #dex."

	para "I've seen 200"
	line "#mon."

	para "When I complete"
	line "it I will sell"
	cont "it and make a"
	cont "fortune."
	done

RadioTower3FGymGuideText_Rockets:
	text "TEAM ROCKET say"
	line "they are fighting"
	cont "to save us from"
	cont "Hoenn."

	para "Don't believe a"
	line "word of it!"
	done

RadioTower3FGymGuideText:
	text "The only slots"
	line "I get given are"
	cont "always just after"
	cont "midnight."

	para "Most would hate"
	line "it but I love"
	cont "it."

	para "I call it"
	line "GASTLY tunes!"
	done

RadioTower3FCooltrainerFPleaseSaveDirectorText:
	text "TEAM ROCKET have"
	line "taken the DIRECTOR"
	cont "hostage!"

	para "He is locked on"
	line "the fifth floor."

	para "ROCKET executives"
	line "are there."

	para "They are really"
	line "strong!"
	done

RadioTower3FCooltrainerFIsDirectorSafeText:
	text "Is the DIRECTOR"
	line "safe?"
	done

RadioTower3FCooltrainerFYoureMyHeroText:
	text "You defeated all"
	line "of TEAM ROCKET!"

	para "I heard a hero"
	line "from Kanto did"
	cont "that 5 years ago."
	done

GruntM8SeenText:
	text "You should not"
	line "be here!"

	para "I knew the guy"
	line "on the ground"
	cont "floor was going"
	cont "to be useless."
	done

GruntM8BeatenText:
	text "That makes sense."
	done

GruntM8AfterBattleText:
	text "If you think"
	line "you have any"
	cont "hope against"
	cont "the executives."

	para "You are a fool."
	done

GruntM9SeenText:
	text "My wall!"

	para "My precious"
	line "wall!"

	para "The paling"
	line "has fallen!"

	para "You shall know"
	line "my wrath!"
	done

GruntM9BeatenText:
	text "We are undone."
	done

GruntM9AfterBattleText:
	text "There is only"
	line "one way you"
	cont "could have that"
	cont "key."

	para "You would see"
	line "us all slaves"
	cont "of Hoenn."
	done

RadioTower3FCardKeySlotText:
	text "It's the CARD KEY"
	line "slot."
	done

InsertedTheCardKeyText:
	text "<PLAYER> inserted"
	line "the CARD KEY."
	done

RadioTower3FPersonnelSignText:
	text "3F PERSONNEL"
	done

RadioTower3FPokemonMusicSignText:
	text "#mon MUSIC with"
	line "Host DJ BEN"
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_2F, 1
	warp_event  7,  0, RADIO_TOWER_4F, 2
	warp_event 17,  0, RADIO_TOWER_4F, 4

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, RadioTower3FPersonnelSign
	bg_event  9,  0, BGEVENT_READ, RadioTower3FPokemonMusicSign
	bg_event 14,  2, BGEVENT_UP, CardKeySlotScript

	def_object_events
	object_event  7,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RadioTower3FSuperNerdScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event  3,  4, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower3FGymGuideScript, -1
	object_event 11,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower3FCooltrainerFScript, -1
	object_event  6,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM8, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 16,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM9, EVENT_RADIO_TOWER_ROCKET_TAKEOVER

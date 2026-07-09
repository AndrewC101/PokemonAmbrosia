	object_const_def
	const TOHJOLAKE_LATIOS_TRAINER
	const TOHJOLAKE_SETO
	const TOHJOLAKE_TM_HORN_DRILL

TohjoLake_MapScripts:
	def_scene_scripts

	def_callbacks

TohjoLakeTrainerSeto:
	trainer BLUE, SETO, EVENT_BEAT_SETO, TohjoLakeSetoSeenText, TohjoLakeSetoBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	writetext TohjoLakeSetoAfterBattleText
	waitbutton
	closetext
	end

TohjoLakeLatiosTrainerScript:
	faceplayer
	opentext
	callasm TohjoLakeHasLatiasInParty
	iftrue .HasLatias
	writetext TohjoLakeNoLatiasText
	waitbutton
	closetext
	end

.HasLatias:
	writetext TohjoLakeHasLatiasText
	waitbutton
	closetext
	cry LATIOS
	pause 15
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .LowerLevel
	checkevent EVENT_BEAT_WALLACE
	iffalse .MidLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon LATIOS, 80
	sjump .Begin
.MidLevel:
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon LATIOS, 60
	sjump .Begin
.LowerLevel:
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon LATIOS, 50
.Begin:
	startbattle
	reloadmapafterbattle
	setval LATIOS
	special MonCheck
	iftrue .Caught
	end
.Caught:
	setevent EVENT_CAUGHT_LATIOS
	disappear TOHJOLAKE_LATIOS_TRAINER
	end

; Return 1 in wScriptVar if the party contains Latias.
TohjoLakeHasLatiasInParty:
	ld a, [wPartyCount]
	ld b, a
	and a
	jr z, .not_found
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp LATIAS
	jr z, .found
	dec b
	jr z, .not_found
	jr .loop
.not_found
	xor a
	ld [wScriptVar], a
	ret
.found
	ld a, 1
	ld [wScriptVar], a
	ret

TohjoLakeNoLatiasText:
	text "Latias..."
	line "Where is Latias?"
	done

TohjoLakeHasLatiasText:
	text "Latias! Come"
	line "with me."
	done

TohjoLakeSetoSeenText:
	text "That fool Henshin"
	line "seeks the power of"
	cont "death thinking it"
	cont "can defeat Atem."
	para "Atem can only be"
	line "defeated by one"
	cont "power, the"
	cont "ultimate power."
	para "Exodia!"
	para "I am sure I am on"
	line "the right track, I"
	cont "just know it."
	para "You will not stop"
	line "me!"
	done

TohjoLakeSetoBeatenText:
	text "Not again!"
	done

TohjoLakeSetoAfterBattleText:
	text "I was born to"
	line "rule."

	para "When that day"
	line "comes people"
	cont "like you may"
	cont "live to be"
	cont "my pets."

	para "And Atem will"
	line "kneel before me!"
	done

TohjoLakeTMHornDrill:
	itemball TM_HORN_DRILL

TohjoLake_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  7, ANCIENT_HALL_STAIRS, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event 22, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, TohjoLakeLatiosTrainerScript, EVENT_CAUGHT_LATIOS
	object_event  5,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TohjoLakeTrainerSeto, -1
	object_event 38,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, TohjoLakeTMHornDrill, EVENT_TOHJO_LAKE_TM_HORN_DRILL

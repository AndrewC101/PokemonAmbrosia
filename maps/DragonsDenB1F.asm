	object_const_def
	const DRAGONSDENB1F_POKE_BALL1
	const DRAGONSDENB1F_CLAIR
	const DRAGONSDENB1F_COOLTRAINER_M
	const DRAGONSDENB1F_COOLTRAINER_F
	const DRAGONSDENB1F_TWIN1
	const DRAGONSDENB1F_TWIN2
	const DRAGONSDENB1F_RAYQUAZA
	const DRAGONSDENB1F_FIELDMON_1
    const DRAGONSDENB1F_FIELDMON_2
    const DRAGONSDENB1F_FIELDMON_3
    const DRAGONSDENB1F_FIELDMON_4
    const DRAGONSDENB1F_FIELDMON_5
    const DRAGONSDENB1F_FIELDMON_6
    const DRAGONSDENB1F_FIELDMON_7
    const DRAGONSDENB1F_FIELDMON_8
    const DRAGONSDENB1F_INVADER

DragonsDenB1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DRAGONSDENB1F_NOTHING
	scene_script .DummyScene1 ; SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .DragonsDenB1FieldMon

.DummyScene0:
	end

.DummyScene1:
	end

.DragonsDenB1FieldMon:
; Pokemon which always appear
    appear DRAGONSDENB1F_FIELDMON_1
    appear DRAGONSDENB1F_FIELDMON_2
    appear DRAGONSDENB1F_FIELDMON_3
    appear DRAGONSDENB1F_FIELDMON_4
    appear DRAGONSDENB1F_FIELDMON_5
    appear DRAGONSDENB1F_FIELDMON_6
    appear DRAGONSDENB1F_FIELDMON_7
    appear DRAGONSDENB1F_FIELDMON_8
    endcallback

DragonsDenB1FieldMon1Script:
	cry DRACOVISH
	pause 15
	loadwildmon DRACOVISH, 46
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_1
	disappear DRAGONSDENB1F_FIELDMON_1
	end

DragonsDenB1FieldMon2Script:
	cry MILOTIC
	pause 15
	loadwildmon MILOTIC, 48
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_2
	disappear DRAGONSDENB1F_FIELDMON_2
	end

DragonsDenB1FieldMon3Script:
	cry GYARADOS
	pause 15
	loadwildmon GYARADOS, 48
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear DRAGONSDENB1F_FIELDMON_3
	end

DragonsDenB1FieldMon4Script:
	cry KINGDRA
	pause 15
	loadwildmon KINGDRA, 50
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear DRAGONSDENB1F_FIELDMON_4
	end

DragonsDenB1FieldMon5Script:
	faceplayer
	cry DRAGONITE
	pause 15
	loadwildmon DRAGONITE, 80
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear DRAGONSDENB1F_FIELDMON_5
	end

DragonsDenB1FieldMon6Script:
	faceplayer
	cry DRATINI
	pause 15
	loadwildmon DRATINI, 10
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear DRAGONSDENB1F_FIELDMON_6
	end

DragonsDenB1FieldMon7Script:
	faceplayer
	cry BAGON
	pause 15
	loadwildmon BAGON, 10
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear DRAGONSDENB1F_FIELDMON_7
	end

DragonsDenB1FieldMon8Script:
	faceplayer
	cry GIBLE
	pause 15
	loadwildmon GIBLE, 10
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear DRAGONSDENB1F_FIELDMON_8
	end

RayquazaScript:
	callasm IsDragoniteInParty
	iffalse .notWorthy
	callasm IsSalamenceInParty
	iffalse .notWorthy
	callasm IsGarchompInParty
	iffalse .notWorthy

    opentext
	writetext RayquazaWorthyText
	cry RAYQUAZA
	pause 15
	closetext
	checkevent EVENT_BEAT_WALLACE
	iffalse .midLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon RAYQUAZA, 80
    sjump .begin
.midLevel
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon RAYQUAZA, 70
    sjump .begin
.lowerLevel
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon RAYQUAZA, 60
.begin
	startbattle
	reloadmapafterbattle
    setval RAYQUAZA
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_RAYQUAZA
	disappear DRAGONSDENB1F_RAYQUAZA
	end
.notWorthy
    opentext
    writetext RayquazaNotWorthyText
    waitbutton
    closetext
    end

IsDragoniteInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp DRAGONITE
	jr z, .found
	dec b
	jr z, .notFound
	jr .loop
.notFound
    xor a
    ld [wScriptVar], a
    ret
.found
    ld a, 1
    ld [wScriptVar], a
    ret

IsSalamenceInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp SALAMENCE
	jr z, .found
	dec b
	jr z, .notFound
	jr .loop
.notFound
    xor a
    ld [wScriptVar], a
    ret
.found
    ld a, 1
    ld [wScriptVar], a
    ret

IsGarchompInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp GARCHOMP
	jr z, .found
	dec b
	jr z, .notFound
	jr .loop
.notFound
    xor a
    ld [wScriptVar], a
    ret
.found
    ld a, 1
    ld [wScriptVar], a
    ret

RayquazaNotWorthyText:
	text "RRAGGGGGGG"

	para "...."

	para "Thou hast traveled"
	line "far and the burden"
	cont "of thine travels"
	cont "be written on"
	cont "thine heart."

	para "I am RAYQUAZA."

	para "Upon throne"
	line "immortal I sit."

	para "Thou life fleeting"
	line "though it be..."

	para "It sends ripples"
	line "cascading through"
	cont "time beyond thine"
	cont "days."

	para "YES...RRGGGHHHH"

	para "A tiny flame"
	line "whispers of the"
	cont "dormant inferno"
	cont "resting in thine"
	cont "soul."

	para "Prove to me thine"
	line "kinship."

	para "Entwine thou"
	line "flame with those"
	cont "of mine kin."

	para "DRAGONITE."

	para "SALAMENCE."

	para "GARCHOMP."

	para "Present them to"
	line "me and thou shalt"
	cont "know my favor."
	done

RayquazaWorthyText:
	text "AHHHHH..."

	para "The inferno"
	line "erupts."

	para "Luminous thou"
	line "appears before me."

	para "An overwhelming"
	line "light I have only"
	cont "felt once before."

	para "I feel the fire"
	line "course my veins."

	para "Which flame shall"
	line "prevail!"

	para "RRRGAAAHHH!!!"

	para "Come young"
	line "DRAGON CHAMPION."

	para "Have at thee!"
	done

DragonsDenB1F_ClairScene:
	appear DRAGONSDENB1F_CLAIR
	opentext
	writetext ClairText_Wait
	pause 30
	closetext
	showemote EMOTE_SHOCK, PLAYER, 15
	turnobject PLAYER, LEFT
	playmusic MUSIC_CLAIR
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksToYou
	opentext
	writetext ClairText_GiveDragonbreathDragonDen
	promptbutton
	giveitem TM_DRAGON_PULSE
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGON_PULSE
	writetext Text_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext ClairText_DescribeDragonbreathDragonDen
	promptbutton
	writetext ClairText_WhatsTheMatterDragonDen
	waitbutton
	closetext
	sjump .FinishClair

.BagFull:
	writetext ClairText_NoRoom
	waitbutton
	closetext
.FinishClair:
	applymovement DRAGONSDENB1F_CLAIR, MovementDragonsDen_ClairWalksAway
	special FadeOutMusic
	pause 30
	special RestartMapMusic
	disappear DRAGONSDENB1F_CLAIR
	setscene SCENE_DRAGONSDENB1F_NOTHING
	end

TrainerCooltrainermDarin:
	trainer COOLTRAINERM, DARIN, EVENT_BEAT_COOLTRAINERM_DARIN, CooltrainermDarinSeenText, CooltrainermDarinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermDarinAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfCara:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfCaraSeenText, CooltrainerfCaraBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfCaraAfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia1:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia1SeenText, TwinsLeaandpia1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia1AfterBattleText
	waitbutton
	closetext
	end

TrainerTwinsLeaandpia2:
	trainer TWINS, LEAANDPIA1, EVENT_BEAT_TWINS_LEA_AND_PIA, TwinsLeaandpia2SeenText, TwinsLeaandpia2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TwinsLeaandpia2AfterBattleText
	waitbutton
	closetext
	end

DragonsDenB1FDragonFangScript:
; This whole script is written out rather than as an itemball
; because it's left over from the GS event.
	giveitem DRAGON_SCALE
	iffalse .BagFull
	disappear DRAGONSDENB1F_POKE_BALL1
	opentext
	getitemname STRING_BUFFER_3, DRAGON_SCALE
	writetext Text_FoundDragonFang
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	end

.BagFull:
	opentext
	getitemname STRING_BUFFER_3, DRAGON_SCALE
	writetext Text_FoundDragonFang
	promptbutton
	writetext Text_NoRoomForDragonFang
	waitbutton
	closetext
	end

DragonShrineSignpost:
	jumptext DragonShrineSignpostText

DragonsDenB1FCalcium:
	itemball CALCIUM

DragonsDenB1FMaxElixer:
	itemball MAX_REVIVE

DragonsDenB1FHiddenRevive:
	hiddenitem RARE_CANDY, EVENT_DRAGONS_DEN_B1F_HIDDEN_REVIVE

DragonsDenB1FHiddenMaxPotion:
	hiddenitem RARE_CANDY, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_POTION

DragonsDenB1FHiddenMaxElixer:
	hiddenitem AMBROSIA, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER

MovementDragonsDen_ClairWalksToYou:
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	slow_step RIGHT
	step_end

MovementDragonsDen_ClairWalksAway:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	step_end

ClairText_Wait:
	text "Wait!"
	done

ClairText_GiveDragonbreathDragonDen:
	text "I apologise"
	line "for my conduct."

	para "It has been most"
	line "shameful and"
	cont "unbecoming of a"
	cont "LEADER."

	para "You have the heart"
	line "of a dragon!"

	para "You should take"
	line "this."
	done

Text_ReceivedTM24:
	text "<PLAYER> received"
	line "TM24."
	done

ClairText_DescribeDragonbreathDragonDen:
	text "That contains"
	line "DRAGON PULSE."
	done

ClairText_NoRoom: ; impossible?
	text "Oh? You don't have"
	line "any room for this."

	para "I'm going back to"
	line "the GYM, so make"

	para "room, then come"
	line "see me there."
	done

ClairText_WhatsTheMatterDragonDen:
	text "You have obtained"
	line "all 8 BADGES of"
	cont "JOHTO."

	para "Now you are"
	line "ready for the"
	cont "final challenge."

	para "You must face the"
	line "ELITE FOUR."

	para "They are some of"
	line "the strongest"
	cont "trainers in the"
	cont "world."

	para "If you defeat"
	line "them you become"
	cont "a CHAMPION."

	para "To get to them"
	line "you must travel"
	cont "east from NEW"
	cont "BARK TOWN."

	para "If you become"
	line "a CHAMPION many"
	cont "things will"
	cont "change."

	para "People will"
	line "expect you to"
	cont "fight in the"
	cont "war."

	para "You don't have"
	line "to do this."

	para "I have a feeling"
	line "it will be an"
	cont "easy decision"
	cont "for you."

	para "Just as it was"
	line "for LANCE."

	para "Good luck!"
	done

DragonShrineSignpostText:
	text "DRAGON SHRINE"

	para "A shrine honoring"
	line "DRAGON #mon"
	done

CooltrainermDarinSeenText:
	text "How dare you"
	line "enter this sacred"
	cont "place."

	para "In the name of"
	line "the great LANCE."

	para "I shall expel you!"
	done

CooltrainermDarinBeatenText:
	text "Forgive me"
	line "father."
	done

CooltrainermDarinAfterBattleText:
	text "You must be the"
	line "trainer CLAIR"
	cont "has permitted."

	para "I can tell that"
	line "LANCE would agree"
	cont "with her decision."
	done

CooltrainerfCaraSeenText:
	text "Are you the one"
	line "who defeated"
	cont "LEADER CLAIR?"

	para "No way."

	para "I won't allow"
	line "a nobody like"
	cont "you to disrespect"
	cont "the beautiful"
	cont "CLAIR."
	done

CooltrainerfCaraBeatenText:
	text "I tried, CLAIR."
	done

CooltrainerfCaraAfterBattleText:
	text "CLAIR and I"
	line "started training"
	cont "at the same time."

	para "We were both"
	line "given a HORSEA"
	cont "as our first"
	cont "#mon."

	para "But CLAIR is so"
	line "talented."

	para "She overtook me"
	line "in no time."
	done

TwinsLeaandpia1SeenText:
	text "This is a"
	line "sacred place."

	para "My sister and I"
	line "can hear the"
	cont "dragons talk."

	para "Very few have"
	line "such a gift."

	para "Even the master"
	line "and CLAIR can not"
	cont "do that."
	done

TwinsLeaandpia1BeatenText:
	text "You must listen."
	done

TwinsLeaandpia1AfterBattleText:
	text "You should talk"
	line "with the great"
	cont "DRAGON LORD."

	para "I'm too scared to"
	line "talk to him."

	para "He will eat me!"
	done

TwinsLeaandpia2SeenText:
	text "My sister keeps"
	line "asking me to"
	cont "talk to the"
	cont "DRAGON LORD."

	para "She is too"
	line "scared of him."
	done

TwinsLeaandpia2BeatenText:
	text "Can you speak"
	line "dragon!"
	done

TwinsLeaandpia2AfterBattleText:
	text "Hearing dragons"
	line "talk is a rare"
	cont "gift."

	para "The only other"
	line "who can do it"
	cont "is LANCE."

	para "That's why we"
	line "are allowed in"
	cont "here."
	done

Text_FoundDragonFang:
	text "<PLAYER> found"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

Text_NoRoomForDragonFang:
	text "But <PLAYER> can't"
	line "carry any more"
	cont "items."
	done

DragonsDenB1FAmbrosiaScript:
    itemball AMBROSIA
	
InvaderLoganScript:
	trainer INVADER, LOGAN, EVENT_BEAT_INVADER_LOGAN, InvaderLoganSeenText, InvaderLoganBeatenText, InvaderLoganVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderLoganAfterBattleText
	waitbutton
	closetext
	end

InvaderLoganSeenText:
    text "You seem quiet"
    line "lucid."

    para "This is DRAGONS"
    line "DEN."

    para "This place is a"
    line "great pool of"
    cont "knowledge."

    para "Bearing the"
    line "fruits of superior"
    cont "wisdom and an"
    cont "unquenchable"
    cont "desire for truth."

    para "Let us learn"
    line "together."
	done

InvaderLoganVictoryText:
	text "Heavens, the"
	line "folly of youth."
	done

InvaderLoganBeatenText:
	text "I fail to see"
	line "your design."
	done

InvaderLoganAfterBattleText:
	text "All progress"
	line "demands sacrifice."

	para "Far away in"
	line "PEWTER CITY"
	cont "there is a"
	cont "knight named"
	cont "HAVEL."

	para "He seeks to end"
	line "all dragons."

	para "We must not let"
	line "their knowledge"
	cont "fade."
	done

DragonsDenB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 20,  3, DRAGONS_DEN_1F, 3
	warp_event 19, 29, DRAGON_SHRINE, 1

	def_coord_events
	coord_event 19, 30, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM, DragonsDenB1F_ClairScene

	def_bg_events
	bg_event 18, 24, BGEVENT_READ, DragonShrineSignpost
	bg_event 33, 29, BGEVENT_ITEM, DragonsDenB1FHiddenRevive
	bg_event 21, 17, BGEVENT_ITEM, DragonsDenB1FHiddenMaxPotion

	def_object_events
	object_event 32, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FDragonFangScript, EVENT_DRAGONS_DEN_B1F_DRAGON_FANG
	object_event 14, 30, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGONS_DEN_CLAIR
	object_event 21, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermDarin, -1
	object_event  8,  8, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfCara, -1
	object_event  4, 17, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia1, -1
	object_event  4, 18, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerTwinsLeaandpia2, -1
	object_event 20, 15, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RayquazaScript, EVENT_CAUGHT_RAYQUAZA
	object_event 24, 11, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon1Script, EVENT_FIELD_MON_1
	object_event 13, 15, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon2Script, EVENT_FIELD_MON_2
	object_event 10, 26, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon3Script, EVENT_FIELD_MON_3
	object_event 28, 25, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon4Script, EVENT_FIELD_MON_4
	object_event 35, 10, SPRITE_DRAGONITE, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon5Script, EVENT_FIELD_MON_5
	object_event 34, 12, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon6Script, EVENT_FIELD_MON_6
	object_event 34, 15, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon7Script, EVENT_FIELD_MON_7
	object_event 36, 13, SPRITE_DRAGON, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, DragonsDenB1FieldMon8Script, EVENT_FIELD_MON_8
	object_event 19,  7, SPRITE_WILL, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, InvaderLoganScript, -1
	object_event 35, 9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_ITEMBALL, 0, DragonsDenB1FAmbrosiaScript, EVENT_DRAGONS_DEN_B1F_HIDDEN_MAX_ELIXER



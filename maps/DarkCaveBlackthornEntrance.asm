	object_const_def
	const DARKCAVEBLACKTHORNENTRANCE_GIRATINA
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL1
	const DARKCAVEBLACKTHORNENTRANCE_POKE_BALL2
	const DARKCAVEBLACKTHORNENTRANCE_INVADER_CRESTFALLEN
	const DARKCAVEBLACKTHORNENTRANCE_FIELDMON_1
    const DARKCAVEBLACKTHORNENTRANCE_FIELDMON_2
    const DARKCAVEBLACKTHORNENTRANCE_FIELDMON_3
    const DARKCAVEBLACKTHORNENTRANCE_XEHANORT

DarkCaveBlackthornEntrance_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .AreaFieldMon

.AreaFieldMon:
; Pokemon which always appear
    appear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_1
    appear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_2
    appear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_3
    endcallback

GiratinaScript:
    opentext
	callasm IsArceusInParty
	iftrue .arceus
	callasm IsRayquazaInParty
	iffalse .noRayquaza
.rayquaza
    opentext
	writetext GiratinaPlayerHasRayquazaText
	sjump .battle
.arceus
	opentext
	writetext GiratinaPlayerHasArceusText
.battle
    waitbutton
	cry GIRATINA
	pause 15
	closetext
	loadvar VAR_BATTLETYPE, BATTLETYPE_PERFECT
	loadwildmon GIRATINA, 80
	startbattle
	reloadmapafterbattle
    setval GIRATINA
	special MonCheck
	iftrue .caught
	end
.caught
    setevent EVENT_CAUGHT_GIRATINA
	disappear DARKCAVEBLACKTHORNENTRANCE_GIRATINA
	end
.noRayquaza
    opentext
	writetext GiratinaIntroText
	waitbutton
	closetext
    end

GiratinaIntroText:
    text "I have waited"
    line "for you young"
    cont "lord."

    para "The darkness"
    line "embraces you"
    cont "as its saviour."

    para "Once I sat"
    line "warm and full"
    cont "in the hall of"
    cont "light."

    para "The place where"
    line "all that is came"
    cont "to be."

    para "Then the cruel"
    line "ruler banished"
    cont "me for daring"
    cont "to question his"
    cont "divine morality."

    para "We are all"
    line "fallen beings"
    cont "in his eyes."

    para "You poor humans"
    line "especially."

    para "You and only"
    line "you can save"
    cont "us all."

    para "Not far from"
    line "here lies the"
    cont "den of a great"
    cont "hieratic!"

    para "The DRAGON LORD"
    line "they call him."

    para "If those poor"
    line "humans only"
    cont "knew..."

    para "He uses them!"

    para "Commands them to"
    line "raise for him an"
    cont "army of dragons."

    para "You must bring"
    line "him to me my"
    cont "dear disciple."

    para "Entrust thine"
    line "flesh and soul"
    cont "to me."

    para "Bring me"
    line "RAYQUAZA!"
    done

GiratinaPlayerHasArceusText:
	text "Impossible!"
	para "Salvation preserve"
	line "me!"
	para "ARCEUS!"
	para "Thine light doth"
	line "wither my petty"
	cont "temptations."
	para "Thine is the"
	line "kingdom."
	para "Deliver me from"
	line "evil!"
	done

GiratinaPlayerHasRayquazaText:
    text "Thou hast done"
    line "well..."

    para "My dear, dear"
    line "disciple."

    para "ARCEUS!"

    para "Watch and"
    line "mark you well."

    para "Your child shall"
    line "receive true"
    cont "love."

	para "I shall murder"
	line "your dear RAYQUAZA"
	cont "and spare him the"
	cont "torment I"
	cont "eternally endure."

    para "And you my"
    line "sweet disciple."

    para "Your devotion"
    line "shalt not go"
    cont "unrewarded."

    para "You can be part"
    line "of me forever."

    para "I shall devour"
    line "you."

    para "Slowly..."

    para "Lovingly..."

    para "RRAAUUOORR!"
    done


DarkCaveBlackthornEntranceTMCurse:
	itemball TM_CURSE

DarkCaveBlackthornEntranceTMSnore:
	itemball TM_DARK_PULSE

InvaderJackScript:
	trainer INVADER, CRESTFALLEN, EVENT_BEAT_INVADER_CRESTFALLEN, InvaderJackSeenText, InvaderJackBeatenText, InvaderJackVictoryText, .Script

.Script:
	;endifjustbattled
	opentext
	writetext InvaderJackAfterBattleText
	waitbutton
	closetext
	end

InvaderJackSeenText:
    text "I knew you were"
    line "a special one"
    cont "when I asked you"
    cont "to bring me the"
    cont "RED EYE ORB."

    para "Lord GIRATINA"
    line "is the father"
    cont "of all invaders."

    para "There is no good"
    line "and evil. Only"
    cont "the weak and"
    cont "the strong."

    para "The weak must"
    line "perish!"
	done

InvaderJackVictoryText:
	text "How disappointing."
	done

InvaderJackBeatenText:
	text "You are strong!"
	done

InvaderJackAfterBattleText:
	text "Go on dear child."

	para "Aid Lord GIRATINA"
	line "and you shall be"
	cont "rewarded."

	para "Heh heh heh."
	done

DarkCaveBlackthornEntranceFieldMon1Script:
	trainer TYRANITAR, FIELD_MON, EVENT_FIELD_MON_1, DarkCaveBlackthornEntrancePokemonAttacksText, 64, 0, .script
.script
    disappear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_1
    end

DarkCaveBlackthornEntranceFieldMon2Script:
	trainer GENGAR, FIELD_MON, EVENT_FIELD_MON_2, DarkCaveBlackthornEntrancePokemonAttacksText, 62, 0, .script
.script
    disappear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_2
    end

DarkCaveBlackthornEntranceFieldMon3Script:
	trainer MIMIKYU, FIELD_MON, EVENT_FIELD_MON_3, DarkCaveBlackthornEntrancePokemonAttacksText, 61, 0, .script
.script
    disappear DARKCAVEBLACKTHORNENTRANCE_FIELDMON_3
    end

DarkCaveBlackthornEntrancePokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done
	
DarkCaveXehanortScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_XEHANORT
	iftrue .FightDone
.fight
	writetext DarkCaveXehanortSeenText
	waitbutton
	closetext
	winlosstext DarkCaveXehanortBeatenText, DarkCaveXehanortWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer SAGE, XEHANORT
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_XEHANORT
	end
.FightDone:
	writetext DarkCaveXehanortAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextDarkCaveXehanort
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextDarkCaveXehanort
	waitbutton
	closetext
	end
DarkCaveXehanortSeenText:
    text "These worlds have"
    line "been connected."

    para "Tied to the"
    line "darkness."

    para "Soon to be"
    line "completely"
    cont "eclipsed."

    para "There must be a"
    line "balance."

    para "You disturb this."

    para "You will help me"
    line "tear down this"
    cont "tyranny of light."
    done
DarkCaveXehanortBeatenText:
    text "Only now have I"
    line "truly won."
    done
DarkCaveXehanortWinsText:
    text "Open your heart."
    done
DarkCaveXehanortAfterBattleText:
    text "All worlds begin"
    line "in darkness."

    para "And also end."

    para "Your heart is"
    line "no different."
    done
RematchTextDarkCaveXehanort:
    text "Do you have more"
    line "to learn?"
    done
RematchRefuseTextDarkCaveXehanort:
    text "Open your heart."
    done

GiratinaBarrierScript:
    callasm IsDarkraiInParty
    iftrue .unblock
    callasm IsArceusInParty
    iftrue .unblock
    opentext
    writetext BeGoneText
    waitbutton
    closetext
    warp DARK_CAVE_VIOLET_ENTRANCE, 17, 2
    opentext
    writetext DarkraiNeededText
    waitbutton
    closetext
    sjump .end
.unblock
    opentext
    writetext DarkraiUnblocksText
    waitbutton
    closetext
.end
    end

IsDarkraiInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp DARKRAI
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

IsArceusInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp ARCEUS
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

IsRayquazaInParty:
    ld a, [wPartyCount]
    ld b, a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp RAYQUAZA
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

BeGoneText:
    text "A powerful"
    line "darkness overcomes"
    cont "and expels you."
    done

DarkraiNeededText:
    text "It will take a"
    line "DARK #mon"
    cont "that can cross"
    cont "the dream world"
    cont "to allow passage."
    done

DarkraiUnblocksText:
    text "The path is"
    line "revealed!"
    done

DarkCaveBlackthornEntrance_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 41,  3, ROUTE_45, 1
	warp_event 21, 25, DARK_CAVE_VIOLET_ENTRANCE, 2

	def_coord_events
	coord_event 15, 13, SCENE_ALWAYS, GiratinaBarrierScript

	def_bg_events

	def_object_events
	object_event  6,  4, SPRITE_GIRATINA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_ROCK, OBJECTTYPE_SCRIPT, 0, GiratinaScript, EVENT_CAUGHT_GIRATINA
	object_event 25,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMCurse, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_REVIVE
	object_event 39, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, DarkCaveBlackthornEntranceTMSnore, EVENT_DARK_CAVE_BLACKTHORN_ENTRANCE_TM_SNORE
	object_event  8, 11, SPRITE_GRAMPS,    SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderJackScript, -1
	object_event 23, 11, SPRITE_TYRANITAR, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, DarkCaveBlackthornEntranceFieldMon1Script, EVENT_FIELD_MON_1
	object_event 21, 19, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, DarkCaveBlackthornEntranceFieldMon2Script, EVENT_FIELD_MON_2
	object_event 40,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, DarkCaveBlackthornEntranceFieldMon3Script, EVENT_FIELD_MON_3
	object_event  7, 28, SPRITE_SAGE, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DarkCaveXehanortScript, -1



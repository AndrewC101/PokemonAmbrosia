	object_const_def
	const VERMILIONGYM_SURGE
	const VERMILIONGYM_GENTLEMAN
	const VERMILIONGYM_ROCKER
	const VERMILIONGYM_SUPER_NERD
	const VERMILIONGYM_GYM_GUIDE

VermilionGym_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionGymSurgeScript:
	faceplayer
	opentext
	checkflag ENGINE_THUNDERBADGE
	iftrue .FightDone
	writetext LtSurgeIntroText
	yesorno
	iffalse .refuseSong
	playmusic MUSIC_HOEN_GRUNT
	writetext LtSurgeSingAndBattle
	waitbutton
	closetext
	winlosstext LtSurgeLossText, LtSurgeWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_LTSURGE
	setevent EVENT_BEAT_GENTLEMAN_GREGORY
	setevent EVENT_BEAT_GUITARIST_VINCENT
	setevent EVENT_BEAT_JUGGLER_HORTON
	opentext
	writetext ReceivedThunderBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_THUNDERBADGE
	writetext LtSurgeThunderBadgeText
	waitbutton
	closetext
	end
.rematch
    writetext LtSurgeIntroText
	yesorno
	iffalse .refuseSong
	playmusic MUSIC_HOEN_GRUNT
	writetext LtSurgeSingAndBattle
	waitbutton
	closetext
	winlosstext LtSurgeLossText, LtSurgeWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_REMATCH
	loadtrainer LT_SURGE, LT_SURGE1
	startbattle
	reloadmapafterbattle
	end
.refuseSong
    writetext LtSurgeFineThenText
    waitbutton
    closetext
    end

.FightDone:
	writetext LtSurgeFightDoneText
	waitbutton
    closetext
	opentext
	writetext RematchTextSurge
	nooryes
	iftrue .rematch
	writetext RematchRefuseTextSurge
	waitbutton
	closetext
	end

TrainerGentlemanGregory:
	trainer GENTLEMAN, GREGORY, EVENT_BEAT_GENTLEMAN_GREGORY, GentlemanGregorySeenText, GentlemanGregoryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GentlemanGregoryAfterBattleText
	waitbutton
	closetext
	end

TrainerGuitaristVincent:
	trainer SUPER_NERD, VINCENT, EVENT_BEAT_GUITARIST_VINCENT, GuitaristVincentSeenText, GuitaristVincentBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GuitaristVincentAfterBattleText
	waitbutton
	closetext
	end

TrainerJugglerHorton:
	trainer POKEMANIAC, HORTON, EVENT_BEAT_JUGGLER_HORTON, JugglerHortonSeenText, JugglerHortonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext JugglerHortonAfterBattleText
	waitbutton
	closetext
	end

VermilionGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LTSURGE
	iftrue .VermilionGymGuideWinScript
	writetext VermilionGymGuideText
	waitbutton
	closetext
	end

.VermilionGymGuideWinScript:
	writetext VermilionGymGuideWinText
	waitbutton
	closetext
	end

VermilionGymTrashCan:
	jumptext VermilionGymTrashCanText

VermilionGymStatue:
	checkflag ENGINE_THUNDERBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, LT_SURGE, LT_SURGE1
	jumpstd GymStatue2Script

LtSurgeIntroText:
	text "For many people"
	line "war is a"
	cont "terrifying"
	cont "prospect."

	para "To me it feels"
	line "like going home."

	para "I have fought in"
	line "every major war"
	cont "for the last"
	cont "decade."

	para "I have traveled"
	line "the world and"
	cont "caught the best"
	cont "ELECTRIC #mon."

	para "Recently I have"
	line "learnt to relax."

	para "Rather than"
	line "zapping my enemies"
	cont "with my mighty"
	cont "ELECTRIC #mon."

	para "I'm zapping my"
	line "fans with my"
	cont "mighty ELECTRIC"
	cont "voice."

	para "Want to hear?"
	done

LtSurgeSingAndBattle:
    text "This is one of"
    line "our popular songs."

    para "It's called"
    line "RAGING ELECTRODE."

    para "...."

    para "URRHHHHAAAHHHH!"

    para "WITHOUT YOU IN"
    line "MY LIFE."

    para "I FEEL NO PAIN."

    para "I FEEL NO STRIFE."

    para "ELECTRODE!!"

    para "ELECTRODE!!"

    para "I CAN'T BEGIN"
    line "TO STATE."

    para "MY INDIFFERENCE"
    line "TO PARTICIPATE."

    para "ELECTRODE!!"

    para "ELECTRODE!!"

    para "BOOOOOOMMM!!"

    para "...."

	para "Man that has me"
	line "in the mood."

	para "Let's FIGHT!"
	done

LtSurgeFineThenText:
    text "Fine then!"

    para "Get out of here."
    done

LtSurgeLossText:
	text "You have fought"
	line "with honor"
	cont "soldier."
	done

LtSurgeWinText:
	text "I amped up"
	line "too much."
	done

ReceivedThunderBadgeText:
	text "<PLAYER> received"
	line "THUNDERBADGE."
	done

LtSurgeThunderBadgeText:
	text "Wear the"
	line "THUNDERBADGE"
	cont "with pride."

	para "It proves your"
	line "valor on the"
	cont "battlefield."
	done

LtSurgeFightDoneText:
	text "Hey soldier!"

	para "Suck in that"
	line "gut!"

	para "You should go"
	line "to a SOLENOID"
	cont "concert."

	para "I'll blow your"
	line "mind with mighty"
	cont "metal muscle!"
	done

GentlemanGregorySeenText:
	text "I fought with"
	line "LT SURGE in"
	cont "wars long ago."

	para "I am the agent"
	line "for his band."

	para "I have many"
	line "useful contacts."

	para "But I appreciate"
	line "his metal."

	para "Used to be a"
	line "singer myself."
	done

GentlemanGregoryBeatenText:
	text "LT SURGE."

	para "I failed you"
	line "sir."
	done

GentlemanGregoryAfterBattleText:
	text "LT SURGE saved"
	line "my life on the"
	cont "battlefield."

	para "I will never be"
	line "able to repay him."
	done

GuitaristVincentSeenText:
	text "Hang on little"
	line "dude."

	para "I'm the lead"
	line "guitarist of"
	cont "THE SOLENOIDS."

	para "Let me show you"
	line "this tasty rift!"
	done

GuitaristVincentBeatenText:
	text "Narly."
	done

GuitaristVincentAfterBattleText:
	text "SURGE is the"
	line "main man."

	para "But the chicks"
	line "still dig the"
	cont "guitarist."
	done

JugglerHortonSeenText:
	text "I'm the drummer"
	line "around here."

	para "You can't just"
	line "come backstage"
	cont "without tickets."

	para "I'll pound you"
	line "flat!"
	done

JugglerHortonBeatenText:
	text "Du dum pesht."
	done

JugglerHortonAfterBattleText:
	text "We're waiting on"
	line "our backing"
	cont "guitarist."

	para "Is he still on"
	line "the ship!"
	done

VermilionGymGuideText:
	text "Hey welcome to"
	line "the gig!"

	para "The trainers here"
	line "form a band."

	para "But this is still"
	line "a GYM."

	para "LT SURGE is a war"
	line "hero."

	para "He has the best"
	line "ELECTRIC #mon."

	para "GROUND types are"
	line "your best bet."

	para "But SURGE has"
	line "faced them many"
	cont "times before I'm"
	cont "sure."
	done

VermilionGymGuideWinText:
	text "You got right"
	line "up on that stage"
	cont "and stole the"
	cont "show!"
	done

VermilionGymTrashCanText:
	text "Nope! Nothing here"
	line "but trash."
	done

RematchTextSurge:
    text "How about a"
    line "rematch?"
    prompt

RematchRefuseTextSurge:
    text "Maybe next time."
    done

VermilionGymRaichuScript:
    opentext
    writetext RaichuText
    cry RAICHU
    waitbutton
    closetext
    end

RaichuText:
    text "Raichu!"
    done

VermilionGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, VERMILION_CITY, 7
	warp_event  5, 17, VERMILION_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  1,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  7, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9,  9, BGEVENT_READ, VermilionGymTrashCan
	bg_event  1, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  5, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  7, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  9, 11, BGEVENT_READ, VermilionGymTrashCan
	bg_event  3, 15, BGEVENT_READ, VermilionGymStatue
	bg_event  6, 15, BGEVENT_READ, VermilionGymStatue

	def_object_events
	object_event  5,  2, SPRITE_SURGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, VermilionGymSurgeScript, -1
	object_event  8,  8, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerGentlemanGregory, -1
	object_event  4,  7, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_DOWN, 3, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerGuitaristVincent, -1
	object_event  0, 10, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerJugglerHorton, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, VermilionGymGuideScript, -1
	object_event  4,  2, SPRITE_RAICHU, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 1, VermilionGymRaichuScript, -1

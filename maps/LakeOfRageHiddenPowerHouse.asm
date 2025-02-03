	object_const_def
	const LAKEOFRAGEHIDDENPOWERHOUSE_FISHER

LakeOfRageHiddenPowerHouse_MapScripts:
	def_scene_scripts

	def_callbacks

HiddenPowerGuy:
    setevent EVENT_MET_MAHOGANY_MURDERER
    checkevent EVENT_BEAT_MAHOGANY_MURDERER
    iftrue .beaten
    jumptextfaceplayer HiFriendText
.beaten
    jumptextfaceplayer DontLeaveText

HiddenPowerHouseBookshelf:
    opentext
    writetext StrangeSmellText
    waitbutton
    closetext
    end

MurderScript1:
    checkevent EVENT_MET_MAHOGANY_MURDERER
    iffalse .end
    checkevent EVENT_BEAT_MAHOGANY_MURDERER
    iffalse .assault
    turnobject LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, DOWN
    opentext
    writetext MurdererStaySafeText
    waitbutton
    closetext
.end
    end
.assault
    turnobject LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, DOWN
    pause 15
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, Movement_MurderAssault1
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext MurdererLossText, MurdererWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer HIKER, MAHOGANY_MURDERER
	startbattle
    ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_MAHOGANY_MURDERER
	turnobject PLAYER, UP
	opentext
	writetext MurderGivesThunderboltText
	waitbutton
	verbosegiveitem TM_THUNDERBOLT
	closetext
	applymovement LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, Movement_MurderRetreat1
	end
.lose
	special FadeOutPalettes
	special Reset
	end

MurderScript2:
    checkevent EVENT_MET_MAHOGANY_MURDERER
    iffalse .end
    checkevent EVENT_BEAT_MAHOGANY_MURDERER
    iffalse .assault
    turnobject LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, DOWN
    opentext
    writetext MurdererStaySafeText
    waitbutton
    closetext
.end
    end
.assault
    turnobject LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, DOWN
    pause 15
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, Movement_MurderAssault2
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
	winlosstext MurdererLossText, MurdererWinText
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	loadtrainer HIKER, MAHOGANY_MURDERER
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_MAHOGANY_MURDERER
	turnobject PLAYER, UP
	opentext
	writetext MurderGivesThunderboltText
	waitbutton
	verbosegiveitem TM_THUNDERBOLT
	closetext
	applymovement LAKEOFRAGEHIDDENPOWERHOUSE_FISHER, Movement_MurderRetreat2
	end

StrangeSmellText:
    text "There is a"
    line "strange and"
    cont "putrid smell"
    cont "around here."
    done

DontLeaveText:
    text "Oh hello there."

    para "I don't often"
    line "have visitors."

    para "Oh don't mind"
    line "the smell."

    para "Would you like"
    line "a drink?"

    para "...."

    para "Please don't"
    line "leave!"
    done

HiFriendText:
	text "Oh it's you, are"
	line "you doing well?"
	para "How about a drink?"
	para "If you have any"
	line "friends you could"
	cont "bring them around"
	cont "here sometime..."
	done

MurderGivesThunderboltText:
    text "What are you"
    line "doing!?"

    para "Attacking me"
    line "in my own home!"

    para "Here, look, I"
    line "will forget this"
    cont "ever happened."

    para "Consider this a"
    line "gift."

    para "It is very"
    line "reliable and if"
    cont "you're lucky can"
    cont "paralyse your"
    cont "prey."

    para "Good luck."
    done

MurdererStaySafeText:
    text "Stay safe out"
    line "there."

    para "Heh heh heh."
    done

MurdererLossText:
    text "I was only"
    line "playing about."
    done

MurdererWinText:
    text "I'm going to"
    line "need more room"
    cont "in the basement."
    done

Movement_MurderAssault1:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    step_end

Movement_MurderRetreat1:
    big_step UP
    big_step UP
    big_step UP
    turn_head RIGHT
    step_end

Movement_MurderAssault2:
    big_step DOWN
    big_step DOWN
    big_step RIGHT
    big_step DOWN
    step_end

Movement_MurderRetreat2:
    big_step UP
    big_step LEFT
    big_step UP
    big_step UP
    turn_head RIGHT
    step_end

LakeOfRageHiddenPowerHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAKE_OF_RAGE, 1
	warp_event  3,  7, LAKE_OF_RAGE, 1

	def_coord_events
	coord_event 2, 7, SCENE_ALWAYS, MurderScript1
	coord_event 3, 7, SCENE_ALWAYS, MurderScript2

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, HiddenPowerHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, HiddenPowerHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HiddenPowerGuy, -1

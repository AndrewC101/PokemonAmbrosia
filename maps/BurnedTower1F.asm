	object_const_def
	const BURNEDTOWER1F_ROCK
	const BURNEDTOWER1F_EUSINE
	const BURNEDTOWER1F_SILVER
	const BURNEDTOWER1F_MORTY
	const BURNEDTOWER1F_POKE_BALL

BurnedTower1F_MapScripts:
	def_scene_scripts
	scene_script .EusineScene ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	scene_script .DummyScene2 ; SCENE_BURNEDTOWER1F_NOTHING

	def_callbacks
	callback MAPCALLBACK_TILES, .HoleAndLadder

.EusineScene:
	sdefer .MeetEusine
	end

.DummyScene1:
	end

.DummyScene2:
	end

.HoleAndLadder:
	checkevent EVENT_HOLE_IN_BURNED_TOWER
	iftrue .KeepHoleOpen
	changeblock 10, 8, $32 ; floor
.KeepHoleOpen:
	checkevent EVENT_RELEASED_THE_BEASTS
	iftrue .HideBasement
	changeblock 6, 14, $09 ; ladder
.HideBasement:
	endcallback

.MeetEusine:
	turnobject BURNEDTOWER1F_EUSINE, DOWN
	showemote EMOTE_SHOCK, BURNEDTOWER1F_EUSINE, 15
	applymovement BURNEDTOWER1F_EUSINE, BurnedTower1FEusineMovement
	opentext
	writetext BurnedTower1FEusineIntroText
	waitbutton
	closetext
	moveobject BURNEDTOWER1F_EUSINE, 9, 14
	setscene SCENE_BURNEDTOWER1F_RIVAL_BATTLE
	end

BurnedTowerRivalBattleScript:
	showemote EMOTE_SHOCK, BURNEDTOWER1F_SILVER, 15
	special FadeOutMusic
	pause 15
	turnobject BURNEDTOWER1F_SILVER, RIGHT
	pause 15
	applymovement PLAYER, BurnedTowerMovement_PlayerWalksToSilver
	applymovement BURNEDTOWER1F_SILVER, BurnedTowerMovement_SilverWalksToPlayer
	playmusic MUSIC_RIVAL_ENCOUNTER
	opentext
	writetext BurnedTowerSilver_BeforeText
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .totodile
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .chikorita
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	setlasttalked BURNEDTOWER1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_TOTODILE
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .returnfrombattle

.totodile
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	setlasttalked BURNEDTOWER1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CHIKORITA
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .returnfrombattle

.chikorita
	winlosstext BurnedTowerSilver_WinText, BurnedTowerSilver_LossText
	setlasttalked BURNEDTOWER1F_SILVER
	loadtrainer RIVAL1, RIVAL1_3_CYNDAQUIL
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	sjump .returnfrombattle

.returnfrombattle
	playmusic MUSIC_RIVAL_AFTER
	opentext
	writetext BurnedTowerSilver_AfterText1
	waitbutton
	closetext
	setscene SCENE_BURNEDTOWER1F_NOTHING
	setevent EVENT_RIVAL_BURNED_TOWER
	special FadeOutMusic
	pause 15
	earthquake 50
	showemote EMOTE_SHOCK, PLAYER, 15
	playsound SFX_ENTER_DOOR
	waitsfx
	changeblock 10, 8, $25 ; hole
	reloadmappart
	pause 15
	applymovement PLAYER, BurnedTower1FMovement_PlayerStartsToFall
	playsound SFX_KINESIS
	showemote EMOTE_SHOCK, BURNEDTOWER1F_SILVER, 20
	opentext
	writetext BurnedTowerSilver_AfterText2
	waitbutton
	closetext
	setevent EVENT_HOLE_IN_BURNED_TOWER
	pause 15
	warpcheck
	end

BurnedTower1FEusineScript:
	jumptextfaceplayer BurnedTower1FEusineText

BurnedTower1FMortyScript:
	jumptextfaceplayer BurnedTower1FMortyText

BurnedTower1FRock:
	jumpstd SmashRockScript

BurnedTower1FHiddenEther:
	hiddenitem ETHER, EVENT_BURNED_TOWER_1F_HIDDEN_ETHER

BurnedTower1FHiddenUltraBall:
	hiddenitem ULTRA_BALL, EVENT_BURNED_TOWER_1F_HIDDEN_ULTRA_BALL

BurnedTower1FHPUp:
	itemball HP_UP

BurnedTowerMovement_PlayerWalksToSilver:
	step LEFT
	step_end

BurnedTowerMovement_SilverWalksToPlayer:
	step RIGHT
	step_end

BurnedTower1FMovement_PlayerStartsToFall:
	skyfall_top
	step_end

BurnedTower1FEusineMovement:
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step DOWN
	step_end

BurnedTowerSilver_BeforeText:
    text "They say a"
    line "legendary"
    cont "#mon used"
    cont "to dwell here."

    para "Well if it did"
    line "it's long gone"
    cont "now."

    para "Legendary"
    line "#mon are the"
    cont "strongest of"
    cont "all #mon."

    para "I will catch one"
    line "someday!"

    para "Then I will"
    line "stand above all"
    cont "trainers."

    para "Especially you."
	done

BurnedTowerSilver_WinText:
	text "Don't get ahead"
	line "of yourself."

	para "This is nothing."
	done

BurnedTowerSilver_LossText:
	text "Seems I don't"
	line "need legendary"
	cont "#mon to win!"
	done

BurnedTowerSilver_AfterText1:
	text "There is no"
	line "point you looking"
	cont "around here."

	para "I've already"
	line "explored all"
	cont "over here."

	para "Besides even if"
	line "you found a"
	cont "legendary"
	cont "#mon you"
	cont "would never be"
	cont "able to catch it"

	para "Now get lost!"
	done

BurnedTowerSilver_AfterText2:
	text "Humph!"

	para "I didn't mean"
	line "you to take that"
	cont "literally."

	para "Let me know if"
	line "you find a"
	cont "legendary"
	cont "#mon down"
	cont "there!"

	para "Heh heh heh..."
	done

BurnedTower1FEusineIntroText:
	text "Have you seen"
	line "Suicune!"

	para "When I was a"
	line "child I would"
	cont "draw pictures"
	cont "of Suicune."

	para "It is my"
	line "destiny to"
	cont "catch Suicune."

	para "Only through"
	line "Suicune shall I"
	cont "find true joy."

	para "I am Eusine"
	line "by the way."
	done

BurnedTower1FEusineText:
	text "I know Suicune"
	line "is in this tower"
	cont "somewhere."

	para "I can feel it"
	line "all over."
	done

BurnedTower1FMortyText:
	text "This guy Eusine"
	line "is a very..."

	para "Dedicated fellow."

	para "He convinced me"
	line "to investigate"
	cont "this place for"
	cont "legendary"
	cont "#mon."

	para "He is rather..."

	para "Eager to find"
	line "them."
	done

BurnedTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9, 15, ECRUTEAK_CITY, 13
	warp_event 10, 15, ECRUTEAK_CITY, 13
	warp_event 10,  9, BURNED_TOWER_B1F, 1
	warp_event  5,  5, BURNED_TOWER_B1F, 1 ; inaccessible, left over from G/S
	warp_event  5,  6, BURNED_TOWER_B1F, 1 ; inaccessible, left over from G/S
	warp_event  4,  6, BURNED_TOWER_B1F, 1 ; inaccessible, left over from G/S
	warp_event 15,  4, BURNED_TOWER_B1F, 2 ; inaccessible, left over from G/S
	warp_event 15,  5, BURNED_TOWER_B1F, 2 ; inaccessible, left over from G/S
	warp_event 10,  7, BURNED_TOWER_B1F, 3 ; inaccessible, left over from G/S
	warp_event  5, 14, BURNED_TOWER_B1F, 4 ; inaccessible, left over from G/S
	warp_event  4, 14, BURNED_TOWER_B1F, 4 ; inaccessible, left over from G/S
	warp_event 14, 14, BURNED_TOWER_B1F, 5 ; inaccessible, left over from G/S
	warp_event 15, 14, BURNED_TOWER_B1F, 5 ; inaccessible, left over from G/S
	warp_event  7, 15, BURNED_TOWER_B1F, 6 ; inaccessible, left over from G/S

	def_coord_events
	coord_event 11,  9, SCENE_BURNEDTOWER1F_RIVAL_BATTLE, BurnedTowerRivalBattleScript

	def_bg_events
	bg_event  8,  7, BGEVENT_ITEM, BurnedTower1FHiddenEther
	bg_event 13, 11, BGEVENT_ITEM, BurnedTower1FHiddenUltraBall

	def_object_events
	object_event 15,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BurnedTower1FRock, -1
	object_event 12, 12, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BurnedTower1FEusineScript, EVENT_BURNED_TOWER_1F_EUSINE
	object_event  8,  9, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, ObjectEvent, EVENT_RIVAL_BURNED_TOWER
	object_event 14, 14, SPRITE_MORTY, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BurnedTower1FMortyScript, EVENT_BURNED_TOWER_MORTY
	object_event 14,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BurnedTower1FHPUp, EVENT_BURNED_TOWER_1F_HP_UP

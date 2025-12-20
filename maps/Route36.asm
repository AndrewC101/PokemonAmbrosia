	object_const_def
	const ROUTE36_YOUNGSTER1
	const ROUTE36_YOUNGSTER2
	const ROUTE36_WEIRD_TREE
	const ROUTE36_LASS1
	const ROUTE36_FISHER
	const ROUTE36_FRUIT_TREE
	const ROUTE36_ARTHUR
	const ROUTE36_FLORIA
	const ROUTE36_SUICUNE
	const ROUTE36_FIELDMON_1
    const ROUTE36_FIELDMON_2
    const ROUTE36_FIELDMON_3
    const ROUTE36_FIELDMON_4
    const ROUTE36_FIELDMON_5
    const ROUTE36_FIELDMON_6
    const ROUTE36_CRYSTAL

Route36_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_ROUTE36_NOTHING
	scene_script .DummyScene1 ; SCENE_ROUTE36_SUICUNE

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .ArthurCallback

.DummyScene0:
	end

.DummyScene1:
	end

.ArthurCallback:
; Pokemon which always appear
    appear ROUTE36_FIELDMON_6
    disappear ROUTE36_CRYSTAL

    random 5
    ifequal 1, .spawnShiny
    disappear ROUTE36_FIELDMON_3
    sjump .mon4
.spawnShiny
    appear ROUTE36_FIELDMON_3

.mon4
    random 2
    ifequal 1, .spawn4
    disappear ROUTE36_FIELDMON_4
    sjump .mon5
.spawn4
    appear ROUTE36_FIELDMON_4

.mon5
    random 2
    ifequal 1, .spawn5
    disappear ROUTE36_FIELDMON_5
    sjump .checkNight
.spawn5
    appear ROUTE36_FIELDMON_5

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .arthur

    appear ROUTE36_FIELDMON_1
    appear ROUTE36_FIELDMON_2

.arthur
	readvar VAR_WEEKDAY
	ifequal THURSDAY, .ArthurAppears
	disappear ROUTE36_ARTHUR
	endcallback

.ArthurAppears:
	appear ROUTE36_ARTHUR
	endcallback

Route36SuicuneScript:
	showemote EMOTE_SHOCK, PLAYER, 15
	pause 15
	playsound SFX_WARP_FROM
	;turnobject PLAYER, UP
	applymovement ROUTE36_SUICUNE, Route36SuicuneMovement
	disappear ROUTE36_SUICUNE
	turnobject PLAYER, DOWN
	pause 10
	setscene SCENE_ROUTE36_NOTHING
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setmapscene CIANWOOD_CITY, SCENE_CIANWOODCITY_SUICUNE_AND_EUSINE
	end

SudowoodoScript:
	checkitem SQUIRTBOTTLE
	iftrue .Fight

	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	end

.Fight:
	opentext
	writetext UseSquirtbottleText
	yesorno
	iffalse DidntUseSquirtbottleScript
	closetext
WateredWeirdTreeScript:: ; export (for when you use Squirtbottle from pack)
	opentext
	writetext UsedSquirtbottleText
	waitbutton
	closetext
	waitsfx
	playsound SFX_SANDSTORM
	applymovement ROUTE36_WEIRD_TREE, SudowoodoShakeMovement
	opentext
	writetext SudowoodoAttackedText
	waitbutton
	closetext
	loadwildmon MIMIKYU, 30
	startbattle
	setevent EVENT_FOUGHT_SPIRITOMB
	ifequal DRAW, DidntCatchSudowoodo
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	reloadmapafterbattle
	end

DidntUseSquirtbottleScript:
	closetext
	end

DidntCatchSudowoodo:
	reloadmapafterbattle
	applymovement ROUTE36_WEIRD_TREE, WeirdTreeMovement_Flee
	disappear ROUTE36_WEIRD_TREE
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special LoadUsedSpritesGFX
	special RefreshSprites
	end

Route36FloriaScript:
	faceplayer
	opentext
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iftrue .SecondTimeTalking
	setevent EVENT_MET_FLORIA
	writetext FloriaText1
	waitbutton
	closetext
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	readvar VAR_FACING
	ifequal UP, .Up
	applymovement ROUTE36_FLORIA, FloriaMovement1
	disappear ROUTE36_FLORIA
	end

.Up:
	applymovement ROUTE36_FLORIA, FloriaMovement2
	disappear ROUTE36_FLORIA
	end

.SecondTimeTalking:
	writetext FloriaText2
	waitbutton
	closetext
	end

Route36RockSmashGuyScript:
	faceplayer
	opentext
	checkevent EVENT_FOUGHT_SPIRITOMB
	iftrue .ClearedSpiritomb
	writetext RockSmashGuyText1
	waitbutton
	closetext
	end
.ClearedSpiritomb:
	writetext RockSmashGuyText2
	waitbutton
	closetext
	end

Route36LassScript:
    jumptextfaceplayer Route36LassText

TrainerSchoolboyAlan1:
	trainer SCHOOLBOY, ALAN1, EVENT_BEAT_SCHOOLBOY_ALAN, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	opentext
	checkflag ENGINE_ALAN_READY_FOR_REMATCH
	iftrue .ChooseRematch
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .GiveFireStone
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue .NumberAccepted
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgainForPhoneNumber
	writetext SchoolboyAlanBooksText
	promptbutton
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .ContinueAskForPhoneNumber

.AskAgainForPhoneNumber:
	scall .AskNumber2
.ContinueAskForPhoneNumber:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	scall .RegisteredNumber
	writetext AlanNumberAcceptedText
	waitbutton
	closetext
	end

.ChooseRematch:
	scall .Rematch
	winlosstext SchoolboyAlan1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_BEAT_PRYCE
	iftrue .LoadFight2
	checkevent EVENT_BEAT_MORTY
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_ALAN_READY_FOR_REMATCH
	end

.GiveFireStone:
	scall .Gift
	verbosegiveitem FIRE_STONE
	iffalse .BagFull
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

.AskNumber1:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	writetext AlanNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext AlanRematchText
	waitbutton
	yesorno
	iftrue .ChooseRematch
	writetext AlanRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.Rematch:
	jumpstd RematchMScript
	end

.Gift:
	jumpstd GiftMScript
	end

.PackFull:
	jumpstd PackFullMScript
	end

AlanNumberAcceptedText:
	text "Great, we shall"
	line "study together."

	para "I'll call you if I"
	line "find something to"
	cont "help your study."

	para "Then we will be"
	line "assured high"
	cont "salary jobs!"
	done

AlanRematchText:
    text "How about a"
    line "rematch?"
    done

AlanRematchRefuseText:
    text "Only through me"
    line "you can increase"
    cont "your salary."
    done

TrainerPsychicMark:
	trainer PSYCHIC_T, MARK, EVENT_BEAT_PSYCHIC_MARK, PsychicMarkSeenText, PsychicMarkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicMarkAfterBattleText
	waitbutton
	closetext
	end

ArthurScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue .AlreadyGotStone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	promptbutton
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur:
	writetext ArthurGivesGiftText
	promptbutton
	verbosegiveitem HARD_STONE
	iffalse .BagFull
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	waitbutton
	closetext
	end

.AlreadyGotStone:
	writetext ArthurThursdayText
	waitbutton
.BagFull:
	closetext
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	waitbutton
	closetext
	end

Route36Sign:
	jumptext Route36SignText

RuinsOfAlphNorthSign:
	jumptext RuinsOfAlphNorthSignText

Route36TrainerTips1:
	jumptext Route36TrainerTips1Text

Route36TrainerTips2:
	jumptext Route36TrainerTips2Text

Route36FruitTree:
	fruittree FRUITTREE_ROUTE_36

SudowoodoShakeMovement:
	turn_head LEFT
	turn_head RIGHT
	turn_head LEFT
	turn_head RIGHT
	turn_head DOWN
	step_end

WeirdTreeMovement_Flee:
	fast_jump_step UP
	fast_jump_step UP
	step_end

FloriaMovement1:
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

FloriaMovement2:
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

Route36SuicuneMovement:
	set_sliding
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step DOWN
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	fast_jump_step RIGHT
	remove_sliding
	step_end

UseSquirtbottleText:
	text "It's a strange"
	line "old man."

	para "Use Holy Water?"
	done

UsedSquirtbottleText:
	text "<PLAYER> used the"
	line "Holy Water."
	done

SudowoodoAttackedText:
	text "The disguise is"
	line "broken!"

	para "The old man is"
	line "revealed as an"
	cont "evil spirit."

	para "The spirit"
	line "attacks!"
	done

FloriaText1:
	text "Hold on!"

	para "That old man up"
	line "ahead..."

	para "I'm convinced he"
	line "is not a man at"
	cont "all but a"
	cont "#mon."

	para "An evil"
	line "#mon!"

	para "I'm going to"
	line "get my sister at"
	cont "the Goldenrod"
	cont "Flower Shop."

	para "She has some"
	line "Holy Water."

	para "That should move"
	line "that #mon."
	done

FloriaText2:
	text "My sister told"
	line "me the #mon"
	cont "disguised as an"
	cont "old man is too"
	cont "dangerous."

	para "She will only"
	line "give the Holy"
	cont "Water to a"
	cont "trainer that"
	cont "has proved their"
	cont "strength by"
	cont "beating Whitney."
	done

RockSmashGuyText1:
	text "That old man"
	line "won't budge."

	para "He won't even"
	line "talk to me."

	para "There is something"
	line "about him that"
	cont "makes me uneasy."
	done

RockSmashGuyText2:
	text "That old man"
	line "was actually an"
	cont "evil spirit!"

	para "And that evil"
	line "spirit was"
	cont "actually a"
	cont "#mon!"
	done

Route36LassText:
	text "I went into one of"
	line "those puzzle"
	cont "chambers and used"
	cont "my Escape Pod to"
	cont "leave and then I"
	cont "heard all these"
	cont "spooky noises"
	cont "coming from the"
	cont "chamber!"
	done

PsychicMarkSeenText:
	text "There is a"
	line "haunted forest"
	cont "ahead."

	para "I tried to"
	line "get through it"
	cont "but my #mon"
	cont "were too scared."
	done

PsychicMarkBeatenText:
	text "Your #mon"
	line "are brave."
	done

PsychicMarkAfterBattleText:
	text "Fear is the"
	line "mind killer."

	para "Psychic #mon"
	line "are weak to"
	cont "common fears"
	cont "Dark, Bug and"
	cont "Ghost."
	done

SchoolboyAlan1SeenText:
	text "I am not scared"
	line "of the haunted"
	cont "forest."

	para "I have used my"
	line "studies to make"
	cont "a strong team."
	done

SchoolboyAlan1BeatenText:
	text "I misclicked."
	done

SchoolboyAlanBooksText:
	text "My studies have"
	line "failed me!"

	para "I must use"
	line "generative AI"
	cont "to aid my"
	cont "progress."
	done

MeetArthurText:
	text "Arthur: Who are"
	line "you?"

	para "I'm Arthur of"
	line "Thursday."
	done

ArthurGivesGiftText:
	text "Here. You can have"
	line "this."
	done

ArthurGaveGiftText:
	text "Arthur: A #mon"
	line "that uses rock-"
	cont "type moves should"
	cont "hold on to that."

	para "It pumps up rock-"
	line "type attacks."
	done

ArthurThursdayText:
	text "Arthur: I'm Arthur"
	line "of Thursday. I'm"
	cont "the second son out"
	cont "of seven children."
	done

ArthurNotThursdayText:
	text "Arthur: Today's"
	line "not Thursday. How"
	cont "disappointing."
	done

Route36SignText:
	text "Route 36"
	done

RuinsOfAlphNorthSignText:
	text "Ruins of Alph"
	line "North entrance"
	done

Route36TrainerTips1Text:
	text "Trainer Tips"

	para "On the #dex"
	line "you can press"
	cont "Select to see"
	cont "the SHINY colour"
	cont "of a #mon."
	done

Route36TrainerTips2Text:
	text "Trainer Tips"

	para "When obtaining a"
	line "new Badge your"
	cont "level caps"
	cont "increase."

	para "It can be good"
	line "to revisit areas"
	cont "to find #mon"
	cont "you are now"
	cont "able to catch."
	done
	
Route36FieldMon1Script:
	trainer CROBAT, FIELD_MON, EVENT_FIELD_MON_1, Route36PokemonAttacksText, 36, 0, .script
.script
    disappear ROUTE36_FIELDMON_1
    end

Route36FieldMon2Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_2, Route36PokemonAttacksText, 37, 0, .script
.script
    disappear ROUTE36_FIELDMON_2
    end

Route36PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route36FieldMon3Script:
	faceplayer
	cry ZUBAT
	pause 15
	loadwildmon ZUBAT, 15
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE36_FIELDMON_3
	end

Route36FieldMon4Script:
	faceplayer
	cry NIDOQUEEN
	pause 15
	loadwildmon NIDOQUEEN, 25
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE36_FIELDMON_4
	end

Route36FieldMon5Script:
	faceplayer
	cry NIDOKING
	pause 15
	loadwildmon NIDOKING, 25
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE36_FIELDMON_5
	end

Route36FieldMon6Script:
	faceplayer
	cry AZUMARILL
	pause 15
	loadwildmon AZUMARILL, 26
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE36_FIELDMON_6
	end

Route36CrystalScript:
    checkevent EVENT_BEAT_MORTY
    iftrue .end
    showemote EMOTE_SHOCK, PLAYER, 15
    playmusic MUSIC_DANCING_HALL
    appear ROUTE36_CRYSTAL
    applymovement ROUTE36_CRYSTAL, Route36Movement_CrystalApproaches
    turnobject PLAYER, LEFT

    opentext
    writetext Route36CrystalText_Intro
    waitbutton
    closetext

	winlosstext Crystal3LosesText, Crystal3WinsText
	loadtrainer CRYSTAL, CRYSTAL_3
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CRYSTAL_3
	setmapscene ROUTE_36, SCENE_CUSTOM_1

	opentext
	writetext Route36CrystalText_KeepItUp
	waitbutton
	closetext
	applymovement ROUTE36_CRYSTAL, Route36Movement_CrystalLeaves
	disappear ROUTE36_CRYSTAL
.end
	end

Route36Movement_CrystalApproaches:
    big_step RIGHT
    big_step RIGHT
    big_step DOWN
    big_step RIGHT
    big_step RIGHT
    step_end

Route36CrystalText_Intro:
    text "You cleared that"
    line "Ghost #mon!"

    para "Thank you!"

    para "I thought I was"
    line "stuck here."

    para "I'll tell you a"
    line "secret."

    para "I'm actually a bit"
    line "afraid of Ghost"
    cont "#mon."

    para "I think when I"
    line "was little I got"
    cont "burned by a"
    cont "Litwick."

    para "I still have a"
    line "scar on my arm."
    cont "See..."

    para "But I am working"
    line "to face my fears."

    para "I'm getting much"
    line "stronger."

    para "I beat Whitney"
    line "and she was tough."

    para "Have you got"
    line "stronger too?"
    done

Crystal3LosesText:
    text "You have got"
    line "stronger."
    done

Crystal3WinsText:
    text "You have got"
    line "stronger."
    done

Route36CrystalText_KeepItUp:
    text "Well done!"

    para "We are both"
    line "getting stronger."

    para "Up ahead is a"
    line "haunted forest"
    cont "and I haven't"
    cont "worked up the"
    cont "courage to go"
    cont "in yet."

    para "But I'm feeling"
    line "much more"
    cont "confident after"
    cont "our battle."

    para "Thank you."

    para "I'm going in!"

    para "Get out of my"
    line "way, Ghosts!"

    para "See you later"
    line "<PLAYER>."
    done

Route36Movement_CrystalLeaves:
    big_step LEFT
    big_step LEFT
    big_step UP
    big_step LEFT
    big_step LEFT
    step_end

Route36_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  6,  8, ROUTE_36_NATIONAL_PARK_GATE, 3
	warp_event  6,  9, ROUTE_36_NATIONAL_PARK_GATE, 4
	warp_event 47, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 1
	warp_event 48, 13, ROUTE_36_RUINS_OF_ALPH_GATE, 2
	warp_event 30, 0, ROUTE_37, 3
	warp_event 31, 0, ROUTE_37, 4

	def_coord_events
	coord_event 20,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 22,  7, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 20,  6, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 22,  6, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 20,  5, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
    coord_event 21,  5, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 22,  5, SCENE_ROUTE36_SUICUNE, Route36SuicuneScript
	coord_event 35,  9, SCENE_DEFAULT, Route36CrystalScript

	def_bg_events
	bg_event 29,  3, BGEVENT_READ, Route36TrainerTips2
	bg_event 45, 11, BGEVENT_READ, RuinsOfAlphNorthSign
	bg_event 55,  7, BGEVENT_READ, Route36Sign
	bg_event 21,  7, BGEVENT_READ, Route36TrainerTips1

	def_object_events
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicMark, -1
	object_event 31, 14, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 5, TrainerSchoolboyAlan1, -1
	object_event 35,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_SUDOWOODO, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SudowoodoScript, EVENT_ROUTE_36_SUDOWOODO
	object_event 51,  8, SPRITE_LASS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36LassScript, -1
	object_event 44,  9, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36RockSmashGuyScript, -1
	object_event 21,  4, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route36FruitTree, -1
	object_event 46,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	object_event 33, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FloriaScript, EVENT_FLORIA_AT_SUDOWOODO
	object_event 21,  6, SPRITE_SUICUNE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
	
	object_event 10,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route36FieldMon1Script, EVENT_FIELD_MON_1
	object_event 17,  3, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route36FieldMon2Script, EVENT_FIELD_MON_2
	object_event 48,  5, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route36FieldMon3Script, EVENT_FIELD_MON_3
	object_event 29,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FieldMon4Script, EVENT_FIELD_MON_4
	object_event 28,  2, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route36FieldMon5Script, EVENT_FIELD_MON_5
	object_event 16, 14, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route36FieldMon6Script, EVENT_FIELD_MON_6

	object_event 30,  8, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1

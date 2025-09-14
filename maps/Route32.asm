	object_const_def
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_INVADER
	const ROUTE32_FRIEDA
    const ROUTE32_FIELDMON_1
	const ROUTE32_FIELDMON_2
	const ROUTE32_FIELDMON_3
	const ROUTE32_FIELDMON_4
	const ROUTE32_FIELDMON_5
	const ROUTE32_FIELDMON_6
	const ROUTE32_FIELDMON_7
	const ROUTE32_FIELDMON_8
	const ROUTE32_CRYSTAL

Route32_MapScripts:
	def_scene_scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script .DummyScene2 ; SCENE_ROUTE32_NOTHING

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Frieda

.DummyScene0:
	end

.DummyScene1:
	end

.DummyScene2:
	end

.Frieda:
    appear ROUTE32_FIELDMON_1
    appear ROUTE32_FIELDMON_2
    appear ROUTE32_FIELDMON_4
    appear ROUTE32_FIELDMON_5
    appear ROUTE32_FIELDMON_6
    appear ROUTE32_FIELDMON_7
    disappear ROUTE32_CRYSTAL

    random 5
    ifequal 1, .spawn8
    disappear ROUTE32_FIELDMON_8
    disappear ROUTE32_FIELDMON_3
    sjump .feieda
.spawn8
    appear ROUTE32_FIELDMON_8
    appear ROUTE32_FIELDMON_3

.feieda
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

TrainerCamperRoland:
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRalphAfterText
	waitbutton
	closetext
	end

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	writetext LizNumberAcceptedText
	waitbutton
	closetext
	end

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	writetext LizNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext LizRematchText
	waitbutton
	nooryes
	iftrue .Rematch
	writetext LizRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end

LizNumberAcceptedText:
	text "Really!?"
	para "Thank you!"
	para "I'll keep in"
	line "touch."
	done

LizRematchText:
    text "How about a"
    line "rematch?"
    done

LizRematchRefuseText:
    text "You'll call me,"
    line "won't you?"
    done

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, YoungsterGordonWinsText, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

InvaderSiegmeyer:
	trainer INVADER, SIEGMEYER, EVENT_BEAT_BIRD_KEEPER_PETER, InvaderSiegmeyerSeenText, InvaderSiegmeyerBeatenText, InvaderSiegmeyerVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderSiegmeyerAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokecenterSign:
	jumpstd PokecenterSignScript

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Wait my friend!"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, right?"

    para "There is a"
    line "scientific"
    cont "looking man at"
    cont "the Pokecenter"
    cont "who has something"
    cont "to give you."

    para "Hopefully it's"
    line "better than the"
    cont "paltry sum he"
    cont "payed me for"
    cont "stopping you."

    para "I feel like a"
    line "right DUNSPARCE."
	done


Route32CooltrainerMText_VioletGym:
	text "Listen, buddy."

	para "I had a dear"
	line "friend who went"
	cont "this way."

	para "He left and I"
	line "never saw him"
	cont "again."

	para "I am sure he was"
	line "attacked by a"
	cont "band of rabid"
	cont "MUDKIP!"

	para "If only he"
	line "had trained to"
	cont "beat FALKNER!"

	para "I will only let"
	line "those who have"
	cont "beaten FALKNER"
	cont "pass."
	done

Route32CooltrainerMText_HaveThisSeed:
	text "You have done it!"

	para "You have beaten"
	line "FALKNER."

	para "Take this!"

	para "It will protect"
	line "you from the"
	cont "MUDKIPS."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "If only my old"
	line "friend had not"
	cont "of been such a"
	cont "DUNSPARCE."

	para "He left one day"
	line "and never came"
	cont "back!"

	para "Damn those rapid"
	line "MUDKIP!"
	done

FisherJustinSeenText:
	text "Whoa!"

	para "Hey kid, you made"
	line "me lose that"
	cont "delicious"
	cont "MAGIKARP!"

	para "How will I"
	line "feed my family"
	cont "now!?"
	done

FisherJustinBeatenText:
	text "I'm off to"
	line "the chippy."
	done

FisherJustinAfterText:
	text "There are many"
	line "delicious"
	cont "#mon in the"
	cont "sea."

	para "I could fetch"
	line "a fortune for"
	cont "a FEEBAS."
	done

FisherRalph1SeenText:
	text "I'm so close."

	para "Once my #mon"
	line "evolve, I shall"
	cont "be the envy of"
	cont "all fishers!"
	done

FisherRalph1BeatenText:
	text "Just a little"
	line "more."
	done

FisherRalphAfterText:
	text "JUSTIN over there"
	line "will have a hard"
	cont "time eating my"
	cont "#mon once"
	cont "they evolve."
	done

FisherHenrySeenText:
	text "I have it on good"
	line "authority that you"
	cont "possess an"
	cont "affinity for"
	cont "MUDKIPs."
	para "I am something of"
	line "a MUDKIP fan"
	cont "myself."
	done

FisherHenryBeatenText:
	text "I need moar!"
	done

FisherHenryAfterText:
	text "No other Pokemon"
	line "is worth catching"
	cont "except MUDKIP!"
	para "Don't you agree?"
	done

YoungsterGordonSeenText:
	text "Be careful!"

	para "There is an"
	line "INVADER down"
	cont "there."

	para "He seems like"
	line "a bumbling fool"
	cont "but it must be"
	cont "a trick!"

	para "You're still"
	line "going."

	para "I'll have to"
	line "knock you out"
	cont "to stop you."
	done

YoungsterGordonBeatenText:
	text "Darn. I thought I"
	line "could win."
	done

YoungsterGordonWinsText:
	text "I guess it's"
	line "not that bad"
	cont "after all!"
	done

YoungsterGordonAfterText:
	text "He must be"
	line "looking for"
	cont "strong gear"
	cont "at the"
	cont "RUINS OF ALPH."
	done

CamperRolandSeenText:
	text "I found a"
	line "secret chamber"
	cont "in the RUINS."

	para "With secret"
	line "#mon."

	para "But there must"
	line "be some mistake."

	para "A secret"
	line "#mon can't"
	cont "be this weak!"

	para "I must be"
	line "missing"
	cont "something."
	done

CamperRolandBeatenText:
	text "Hmmm. This is"
	line "disappointing."
	done

CamperRolandAfterText:
	text "Do these things"
	line "evolve!?"

	para "What kind of"
	line "joke is this!?"
	done

PicnickerLiz1SeenText:
	text "I only wanted"
	line "to visit the"
	cont "RUINS OF ALPH."

	para "But I took a"
	line "wrong turn and"
	cont "now I'm hiding"
	cont "from that crazy"
	cont "flying death"
	cont "machine!"

	para "If I beat you"
	line "maybe it will"
	cont "stop targeting me."
	done

PicnickerLiz1BeatenText:
	text "I'm doomed."
	done

PicnickerLiz1AfterText:
	text "This would be a"
	line "nice place for"
	cont "a picnic or a"
	cont "date."

	para "You know, if it"
	line "wasn't for the"
	cont "flying death"
	cont "machines..."
	done

InvaderSiegmeyerSeenText:
	text "Hmmmmm"

	para "......."

	para "I knew you would"
	line "come my way."

	para "This armour"
	line "gives me"
	cont "unbreakable"
	cont "poise."

	para "Have at me!"

	para "I can"
	line "withstand"
	cont "and counter."
	done

InvaderSiegmeyerBeatenText:
	text "I just couldn't"
	line "land a hit."
	done

InvaderSiegmeyerVictoryText:
	text "Good Game"
	line "my friend!"
	done

InvaderSiegmeyerAfterText:
	text "You done well"
	line "hohohoho!"

	para "You would make"
	line "a fine knight."
	done

MeetFriedaText:
	text "FRIEDA: TGIF!"

	para "It's Friday!"

	para "We don't work"
	line "four day weeks"
	cont "over here."

	para "I'm FRIEDA of"
	line "Friday!"

	para "Nice to meet you!"
	done

FriedaGivesGiftText:
	text "Here, take this."

	para "It will help"
	line "you through the"
	cont "9 to 5."
	done

FriedaGaveGiftText:
	text "FRIEDA: Give it to"
	line "a #mon that has"
	cont "poison-type moves."

	para "Oh!"

	para "It's wicked!"

	para "You'll be shocked"
	line "how good it makes"
	cont "poison moves!"
	done

FriedaFridayText:
	text "FRIEDA: Hiya! What"
	line "day do you like?"

	para "I love Friday."

	para "It means the"
	line "weekend is"
	cont "here!"

	para "You know, unless"
	line "you're lazy and"
	cont "have a four day"
	cont "week."
	done

FriedaNotFridayText:
	text "FRIEDA: Isn't it"
	line "Friday today?"

	para "It's so awful"
	line "when it's not!"
	done

Route32SignText:
	text "ROUTE 32"

	para "VIOLET CITY -"
	line "AZALEA TOWN"
	done

Route32RuinsSignText:
	text "RUINS OF ALPH"
	line "EAST ENTRANCE"
	done

Route32UnionCaveSignText:
	text "UNION CAVE"
	line "AHEAD"
	done
	
Route32FieldMon1Script:
	trainer SIGILYPH, FIELD_MON, EVENT_FIELD_MON_1, Route32PokemonAttacksText, 24, 0, .script
.script
    disappear ROUTE32_FIELDMON_1
    end

Route32FieldMon2Script:
	trainer MUDKIP, FIELD_MON, EVENT_FIELD_MON_2, Route32PokemonAttacksText, 15, 0, .script
.script
    disappear ROUTE32_FIELDMON_2
    end
    
Route32FieldMon3Script:
	trainer MARSHTOMP, FIELD_MON, EVENT_FIELD_MON_3, Route32PokemonAttacksText, 30, 0, .script
.script
    disappear ROUTE32_FIELDMON_3
    end
    
Route32PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done
	
Route32FieldMon4Script:
	faceplayer
	cry HORSEA
	pause 15
	loadwildmon HORSEA, 14
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE32_FIELDMON_4
	end

Route32FieldMon5Script:
	faceplayer
	cry CHINCHOU
	pause 15
	loadwildmon CHINCHOU, 14
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear ROUTE32_FIELDMON_5
	end

Route32FieldMon6Script:
	faceplayer
	cry MUDKIP
	pause 15
	loadwildmon MUDKIP, 15
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear ROUTE32_FIELDMON_6
	end
	
Route32FieldMon7Script:
	faceplayer
	cry RIOLU
	pause 15
	loadwildmon RIOLU, 15
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_7
	disappear ROUTE32_FIELDMON_7
	end

Route32FieldMon8Script:
	faceplayer
	cry MUDKIP
	pause 15
	loadwildmon MUDKIP, 14
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_8
	disappear ROUTE32_FIELDMON_8
	end

Route32CrystalScript:
    showemote EMOTE_SHOCK, PLAYER, 15
    playmusic MUSIC_DANCING_HALL
    opentext
    writetext Route32CrystalText_WaitUp
    waitbutton
    closetext
    appear ROUTE32_CRYSTAL
    applymovement PLAYER, Route32Movement_PlayerUp
    applymovement ROUTE32_CRYSTAL, Route32Movement_CrystalApproaches

    opentext
    writetext Route32CrystalText_GotBadge
    waitbutton
    closetext
    showemote EMOTE_SHOCK, ROUTE32_CRYSTAL, 15
    opentext
    writetext Route32CrystalText_YouToo
    waitbutton
    closetext

	winlosstext Crystal2LosesText, Crystal2WinsText
	loadtrainer CRYSTAL, CRYSTAL_2
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CRYSTAL_2
	setmapscene ROUTE_32, SCENE_FINISHED

	opentext
	writetext Route32CrystalText_KeepItUp
	waitbutton
	closetext
	applymovement ROUTE32_CRYSTAL, Route32Movement_CrystalLeaves
	disappear ROUTE32_CRYSTAL
	turnobject PLAYER, DOWN
.end
	end

Route32CrystalText_WaitUp:
    text "Hey <PLAYER>"
    line "wait there!"
    done

Route32Movement_PlayerUp:
    step UP
    step UP
    step UP
    step_end

Route32Movement_CrystalApproaches:
    big_step DOWN
    big_step DOWN
    big_step RIGHT
    big_step DOWN
    step_end

Route32CrystalText_GotBadge:
    text "How have you been"
    line "doing?"

    para "I found something"
    line "unsettling about"
    cont "VIOLET."

    para "It has DARK CAVE"
    line "to the east,"
    cont "RUINS of ALPH"
    cont "to the west and"
    cont "there is a dark"
    cont "underground to"
    cont "the SPROUT TOWER."

    para "It's like it's"
    line "surrounded by"
    cont "evil and the"
    cont "people can't do"
    cont "anything about it."

    para "There was this one"
    line "guy with red"
    cont "hair who really"
    cont "seemed to hate"
    cont "everyone. Even his"
    cont "own #mon."

    para "Still I got the"
    line "badge from the"
    cont "GYM."

    para "Though it was"
    line "really tough!"

    para "I suppose you are"
    line "still trying to"
    cont "get it?"
    done

Route32CrystalText_YouToo:
    text "You already have"
    line "it!"

    para "And I thought I"
    line "had taken a lead"
    cont "in our race."

    para "You must have got"
    line "much stronger."

    para "I haven't had"
    line "much luck catching"
    cont "more #mon but"
    cont "the ones I have"
    cont "are pretty good!"

    para "Let me show you."
    done

Crystal2LosesText:
    text "We will get"
    line "much stronger."
    done

Crystal2WinsText:
    text "I didn't think"
    line "I'd actually win!"
    done

Route32CrystalText_KeepItUp:
    text "You are really"
    line "strong."

    para "Next time we"
    line "battle will be"
    cont "different!"

    para "I tried exploring"
    line "NORTH of NEW BARK"
    cont "town in the"
    cont "DARK CAVE. But it"
    cont "was too scary!"

    para "I'm sure there is"
    line "good stuff there."

    para "Watch out for"
    line "INVADERS!"

    para "They are bright"
    line "red and are really"
    cont "strong."

    para "Oh and don't go"
    line "to RUINS OF"
    cont "ALPH at night."

    para "There is a"
    line "scary guy there"
    cont "you don't want"
    cont "to mess with."

    para "So much danger"
    line "everywhere."

    para "You stay safe"
    line "until we meet"
    cont "again."

    para "Good luck!"
    done

Route32Movement_CrystalLeaves:
    big_step RIGHT
    big_step DOWN
    big_step DOWN
    big_step LEFT
    big_step DOWN
    big_step DOWN
    big_step DOWN
    big_step DOWN
    step_end

Route32_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	def_coord_events
	coord_event 18,  8, SCENE_DEFAULT, Route32CooltrainerMStopsYouScene
	coord_event 18,  9, SCENE_CUSTOM_1, Route32CrystalScript

	def_bg_events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	def_object_events
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, InvaderSiegmeyer, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY

	object_event  5, 14, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 5, Route32FieldMon1Script, EVENT_FIELD_MON_1
	object_event  3, 35, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route32FieldMon2Script, EVENT_FIELD_MON_2
	object_event  2, 69, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route32FieldMon3Script, EVENT_FIELD_MON_3
	object_event  8, 47, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route32FieldMon4Script, EVENT_FIELD_MON_4
	object_event 12, 43, SPRITE_MONSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route32FieldMon5Script, EVENT_FIELD_MON_5
	object_event 1, 50, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route32FieldMon6Script, EVENT_FIELD_MON_6
	object_event 3, 11, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route32FieldMon7Script, EVENT_FIELD_MON_7
	object_event 8,  74, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, Route32FieldMon8Script, EVENT_FIELD_MON_8

	object_event  17, 2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1


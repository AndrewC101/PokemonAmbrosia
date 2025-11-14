	object_const_def
	const ROUTE31_FISHER
	const ROUTE31_YOUNGSTER
	const ROUTE31_BUG_CATCHER
	const ROUTE31_COOLTRAINER_M
	const ROUTE31_FRUIT_TREE
	const ROUTE31_POKE_BALL1
	const ROUTE31_POKE_BALL2
    const ROUTE31_INVADER
	const ROUTE31_FIELDMON_1
	const ROUTE31_FIELDMON_2
	const ROUTE31_FIELDMON_3
	const ROUTE31_FIELDMON_4

Route31_MapScripts:
	def_scene_scripts

	def_callbacks
    callback MAPCALLBACK_OBJECTS, .Route31FieldMon
	callback MAPCALLBACK_NEWMAP, .CheckMomCall

.CheckMomCall:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iffalse .DoMomCall
	endcallback

.DoMomCall:
	specialphonecall SPECIALCALL_WORRIED
	endcallback
	
.Route31FieldMon:
; Pokemon which always appear
    appear ROUTE31_FIELDMON_1
    appear ROUTE31_FIELDMON_3
    appear ROUTE31_FIELDMON_4

.checkNight
; Pokemon that only appear at night
    checktime NITE
	iffalse .end

.mon3
    random 3
    ifequal 1, .spawn2
    disappear ROUTE31_FIELDMON_2
    sjump .end
.spawn2
    appear ROUTE31_FIELDMON_2

.end
    endcallback

TrainerBugCatcherWade1:
	trainer BUG_CATCHER, WADE1, EVENT_BEAT_BUG_CATCHER_WADE, BugCatcherWade1SeenText, BugCatcherWade1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_BUG_CATCHER_WADE
	opentext
	checkflag ENGINE_WADE_READY_FOR_REMATCH
	iftrue .WadeRematch
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .WadeItem
	checkcellnum PHONE_BUG_CATCHER_WADE
	iftrue .AcceptedNumberSTD
	checkevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext BugCatcherWade1AfterText
	waitbutton
	setevent EVENT_WADE_ASKED_FOR_PHONE_NUMBER
	scall .AskPhoneNumberSTD
	sjump .Continue

.AskAgain:
	scall .AskAgainSTD
.Continue:
	askforphonenumber PHONE_BUG_CATCHER_WADE
	ifequal PHONE_CONTACTS_FULL, .PhoneFullSTD
	ifequal PHONE_CONTACT_REFUSED, .DeclinedNumberSTD
	gettrainername STRING_BUFFER_3, BUG_CATCHER, WADE1
	scall .RegisterNumberSTD
	writetext WadeNumberAcceptedText
	waitbutton
	closetext
	end

.WadeRematch:
	scall .RematchSTD
	winlosstext BugCatcherWade1BeatenText, 0
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
	checkevent EVENT_BEAT_CHUCK
	iftrue .LoadFight2
	checkevent EVENT_BEAT_BUGSY
	iftrue .LoadFight1
	loadtrainer BUG_CATCHER, WADE1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer BUG_CATCHER, WADE2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer BUG_CATCHER, WADE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer BUG_CATCHER, WADE4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer BUG_CATCHER, WADE5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_WADE_READY_FOR_REMATCH
	end

.WadeItem:
	scall .ItemSTD
	checkevent EVENT_WADE_HAS_BERRY
	iftrue .Berry
	checkevent EVENT_WADE_HAS_PSNCUREBERRY
	iftrue .Psncureberry
	checkevent EVENT_WADE_HAS_PRZCUREBERRY
	iftrue .Przcureberry
	checkevent EVENT_WADE_HAS_BITTER_BERRY
	iftrue .BitterBerry
.Berry:
	verbosegiveitem BERRY
	iffalse .PackFull
	sjump .Done
.Psncureberry:
	verbosegiveitem PSNCUREBERRY
	iffalse .PackFull
	sjump .Done
.Przcureberry:
	verbosegiveitem PRZCUREBERRY
	iffalse .PackFull
	sjump .Done
.BitterBerry:
	verbosegiveitem BITTER_BERRY
	iffalse .PackFull
.Done:
	clearflag ENGINE_WADE_HAS_ITEM
	sjump .AcceptedNumberSTD
.PackFull:
	sjump .PackFullSTD

.AskPhoneNumberSTD:
	jumpstd AskNumber1MScript
	end

.AskAgainSTD:
	jumpstd AskNumber2MScript
	end

.RegisterNumberSTD:
	jumpstd RegisteredNumberMScript
	end

.AcceptedNumberSTD:
	writetext WadeNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext WadeRematchText
	waitbutton
	yesorno
	iftrue .WadeRematch
	writetext WadeRematchRefuseText
	waitbutton
	closetext
	end

.DeclinedNumberSTD:
	jumpstd NumberDeclinedMScript
	end

.PhoneFullSTD:
	jumpstd PhoneFullMScript
	end

.RematchSTD:
	jumpstd RematchMScript
	end

.ItemSTD:
	jumpstd GiftMScript
	end

.PackFullSTD:
	jumpstd PackFullMScript
	end

WadeNumberAcceptedText:
	text "You are a friend"
	line "to the colony."
	para "You will be"
	line "rewarded one day."
	done

WadeRematchText:
    text "How about a"
    line "rematch?"
    done

WadeRematchRefuseText:
    text "Hail the colony!"
    done

Route31MailRecipientScript:
    jumptextfaceplayer Text_Route31SleepyMan

Route31YoungsterScript:
	jumptextfaceplayer Route31YoungsterText

Route31Sign:
	jumptext Route31SignText

DarkCaveSign:
	jumptext DarkCaveSignText

Route31CooltrainerMScript:
	jumptextfaceplayer Route31CooltrainerMText

Route31FruitTree:
	fruittree FRUITTREE_ROUTE_31

Route31Potion:
	itemball MAX_POTION

Route31PokeBall:
	itemball REVIVE

Route31CooltrainerMText:
	text "I just barley"
	line "managed to escape."

	para "There is something"
	line "terrifying in that"
	cont "cave."

	para "Blades in the"
	line "dark..."

	para "Don't go in there"
	line "unless you have"
	cont "Flash."
	done

BugCatcherWade1SeenText:
	text "I'm not afraid"
	line "of the dark."

	para "Bugs live most"
	line "of their lives"
	cont "underground."
	done

BugCatcherWade1BeatenText:
	text "Hail the colony!"
	done

BugCatcherWade1AfterText:
	text "You can have a"
	line "variety of Types"
	cont "while still using"
	cont "your favorites."
	done

Text_Route31SleepyMan:
	text "I found a really"
	line "strong #mon in"
	cont "Dark Cave but"
	cont "I don't have"
	cont "enough Badges to"
	cont "catch it!"

	para "You need Badges"
	line "to catch high"
	cont "level #mon."
	done

Route31YoungsterText:
	text "I think Invaders"
	line "have some link"
	cont "to Dark Cave."

	para "There is something"
	line "deep within that"
	cont "place."

	para "Something evil."
	done

Route31SignText:
	text "Route 31"

	para "Violet City -"
	line "Cherrygrove City"
	done

DarkCaveSignText:
	text "Dark Cave"
	done

InvaderGiantDad:
	trainer INVADER, GIANT_DAD, EVENT_BEAT_GIANT_DAD, GiantDadSeenText, GiantDadBeatenText, GiantDadWinsText, .Script

.Script:
	endifjustbattled
	opentext
	writetext GiantDadAfterBattleText
	waitbutton
	closetext
	end

GiantDadSeenText:
    text "I have found"
    line "you, host!"

    para "I have invaded"
    line "your world!"

    para "Some people"
    line "have honor.."

    para "Hmph!"

    para "I have no need"
    line "for that!"

    para "I'm here to"
    line "crush noobs in"
    cont "the starting"
    cont "area."

    para "Because I"
    line "love it!"
    done

GiantDadBeatenText:
    text "This isn't"
    line "your first"
    cont "playthrough!"
    done

GiantDadWinsText:
    text "Welcome"
    line "to #mon!"
    done

GiantDadAfterBattleText:
    text "Hey, I gave"
    line "you a memorable"
    cont "experience, did"
    cont "I not?"
    done
    
Route31FieldMon1Script:
	trainer HOUNDOUR, FIELD_MON, EVENT_FIELD_MON_1, Route31PokemonAttacksText, 15, 0, .script
.script
    disappear ROUTE31_FIELDMON_1
    end

Route31FieldMon2Script:
	trainer HOUNDOOM, FIELD_MON, EVENT_FIELD_MON_2, Route31PokemonAttacksText, 25, 0, .script
.script
    disappear ROUTE31_FIELDMON_2
    end
    
Route31PokemonAttacksText:
	text "Wild #mon"
	line "attacks!"
	done

Route31FieldMon3Script:
	faceplayer
	cry MAREEP
	pause 15
	loadwildmon MAREEP, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear ROUTE31_FIELDMON_3
	end
	
Route31FieldMon4Script:
	faceplayer
	cry TIMBURR
	pause 15
	loadwildmon TIMBURR, 10
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear ROUTE31_FIELDMON_4
    end

InvaderWarningScript:
    applymovement ROUTE31_YOUNGSTER, Route31Movement_YoungsterApproaches
    opentext
    writetext InvaderWarningText
    waitbutton
    closetext
    applymovement ROUTE31_YOUNGSTER, Route31Movement_YoungsterLeaves
    setevent EVENT_INVADER_WARNING
    setmapscene ROUTE_31, SCENE_FINISHED
.end
    end

Route31Movement_YoungsterApproaches:
    big_step DOWN
    big_step DOWN
    big_step DOWN
    step_end

Route31Movement_YoungsterLeaves:
    big_step UP
    big_step UP
    big_step UP
    turn_head DOWN
    step_end

InvaderWarningText:
    text "Watch out!"

    para "That bright red"
    line "trainer is an"
    cont "invader and he"
    cont "is looking for"
    cont "you!"

    para "Invaders are very"
    line "strong and use"
    cont "unfair strategies."

    para "You don't have to"
    line "fight them."

    para "You should"
    line "definitely avoid"
    cont "this one!!"
    done

Route31_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  6, ROUTE_31_VIOLET_GATE, 3
	warp_event  4,  7, ROUTE_31_VIOLET_GATE, 4
	warp_event 38,  5, DARK_CAVE_VIOLET_ENTRANCE, 1

	def_coord_events
	coord_event  9, 9, SCENE_DEFAULT, InvaderWarningScript

	def_bg_events
	bg_event  7,  5, BGEVENT_READ, Route31Sign
	bg_event 31,  5, BGEVENT_READ, DarkCaveSign

	def_object_events
	object_event 17,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31MailRecipientScript, -1
	object_event 9,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31YoungsterScript, -1
	object_event 14, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBugCatcherWade1, -1
	object_event 33,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31CooltrainerMScript, -1
	object_event 16,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route31FruitTree, -1
	object_event 29,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31Potion, EVENT_ROUTE_31_POTION
	object_event 19, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route31PokeBall, EVENT_ROUTE_31_POKE_BALL
	object_event 11,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, InvaderGiantDad, -1
	object_event 42,  8, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route31FieldMon1Script, EVENT_FIELD_MON_1
	object_event 31,  0, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, Route31FieldMon2Script, EVENT_FIELD_MON_2
	object_event 9,  12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route31FieldMon3Script, EVENT_FIELD_MON_3
	object_event 18, 9, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route31FieldMon4Script, EVENT_FIELD_MON_4

	object_const_def
	const NATIONALPARK_LASS1
	const NATIONALPARK_TEACHER1
	const NATIONALPARK_YOUNGSTER2
	const NATIONALPARK_TEACHER2
	const NATIONALPARK_PERSIAN
	const NATIONALPARK_YOUNGSTER3
	const NATIONALPARK_POKEFAN_F2
	const NATIONALPARK_POKEFAN_M
	const NATIONALPARK_LEON
	const NATIONALPARK_POKE_BALL2
	const NATIONALPARK_FIELDMON_1
    const NATIONALPARK_FIELDMON_2
    const NATIONALPARK_FIELDMON_3
    const NATIONALPARK_FIELDMON_4
    const NATIONALPARK_FIELDMON_5
    const NATIONALPARK_FIELDMON_6

NationalPark_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .NationalParkFieldMon

.NationalParkFieldMon:
    checktime NITE
    iftrue .skipWeather
	setval WEATHER_SUN
	writemem wFieldWeather
.skipWeather
    disappear NATIONALPARK_LEON
    checkevent EVENT_BEAT_MORTY
    iffalse .appearLeon
	readvar VAR_WEEKDAY
	ifequal SATURDAY, .appearLeon
    sjump .fieldMon
.appearLeon
	setval WEATHER_NONE
	writemem wFieldWeather
    appear NATIONALPARK_LEON
    moveobject NATIONALPARK_TEACHER2, 16, 26
    turnobject NATIONALPARK_TEACHER2, RIGHT
    moveobject NATIONALPARK_LASS1, 20, 27
    turnobject NATIONALPARK_LASS1, LEFT
    moveobject NATIONALPARK_YOUNGSTER2, 17, 30
    turnobject NATIONALPARK_YOUNGSTER2, UP

.fieldMon
; Pokemon which always appear
    appear NATIONALPARK_FIELDMON_1
    appear NATIONALPARK_FIELDMON_3
    appear NATIONALPARK_FIELDMON_4
    appear NATIONALPARK_FIELDMON_5

; Pokemon that sometimes appear
    random 5 ; shiny
    ifequal 1, .spawn6
    disappear NATIONALPARK_FIELDMON_6
    sjump .checkNight
.spawn6
    appear NATIONALPARK_FIELDMON_6

.checkNight
; Pokemon that only appear at night
    checktime NITE
    iffalse .end

    random 2
    ifequal 1, .spawn2
    disappear NATIONALPARK_FIELDMON_2
    sjump .disappear
.spawn2
    appear NATIONALPARK_FIELDMON_2

.disappear
; Pokemon that don't appear at night
    disappear NATIONALPARK_FIELDMON_5

.end
    endcallback

NationalParkLassScript:
    checkevent EVENT_TEMP_EVENT_1
    iffalse .leon
	jumptextfaceplayer NationalParkLassText
.leon
    jumptextfaceplayer NationalParkLassLeonText

NationalParkTeacher1Script:
	faceplayer
	opentext
	checkevent EVENT_GOT_QUICK_CLAW
	iftrue .GotQuickClaw
	writetext NationalParkTeacher1Text
	promptbutton
	verbosegiveitem QUICK_CLAW
	iffalse .NoRoom
	setevent EVENT_GOT_QUICK_CLAW
.GotQuickClaw:
	writetext NationalParkTeacher1Text_GotQuickClaw
	waitbutton
.NoRoom:
	closetext
	end

NationalParkYoungster2Script:
    checkevent EVENT_TEMP_EVENT_1
    iffalse .leon
	jumptextfaceplayer NationalParkYoungster2Text
.leon
    jumptextfaceplayer NationalParkYoungster2LeonText

NationalParkTeacher2Script:
    checkevent EVENT_TEMP_EVENT_1
    iffalse .leon
	jumptextfaceplayer NationalParkTeacher2Text
.leon
    jumptextfaceplayer NationalParkTeacher2LeonText

NationalParkPersian:
	faceplayer
	opentext
	writetext NationalParkPersianText
	cry PERSIAN
	waitbutton
	closetext
	end

TrainerSchoolboyJack1:
	trainer SCHOOLBOY, JACK1, EVENT_BEAT_SCHOOLBOY_JACK, SchoolboyJack1SeenText, SchoolboyJack1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_SCHOOLBOY_JACK
	opentext
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_SCHOOLBOY_JACK
	iftrue .NumberAccepted
	checkevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext SchoolboyJackTradeMonText
	promptbutton
	setevent EVENT_JACK_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_SCHOOLBOY_JACK
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	scall .RegisteredNumber
	writetext JackNumberAcceptedText
	waitbutton
	closetext
	end

.Rematch:
	scall .RematchStd
	winlosstext SchoolboyJack1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight4
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
	loadtrainer SCHOOLBOY, JACK1
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer SCHOOLBOY, JACK2
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer SCHOOLBOY, JACK3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer SCHOOLBOY, JACK4
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer SCHOOLBOY, JACK5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JACK_READY_FOR_REMATCH
	end

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
	writetext JackNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext JackRematchText
	waitbutton
	yesorno
	iftrue .Rematch
	writetext JackRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

JackNumberAcceptedText:
	text "I will call you"
	line "when you least"
	cont "expect it to keep"
	cont "your mind sharp!"
	done

JackRematchText:
    text "How about a"
    line "rematch?"
    done

JackRematchRefuseText:
    text "I'll call you."
    done

TrainerPokefanmWilliam:
	trainer POKEFANM, WILLIAM, EVENT_BEAT_POKEFANM_WILLIAM, PokefanmWilliamSeenText, PokefanmWilliamBeatenText, 0, .Script

.Script:
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	endifjustbattled
	opentext
	writetext PokefanmWilliamAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanfBeverly1:
	trainer POKEFANF, BEVERLY1, EVENT_BEAT_POKEFANF_BEVERLY, PokefanfBeverly1SeenText, PokefanfBeverly1BeatenText, 0, .Script

.Script:
    loadmem wNoRematch, 1
	loadvar VAR_CALLERID, PHONE_POKEFAN_BEVERLY
	opentext
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .GiveNugget
	checkcellnum PHONE_POKEFAN_BEVERLY
	iftrue .NumberAccepted
	checkevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PokefanBeverlyCuteMonText
	promptbutton
	setevent EVENT_BEVERLY_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .RequestNumber

.Rematch:
	winlosstext PokefanfBeverly1BeatenText, 0
	checkevent EVENT_BEAT_WALLACE
	iftrue .LoadFight2
	loadtrainer POKEFANF, BEVERLY1
	startbattle
	reloadmapafterbattle
	end

.LoadFight2:
	loadtrainer POKEFANF, BEVERLY3
	startbattle
	reloadmapafterbattle
	end

.AskAgain:
	scall .AskNumber2
.RequestNumber:
	askforphonenumber PHONE_POKEFAN_BEVERLY
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	scall .RegisteredNumber
	writetext BeverlyNumberAcceptedText
	waitbutton
	closetext
	end

.GiveNugget:
	scall .Gift
	verbosegiveitem NUGGET
	iffalse .NoRoom
	clearflag ENGINE_BEVERLY_HAS_NUGGET
	sjump .NumberAccepted

.NoRoom:
	sjump .PackFull

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
	writetext BeverlyNumberAcceptedText
	waitbutton
	closetext
	opentext
	writetext BeverlyRematchText
	waitbutton
	yesorno
	iftrue .Rematch
	writetext BeverlyRematchRefuseText
	waitbutton
	closetext
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

BeverlyNumberAcceptedText:
	text "You are under our"
	line "protection now!"
	done

BeverlyRematchText:
    text "How about a"
    line "rematch?"
    done

BeverlyRematchRefuseText:
    text "The day..."
    line "is saved!"
    done

TrainerLassKrise:
	trainer LASS, KRISE, EVENT_BEAT_LASS_KRISE, LassKriseSeenText, LassKriseBeatenText, 0, .Script

.Script:
    loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
	endifjustbattled
	opentext
	writetext LassKriseAfterBattleText
	waitbutton
	closetext
	end

NationalParkRelaxationSquareSign:
	jumptext NationalParkRelaxationSquareText

NationalParkBattleNoticeSign:
	jumptext NationalParkBattleNoticeText

NationalParkTrainerTipsSign:
	jumptext NationalParkTrainerTipsText

NationalParkParlyzHeal:
	itemball POKE_DOLL

NationalParkTMDig:
	itemball TM_DIG

NationalParkHiddenFullHeal:
	hiddenitem FOCUS_SASH, EVENT_NATIONAL_PARK_HIDDEN_FULL_HEAL

NationalParkLassText:
	text "I hate waiting"
	line "all week until"
	cont "Saturday."

	para "On Saturday"
	line "LEON always"
	cont "visits here!"

	para "He is the most"
	line "powerful trainer"
	cont "in the world."
	done

NationalParkLassLeonText:
	text "I always feel so"
	line "privileged when"
	cont "I'm this close"
	cont "to LEON!"

	para "The strongest"
	line "trainer!"

	para "Oh..."

	para "I feel faint."
	done

NationalParkTeacher1Text:
	text "SPEED is very"
	line "important in"
	cont "battle."

	para "Being just one"
	line "point faster"
	cont "than your enemy"
	cont "will allow you"
	cont "to strike first."

	para "However there"
	line "is a way to"
	cont "cheat!"

	para "Don't tell"
	line "anyone."

	para "Here, take this."
	done

NationalParkTeacher1Text_GotQuickClaw:
	text "Let a #MON hold"
	line "that QUICK CLAW."

	para "Sometimes it will"
	line "strike first"
	cont "during battle"
	cont "regardless of"
	cont "its stats."

	para "Isn't that"
	line "unfair?"
	done

NationalParkYoungster2Text:
	text "I wish there"
	line "were more people"
	cont "like LEON"

	para "CHAMPION LEON."

	para "The best in the"
	line "world!"

	para "He visits his"
	line "fans here on"
	cont "Saturday."
	done

NationalParkYoungster2LeonText:
	text "Today is a big"
	line "day!"

	para "LEON is here"
	line "visiting his fans."

	para "He is the best"
	line "trainer in the"
	cont "world!"
	done

NationalParkTeacher2Text:
	text "War is coming."

	para "People need heroes"
	line "that give them"
	cont "hope."

	para "LEON is my hero."
	done

NationalParkTeacher2LeonText:
	text "LEON!"
	para "I love you!!"

	para "I feel safe"
	line "with LEON here."

	para "He could take on"
	line "the HOENN army by"
	cont "himself."
	done

NationalParkPersianText:
	text "PERSIAN: Fufushaa!"
	done

SchoolboyJack1SeenText:
	text "I am top of"
	line "my class."

	para "I got a 91"
	line "on our TYPE"
	cont "matchup test!"
	done

SchoolboyJack1BeatenText:
	text "I have more"
	line "to learn."
	done

SchoolboyJackTradeMonText:
	text "I am going to"
	line "to know all the"
	cont "little facts."

	para "For example..."

	para "Did you know"
	line "LEECH SEED wont"
	cont "work if the"
	cont "enemy is more"
	cont "than twice your"
	cont "level?"

	para "Didn't think so!"
	done

PokefanfBeverly1SeenText:
	text "Fighting crime"

	para "Trying to save"
	line "the world."

	para "Here they come"
	line "just in time..."
	done

PokefanfBeverly1BeatenText:
	text "I need more"
	line "chemical X!"
	done

PokefanBeverlyCuteMonText:
	text "When war comes"
	line "and HOENN invades"
	cont "we will be"
	cont "ready..."

	para "To face..."

	para "HIM..."
	done

PokefanmWilliamSeenText:
	text "Captains log..."

	para "Stardate -299189.2"

	para "We have"
	line "encountered a"
	cont "hostile trainer."

	para "Ready phasors!"
	done

PokefanmWilliamBeatenText:
	text "KHANNNN!"
	done

PokefanmWilliamAfterBattleText:
	text "Of all the"
	line "souls I've"
	cont "encountered."

	para "Yours is the"
	line "most..."

	para "..."

	para "Human."
	done

LassKriseSeenText:
	text "You are staring"
	line "right at me."

	para "..."

	para "You're still"
	line "staring at me."

	para "..."

	para "Hello!"

	para "..."

	para "What is your"
	line "problem!?"
	done

LassKriseBeatenText:
	text "Don't look"
	line "at me!"
	done

LassKriseAfterBattleText:
	text "Oh, you just"
	line "wanted a battle."

	para "I thought you"
	line "might have found"
	cont "me attractive..."

	para "Silly me!"
	done

NationalParkRelaxationSquareText:
	text "RELAXATION SQUARE"
	line "NATIONAL PARK"
	done

NationalParkBattleNoticeText:
	text "What is this"
	line "notice?"

	para "Please battle only"
	line "in the grass."

	para "NATIONAL PARK"
	line "WARDEN'S OFFICE"
	done

NationalParkTrainerTipsText:
	text "TRAINER TIPS"

	para "Print out MAIL by"
	line "opening it then"
	cont "pressing START."
	done

NationalParkFieldMon1Script:
	trainer URSARING, FIELD_MON, EVENT_FIELD_MON_1, NationalParkPokemonAttacksText, 31, 0, .script
.script
    disappear NATIONALPARK_FIELDMON_1
    end

NationalParkFieldMon2Script:
	trainer GARDEVOIR, FIELD_MON, EVENT_FIELD_MON_2, NationalParkPokemonAttacksText, 32, 0, .script
.script
    disappear NATIONALPARK_FIELDMON_2
    end

NationalParkPokemonAttacksText:
	text "Wild #MON"
	line "attacks!"
	done

NationalParkFieldMon3Script:
	faceplayer
	cry EXEGGCUTE
	pause 15
	loadwildmon EXEGGCUTE, 18
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_3
	disappear NATIONALPARK_FIELDMON_3
	end

NationalParkFieldMon4Script:
	faceplayer
	cry KIRLIA
	pause 15
	loadwildmon KIRLIA, 20
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_4
	disappear NATIONALPARK_FIELDMON_4
	end

NationalParkFieldMon5Script:
	faceplayer
	cry HERACROSS
	pause 15
	loadwildmon HERACROSS, 25
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_5
	disappear NATIONALPARK_FIELDMON_5
	end

NationalParkFieldMon6Script:
	faceplayer
	cry TEDDIURSA
	pause 15
	loadwildmon TEDDIURSA, 24
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	reloadmapafterbattle
	setevent EVENT_FIELD_MON_6
	disappear NATIONALPARK_FIELDMON_6
	end

NationalParkLeonScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_WALLACE
	iffalse .notHero
	writetext HeyHeroText
	waitbutton
	yesorno
	iffalse .refused
	sjump .dontAsk
.notHero
	checkevent EVENT_BEAT_LEON
	iftrue .FightDone
.fight
	writetext NPLeonSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_LEON
	iftrue .dontAsk
	opentext
	writetext NPLeonOfferFightText
    waitbutton
	yesorno
	iffalse .refused
	writetext NPLeonOfferFightTextAgain
    waitbutton
	yesorno
	iffalse .refused
	writetext NPLeonPreFightText
    waitbutton
	closetext
.dontAsk
	winlosstext NPLeonBeatenText, NPLeonWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LEON, CHAMP_LEON
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_LEON
	special HealParty
	opentext
	writetext YoureStrongKidText
	waitbutton
	checkevent EVENT_FOUGHT_PARK_LEON
    iffalse .giveGift
	end
.FightDone:
	writetext NPLeonAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextLeon
	yesorno
	iftrue .fight
.refused
	writetext RematchRefusedTextLeon
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext NPLeonWinAfterBattleText
    waitbutton
    checkevent EVENT_FOUGHT_PARK_LEON
    iffalse .giveGift
    closetext
    end
.giveGift
    writetext LeonGiftText
    waitbutton
    verbosegiveitem LUCKY_EGG
    iffalse .LeonNoRoom
    closetext
    setevent EVENT_FOUGHT_PARK_LEON
    end
.LeonNoRoom
    writetext LeonNoRoomText
    waitbutton
    closetext
    end

LeonNoRoomText:
	text "You have no space"
	line "in your bag champ!"
	para "You'll never be"
	line "the best if you"
	cont "don't organise"
	cont "your supplies"
	cont "better."
	done

HeyHeroText:
    text "Hey <PLAYER>!"
    para "The hero of the"
    line "people."
    para "How'd you like"
    line "to fight a true"
    cont "hero?"
    done

YoureStrongKidText:
    text "You're pretty"
    line "strong kid!"
    para "I went easy on"
    line "you."
    done

LeonGiftText:
    text "You got heart kid."
    para "Here, this will"
    line "help you get"
    cont "stronger."
    done

NPLeonWinAfterBattleText:
    text "You did well kid."

    para "Don't feel bad."

    para "You were beaten"
    line "by the best!"
    done

NPLeonSeenText:
    text "Hey there kid!"

    para "I'm CHAMPION LEON."

    para "You may have"
    line "heard of me."

    para "These beautiful"
    line "people certainly"
    cont "have."

    para "I am stronger"
    line "than any other"
    cont "CHAMPION."

    para "That makes me"
    line "the strongest"
    cont "trainer in the"
    cont "world."

    para "It's a big"
    line "responsibility."
    done
NPLeonBeatenText:
    text "NO WAY!"
    done
NPLeonWinsText:
    text "Don't feel bad."
    done
NPLeonOfferFightText:
    text "Hmm..."

    para "Ah you are a"
    line "trainer."

    para "I can tell you"
    line "are serious."

    para "This is your"
    line "lucky day."

    para "How would you"
    line "like the honour"
    cont "of a battle with"
    cont "the top trainer"
    cont "in the world?"
    done
NPLeonOfferFightTextAgain:
    text "Do you really"
    line "want to fight me?"

    para "You know you"
    line "wont win."

    para "Though I won't"
    line "take any money"
    cont "or anything when"
    cont "I win."
    done
NPLeonPreFightText:
    text "That's the spirit!"

    para "I'll do my best"
    line "to take it easy"
    cont "on you!"

    para "You know what"
    line "time it is..."

    para "It's CHAMPION"
    line "time!"
    done
NPLeonAfterBattleText:
    text "Haha..."

    para "You are a real"
    line "Hero."

    para "The world needs"
    line "more Heroes."

    para "Next time we"
    line "battle I won't"
    cont "hold back."
    done
RematchTextLeon:
    text "Let's give these"
    line "people another"
    cont "spectacle!"

    para "Let's have"
    line "another fight?"
    done
RematchRefusedTextLeon:
    text "Yes!"

    para "Keep them hungry"
    line "for more."
    done

NationalPark_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 33, 18, ROUTE_36_NATIONAL_PARK_GATE, 1
	warp_event 33, 19, ROUTE_36_NATIONAL_PARK_GATE, 2
	warp_event 10, 47, ROUTE_35_NATIONAL_PARK_GATE, 1
	warp_event 11, 47, ROUTE_35_NATIONAL_PARK_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 14, 44, BGEVENT_READ, NationalParkRelaxationSquareSign
	bg_event 27, 31, BGEVENT_READ, NationalParkBattleNoticeSign
	bg_event  6, 47, BGEVENT_ITEM, NationalParkHiddenFullHeal
	bg_event 12,  4, BGEVENT_READ, NationalParkTrainerTipsSign

	def_object_events
	object_event 20, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkLassScript, -1
	object_event 27, 40, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher1Script, -1
	object_event 10, 41, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, NationalParkYoungster2Script, -1
	object_event 15, 30, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_RIGHT, 1, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkTeacher2Script, -1
	object_event 26, 40, SPRITE_MONSTER, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, NationalParkPersian, -1
	object_event 27, 23, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyJack1, -1
	object_event  9, 14, SPRITE_POKEFAN_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanfBeverly1, -1
	object_event 16,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerPokefanmWilliam, -1
	object_event 18, 27, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, NationalParkLeonScript, EVENT_TEMP_EVENT_1
	object_event  1, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, NationalParkTMDig, EVENT_NATIONAL_PARK_TM_DIG
	object_event 21,  7, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, NationalParkFieldMon1Script, EVENT_FIELD_MON_1
	object_event  6, 21, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 3, 3, -1, NITE, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 2, NationalParkFieldMon2Script, EVENT_FIELD_MON_2
	object_event 15, 41, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkFieldMon3Script, EVENT_FIELD_MON_3
	object_event 27, 25, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkFieldMon4Script, EVENT_FIELD_MON_4
	object_event 27, 15, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, NationalParkFieldMon5Script, EVENT_FIELD_MON_5
	object_event 18, 12, SPRITE_MONSTER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, NationalParkFieldMon6Script, EVENT_FIELD_MON_6

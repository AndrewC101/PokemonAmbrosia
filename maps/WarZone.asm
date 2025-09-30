	object_const_def
	const WARZONE_WALLACE
	const WARZONE_STEVEN
	const WARZONE_CYNTHIA
	const WARZONE_LEON
	const WARZONE_SOLDIER_1
	const WARZONE_SOLDIER_2
	const WARZONE_SOLDIER_3
	const WARZONE_SOLDIER_5
	const WARZONE_BLUE
	const WARZONE_SILVER
	const WARZONE_CRYSTAL
	const WARZONE_INVADER
	const WARZONE_OAK
	const WARZONE_JONATHAN
	const WARZONE_KYOGRE
	const WARZONE_GROUDON
	const WARZONE_RAYQUAZA

WarZone_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Weather

.Weather:
    disappear WARZONE_BLUE
    disappear WARZONE_SILVER
    disappear WARZONE_CRYSTAL
    disappear WARZONE_OAK

	checkevent EVENT_BEAT_WALLACE
	iffalse .war
	appear WARZONE_STEVEN
	appear WARZONE_CYNTHIA
	appear WARZONE_LEON
	sjump .end
.war
	setval WEATHER_RAIN
	writemem wFieldWeather
	disappear WARZONE_STEVEN
	disappear WARZONE_CYNTHIA
	disappear WARZONE_LEON
.end
	endcallback

WallaceScript:
    turnobject WARZONE_WALLACE, DOWN
	opentext
	writetext WallaceSeenText
	waitbutton
	closetext
	winlosstext WallaceBeatenText, WallaceWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer WALLACE, EMPEROR_WALLACE
	startbattle
	ifequal LOSE, .lose
	disappear WARZONE_KYOGRE
	disappear WARZONE_GROUDON
	disappear WARZONE_RAYQUAZA
	dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_WALLACE
	setevent EVENT_BEAT_HOEN_ARMY
	setmapscene ROUTE_22, SCENE_CUSTOM_FINISHED
	setmapscene VERMILION_CITY, SCENE_CUSTOM_FINISHED
	setmapscene WAR_ZONE, SCENE_CUSTOM_FINISHED
	setmapscene PALLET_TOWN, SCENE_FINISHED
	clearevent EVENT_HOEN_INVASION_UNDERWAY
	setval 0
    writemem wHoenInvasionUnderway
	special HealParty
	opentext
	writetext WallaceAfterBattleText1
	waitbutton
	closetext

    playsound SFX_FLY
	appear WARZONE_STEVEN
	opentext
	writetext StevenIntroText
	waitbutton
	closetext
	applymovement WARZONE_STEVEN, Movement_Down
	turnobject WARZONE_WALLACE, UP
	opentext
	writetext StevenText
    waitbutton
    closetext
    opentext
    writetext WallaceAfterBattleText2
    waitbutton
    closetext

    playsound SFX_FLY
    appear WARZONE_CYNTHIA
    opentext
    writetext CynthiaIntroText
    waitbutton
    applymovement WARZONE_CYNTHIA, Movement_Right
    turnobject WARZONE_WALLACE, LEFT
    writetext CynthiaText
    waitbutton
    closetext

    playsound SFX_FLY
    appear WARZONE_LEON
    opentext
    writetext LeonIntroText
    waitbutton
    applymovement WARZONE_LEON, Movement_Left
    turnobject WARZONE_WALLACE, RIGHT
    writetext LeonText
    waitbutton
    closetext

    turnobject WARZONE_WALLACE, DOWN
    appear WARZONE_SILVER
    applymovement WARZONE_SILVER, WarZoneMovement_SilverApproaches
    opentext
    writetext WarZoneSilverText
    waitbutton
    closetext

    appear WARZONE_CRYSTAL
    applymovement WARZONE_CRYSTAL, WarZoneMovement_CrystalApproaches
    opentext
    writetext WarZoneCrystalText
    waitbutton
    closetext

    turnobject WARZONE_WALLACE, LEFT
    pause 30
    turnobject WARZONE_WALLACE, RIGHT
    pause 30
    turnobject WARZONE_WALLACE, UP
    pause 30
    turnobject WARZONE_WALLACE, DOWN
    opentext
    writetext WallaceFinalText
    waitbutton
    closetext
    disappear WARZONE_WALLACE
    disappear WARZONE_SOLDIER_1
    disappear WARZONE_SOLDIER_2
    disappear WARZONE_SOLDIER_3
    disappear WARZONE_SOLDIER_5
    dontrestartmapmusic
    reloadmap
    playmusic MUSIC_ECRUTEAK_CITY

    turnobject WARZONE_SILVER, RIGHT
    turnobject PLAYER, LEFT
    opentext
    writetext WarZoneSilverGoodbyeText
    waitbutton
    closetext
    applymovement WARZONE_SILVER, WarZoneMovement_SilverLeaves
    disappear WARZONE_SILVER

    turnobject WARZONE_CRYSTAL, LEFT
    turnobject PLAYER, RIGHT
    opentext
    writetext WarZoneCrystalGoodbyeText
    waitbutton
    closetext
    applymovement WARZONE_CRYSTAL, WarZoneMovement_CrystalLeaves
    disappear WARZONE_CRYSTAL

    turnobject PLAYER, DOWN
    appear WARZONE_OAK
    applymovement WARZONE_OAK, WarZoneMovement_CrystalApproaches
    turnobject PLAYER, RIGHT
    turnobject WARZONE_OAK, LEFT
    opentext
    writetext WarZoneOakText
    waitbutton
    closetext
    loadmem wLevelCap, 100
    applymovement WARZONE_OAK, WarZoneMovement_CrystalLeaves
    disappear WARZONE_OAK
    turnobject PLAYER, UP
	end
.lose
    applymovement PLAYER, Player_Fall
    dontrestartmapmusic
    reloadmap
	opentext
	writetext WallaceHeroText
	waitbutton
	closetext
	special FadeOutPalettes
	special Reset
	end

WallaceHeroText:
	text "You were never the"
	line "hero of this"
	cont "story."
	done

Player_Fall:
    skyfall_top
    step_end

WarZoneMovement_SilverApproaches:
    step UP
    step UP
    step UP
    step LEFT
    step UP
    step UP
    step_end

WarZoneMovement_CrystalApproaches:
    step UP
    step UP
    step UP
    step UP
    step UP
    step_end

WarZoneMovement_SilverLeaves:
    step DOWN
    step DOWN
    step RIGHT
    step DOWN
    step DOWN
    step DOWN
    step_end

WarZoneMovement_CrystalLeaves:
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step DOWN
    step_end

WarZoneOakText:
    text "<PLAYER>..."

    para "You alone have"
    line "defeated WALLACE."

    para "I saw the battle."

    para "You now stand"
    line "above and beyond"
    cont "CHAMPIONS."

    para "I have only known"
    line "one other to"
    cont "posses such"
    cont "extraordinary"
    cont "ability."

    para "Perhaps you might"
    line "even be able to"
    cont "defeat him."

    para "RED."

    para "In recognition"
    line "of your authority"
    cont "as a trainer you"
    cont "can now train"
    cont "and capture"
    cont "#mon up to"
    cont "any level."

    para "Now you have one"
    line "more badge to"
    cont "obtain do you"
    cont "not?"

    para "Head to VIRIDIAN"
    line "and battle my"
    cont "nephew BLUE."

    para "If you defeat"
    line "him then I am"
    cont "certain about"
    cont "you."

    para "You must come"
    line "see me after the"
    cont "battle."

    para "And..."

    para "Thank you"
    line "<PLAYER>."

    para "For saving us"
    line "all."
    done

WarZoneSilverText:
    text "EMPEROR WALLACE..."

    para "Hmph!"

    para "I expected more."

    para "Just another"
    line "weakling."
    done

WarZoneCrystalText:
    text "Your people"
    line "deserve better."

    para "<PLAYER> has"
    line "true strength."

    para "You do not."
    done

WarZoneSilverGoodbyeText:
    text "I don't know"
    line "how you have"
    cont "obtained such"
    cont "power."

    para "But don't get"
    line "too far ahead of"
    cont "yourself."

    para "There are powerful"
    line "#mon hidden in"
    cont "remote places"
    cont "of the world."

    para "I will find them!"

    para "And I will surpass"
    line "you."
    done

WarZoneCrystalGoodbyeText:
    text "You did it!"

    para "You beat the whole"
    line "HOENN army!"

    para "You saved us!"

    para "Thank you..."

    para "I don't know"
    line "what you do now."

    para "You are a hero."

    para "Your Dad and Mum"
    line "will be so proud"
    cont "of you."

    para "I am."

    para "I better go after"
    line "<RIVAL>."

    para "I think I know"
    line "where he is going"
    cont "and he will get"
    cont "himself hurt."

    para "I'll see you"
    line "again."

    para "And maybe we"
    line "have a battle"
    cont "for old time sake."
    done

WallaceSeenText:
    text "Ah just in time."

    para "You must be the"
    line "new CHAMPION of"
    cont "JOHTO."

    para "A young hero"
    line "rose to CHAMPION"
    cont "to conquer evil"
    cont "and save their"
    cont "people."

    para "Such a perfect"
    line "story."

    para "Your great"
    line "moment has now"
    cont "come."

    para "The people will"
    line "mourn you."

    para "They will see"
    line "the futility of"
    cont "heroes and the"
    cont "inevitability of"
    cont "my rule."

    para "You and your"
    line "#mon will truly"
    cont "conquer this land"
    cont "for me and for"
    cont "all HOENN."

    para "Now let me help"
    line "you complete your"
    cont "story."
    done

WallaceBeatenText:
    text "It can not be!"

    para "There must be a"
    line "reason!"
    done

WallaceWinsText:
    text "Let the light"
    line "take you."

    para "Your story is"
    line "complete."
    done

WallaceAfterBattleText1:
    text "NO!"

    para "How dare you do"
    line "this to me."

    para "My soldiers shall"
    line "have new orders."

    para "To kill on sight."

    para "Starting with"
    line "NEW BARK TOWN."
    done

WallaceAfterBattleText2:
    text "STEVEN..."

    para "Traitor!"

    para "The people of"
    line "HOENN have"
    cont "rejected your"
    cont "brand of weak"
    cont "passivism."

    para "They believe in"
    line "my vision of a"
    cont "great and strong"
    cont "HOENN."

    para "A jewel taking"
    line "its rightful place"
    cont "atop the world."

    para "That's why they"
    line "follow me!"
    done

WallaceFinalText:
    text "You may be the"
    line "hero now."

    para "But we were all"
    line "heroes once."

    para "One day your"
    line "people will turn"
    cont "on you."

    para "It is inevitable."

    para "Then you will"
    line "realise the"
    cont "virtue of my"
    cont "actions."

    para "RAYQUAZA!"
    line "FLY!"
    done

StevenIntroText:
    text "STEVEN: They"
    line "are no longer"
    cont "under your"
    cont "command."

    para "You have lost"
    line "their respect."
    done

StevenText:
    text "It's over WALLACE."

    para "You have lost."

    para "Hatred has lost."

    para "You will never"
    line "drag HOENN into"
    cont "war again."
    done

CynthiaIntroText:
    text "CYNTHIA: They"
    line "follow you out"
    cont "of fear."
    done

CynthiaText:
    text "But they don't"
    line "need to be afraid"
    cont "anymore."

    para "We won't allow"
    line "this to go on!"
    done

LeonIntroText:
    text "LEON: Well well..."

    para "Would you look at"
    line "the clock."
    done

LeonText:
    text "It's CHAMPION"
    line "time!"
    done

Movement_Down:
	step DOWN
	step DOWN
	step_end

Movement_Left:
	step LEFT
	step LEFT
	step LEFT
	step_end

Movement_Right:
	step RIGHT
	step RIGHT
	step_end

StevenScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_STEVEN
	iftrue .FightDone
.fight
	writetext StevenSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_STEVEN
	iftrue .dontAsk
	opentext
	writetext StevenOfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext StevenBeatenText, StevenBeatenText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer STEVEN, CHAMP_STEVEN
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_STEVEN
	special HealParty
	end
.FightDone:
	writetext StevenAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextWarZone
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextWarZone
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext StevenWinsAfterBattleText
    waitbutton
    closetext
    end
StevenWinsAfterBattleText:
    text "You are a strong"
    line "CHAMPION."

    para "You will be a"
    line "great leader"
    cont "one day."
    done
StevenSeenText:
    text "I am sorry..."

    para "So very sorry."

    para "For all the pain"
    line "HOENN has caused."

    para "I tried to make"
    line "people see reason."

    para "But WALLACE was"
    line "right."

    para "Many people"
    line "believed in him."

    para "It has nothing to"
    line "do with freeing"
    cont "#mon."

    para "HOENN is mostly"
    line "sea."

    para "People want more"
    line "land."

    para "We are lucky you"
    line "were here to"
    cont "save the day."
    done
StevenBeatenText:
    text "Well done!"
    done
StevenWinsText:
    text "Well done!"
    done
StevenOfferFightText:
    text "I would like to"
    line "help you become"
    cont "stronger."

    para "How about a"
    line "battle?"
    done
StevenAfterBattleText:
    text "One day WALLACE"
    line "or another like"
    cont "him will decide"
    cont "to make war again."

    para "By then however."

    para "You will be"
    line "unstoppable."
    done

CynthiaScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_CYNTHIA
	iftrue .FightDone
.fight
	writetext CynthiaSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_CYNTHIA
	iftrue .dontAsk
	opentext
	writetext CynthiaOfferFightText
    waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext CynthiaBeatenText, CynthiaWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer CYNTHIA, CHAMP_CYNTHIA
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_CYNTHIA
	special HealParty
	end
.FightDone:
	writetext CynthiaAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextWarZone
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextWarZone
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext CynthiaWinsAfterBattleText
    waitbutton
    closetext
    end
CynthiaWinsAfterBattleText:
    text "You did well."

    para "You are certainly"
    line "a worthy CHAMPION."
    done
CynthiaSeenText:
    text "You have CHAMPION"
    line "BLUE to thank for"
    cont "our arrival."

    para "He gave an"
    line "impassioned and"
    cont "masterful speech"
    cont "to the LEAGUE."

    para "It made me ashamed"
    line "for not taking a"
    cont "stance against"
    cont "WALLACE years"
    cont "ago."
    done
CynthiaBeatenText:
    text "Good job!"
    done
CynthiaWinsText:
    text "Good job!"
    done
CynthiaOfferFightText:
    text "From one CHAMPION"
    line "to another."

    para "Would you like"
    line "to battle?"
    done
CynthiaAfterBattleText:
    text "Have you heard of"
    line "ARCEUS?"

    para "Legend states it"
    line "is a #mon"
    cont "that created all"
    cont "things."

    para "I can feel it"
    line "is watching us."

    para "How disappointed"
    line "it must be."

    para "In all but you."
    done

LeonScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_LEON
	iftrue .FightDone
.fight
	writetext LeonSeenText
	waitbutton
	closetext
	checkevent EVENT_BEAT_LEON
	iftrue .dontAsk
	opentext
	writetext LeonOfferFightText
    waitbutton
	nooryes
	iffalse .refused
	closetext
.dontAsk
	winlosstext LeonBeatenText, LeonWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer LEON, CHAMP_LEON
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	setevent EVENT_BEAT_LEON
	special HealParty
	end
.FightDone:
	writetext LeonAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextWarZone
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextWarZone
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext LeonWinsAfterBattleText
    waitbutton
    closetext
    end
LeonWinsAfterBattleText:
    text "Well Well."

    para "You are pretty"
    line "good."

    para "But no shame in"
    line "being beaten by"
    cont "the best."
    done
LeonSeenText:
    text "It's a real shame"
    line "I didn't get here"
    cont "sooner."

    para "I would have"
    line "enjoyed stomping"
    cont "that weakling"
    cont "WALLACE into the"
    cont "dirt."

    para "But you did"
    line "pretty good"
    cont "yourself."
    done
LeonBeatenText:
    text "Not bad."
    done
LeonWinsText:
    text "Not bad."
    done
LeonOfferFightText:
    text "Say do you think"
    line "you would last..."

    para "Against the"
    line "strongest CHAMPION"

    para "Let's battle?"
    done
LeonAfterBattleText:
    text "You are a worthy"
    line "CHAMPION."

    para "Unlike DYANTHA"
    line "and ALDER."

    para "Both too busy"
    line "to make it here."
    done

TrainerSoldier1:
	trainer SOLDIER, SOLDIER_1, EVENT_BEAT_SOLDIER_1, Soldier1SeenText, Soldier1BeatenText, Soldier1WinsText, .Script
.Script:
    loadmem wNoRematch, 1
	opentext
	writetext Soldier1AfterBattleText
	waitbutton
	closetext
	end
Soldier1SeenText:
    text "Do you actually"
    line "believe that a"
    cont "single child like"
    cont "you stands a"
    cont "chance against"
    cont "HOENNs most elite"
    cont "soldiers."
    para "Your hubris will"
    line "get you killed."
    done
Soldier1BeatenText:
    text "You are too late."
    done
Soldier1WinsText:
    text "You're lucky I"
    line "didn't kill you."
    done
Soldier1AfterBattleText:
    text "Reinforcements"
    line "are pouring in."

    para "Ah my Lieutenants"
    line "are reporting now!"

    para "...."

    para "Yes...."

    para "What do you mean"
    line "LT SURGE is free!"

    para "...."

    para "Raining down"
    line "THUNDER on our"
    cont "ships."

    para "...."

    para "While singing"
    line "about ELECTRODES!"

    para "...."

    para "Damn!!!"
    done

TrainerSoldier2:
	trainer SOLDIER, SOLDIER_2, EVENT_BEAT_SOLDIER_2, Soldier2SeenText, Soldier2BeatenText, Soldier2WinsText, .Script
.Script:
    loadmem wNoRematch, 1
	opentext
	writetext Soldier2AfterBattleText
	waitbutton
	closetext
	end
Soldier2SeenText:
    text "So you caused the"
    line "trouble in"
    cont "VERMILION."

    para "We have been"
    line "preparing this"
    cont "invasion for"
    cont "years!"

    para "You and everyone"
    line "you know will"
    cont "suffer because"
    cont "of your actions!"
    done
Soldier2BeatenText:
    text "My commanders"
    line "will end you!"
    done
Soldier2WinsText:
    text "Sleep now."
    done
Soldier2AfterBattleText:
    text "Our air units are"
    line "on their way as"
    cont "we speak."

    para "Here's their"
    line "progress report"
    cont "coming now."

    para "...."

    para "What was that?"
    line "Speak up!"

    para "...."

    para "Too fast to see!"

    para "DRAGONS"

    para "...."

    para "............"

    para "Damn!"

    para "LANCE got here"
    line "quicker than"
    cont "expected!"
    done

TrainerSoldier3:
	trainer SOLDIER, SOLDIER_3, EVENT_BEAT_SOLDIER_3, Soldier3SeenText, Soldier3BeatenText, Soldier3WinsText, .Script
.Script:
    loadmem wNoRematch, 1
	opentext
	writetext Soldier3AfterBattleText
	waitbutton
	closetext
	end
Soldier3SeenText:
    text "KANTO will burn!"

    para "It is too late."

    para "Our reinforcements"
    line "have made it past"
    cont "SURGE and will be"
    cont "taking SAFFRON"
    cont "shortly."

    para "You have failed."
    done
Soldier3BeatenText:
    text "It's...."

    para "It's no use..."
    done
Soldier3WinsText:
    text "Your name will"
    line "not be remembered."
    done
Soldier3AfterBattleText:
    text "It's over!"

    para "Our forces have"
    line "taken SAFFRON."

    para "Listen yourself."

    para "...."

    para "Yes Captain, have"
    line "you taken SAFFRON?"

    para "...."

    para "There are two GYMs"

    para "...."

    para "Fighting together."

    para "Well surely you"
    line "can handle...."

    para "...."

    para "A #mon as"
    line "big as a building!"

    para "Impossible to win!"

    para "...."

    para "It matters not."

    para "ADMIRAL DRAKE"
    line "will end them all."

    para "Starting with you."
    done

TrainerSoldier5:
	trainer SOLDIER, SOLDIER_5, EVENT_BEAT_SOLDIER_5, Soldier5SeenText, Soldier5BeatenText, Soldier5WinsText, .Script
.Script:
    loadmem wNoRematch, 1
	opentext
	writetext Soldier5AfterBattleText
	waitbutton
	closetext
	end
Soldier5SeenText:
    text "I am ADMIRAL"
    line "DRAKE."

    para "I have commanded"
    line "the HOENN army"
    cont "since before you"
    cont "were born."

    para "I have ended"
    line "many lives."

    para "All just faces"
    line "in my memory."

    para "I can push them"
    line "all down without"
    cont "thinking about it"
    cont "at this point."

    para "I am sorry."

    para "You will be just"
    line "another face."
    done
Soldier5BeatenText:
    text "Remarkable"
    done
Soldier5WinsText:
    text "Forgive me."
    done
Soldier5AfterBattleText:
    text "Listen."

    para "I have lived many"
    line "decades."

    para "Never have I met"
    line "one with such raw"
    cont "potential as you."

    para "Run away now."

    para "I won't tell"
    line "anyone."

    para "Live to grow and"
    line "learn and fight."

    para "Live to save"
    line "your country."
    done

RematchTextWarZone:
    text "How about another"
    line "battle?"
    done

RematchRefuseTextWarZone:
    text "Good luck out"
    line "there."
    done

FightWallaceScript1:
    checkevent EVENT_BEAT_WALLACE
    iftrue .end
    applymovement PLAYER, Movement_FightWallace1
    sjump WallaceScript
.end
    end

FightWallaceScript2:
    checkevent EVENT_BEAT_WALLACE
    iftrue .end
    applymovement PLAYER, Movement_FightWallace2
    sjump WallaceScript
.end
    end

Movement_FightWallace1:
	step UP
	step UP
	step_end

Movement_FightWallace2:
	step UP
	step LEFT
	step UP
	step_end

WarZoneBlueScript1:
    checkevent EVENT_SPOKE_TO_WARZONE_BLUE
    iftrue .end
    showemote EMOTE_SHOCK, PLAYER, 15
    turnobject PLAYER, RIGHT
    sjump WarZoneBlueScript
.end
    end

WarZoneBlueScript2:
    checkevent EVENT_SPOKE_TO_WARZONE_BLUE
    iftrue .end
    showemote EMOTE_SHOCK, PLAYER, 15
    applymovement PLAYER, WarZoneMovement_PlayerUp
    sjump WarZoneBlueScript
.end
    end

WarZoneBlueScript:
    appear WARZONE_BLUE
    applymovement WARZONE_BLUE, WarZoneMovement_BlueApproaches
    opentext
    writetext WarZoneBlueText
    waitbutton
    closetext
    applymovement WARZONE_BLUE, WarZoneMovement_BlueLeaves
    disappear WARZONE_BLUE
    turnobject PLAYER, LEFT
    setevent EVENT_SPOKE_TO_WARZONE_BLUE
    setmapscene WAR_ZONE, SCENE_CUSTOM_1
    end

WarZoneBlueText:
    text "I've got through"
    line "to the national"
    cont "LEAGUE."

    para "I will argue that"
    line "the CHAMPIONs"
    cont "should be exempt"
    cont "from political"
    cont "neutrality."

    para "I'll make an"
    line "argument they"
    cont "have to listen to."

    para "Try to keep"
    line "WALLACE and his"
    cont "forces occupied"
    cont "for a short while."

    para "Prepare yourself"
    line "before fighting"
    cont "WALLACE."

    para "If you lose..."

    para "You won't be coming"
    line "back at the"
    cont "#CENTER."
    done

WarZoneMovement_PlayerUp:
    step UP
    turn_head RIGHT
    step_end

WarZoneMovement_BlueApproaches:
    step UP
    step UP
    step UP
    step LEFT
    step LEFT
    step LEFT
    step LEFT
    step_end

WarZoneMovement_BlueLeaves:
    step RIGHT
    step RIGHT
    step RIGHT
    step RIGHT
    step DOWN
    step DOWN
    step DOWN
    step_end

InvaderOroboroScript:
	trainer INVADER, OROBORO, EVENT_BEAT_INVADER_OROBORO, InvaderOroboroSeenText, InvaderOroboroBeatenText, InvaderOroboroVictoryText, .Script

.Script:
	endifjustbattled
	opentext
	writetext InvaderOroboroAfterBattleText
	waitbutton
	closetext
	end

InvaderOroboroSeenText:
    text "Oh Hi!"

    para "Nope you're not"
    line "making it to"
    cont "boss fog."

    para "Hang on let me"
    line "get my buffs up."
	done

InvaderOroboroVictoryText:
	text "Hahahaha!"
	line "Get recked dude"
	done

InvaderOroboroBeatenText:
	text "No way!"
	line "Good game."
	done

InvaderOroboroAfterBattleText:
	text "There was some"
	line "lag."

	para "That's the only"
	line "reason you won!"
	done

SaveBeforeWallaceScript:
    checkevent EVENT_BEAT_WALLACE
    iftrue .end
    opentext
    writetext AboutToFightWallaceText
    waitbutton
    yesorno
    iffalse .declined
    special TryQuickSave
    iffalse .declined
    closetext
.end
    end
.declined
    closetext
    applymovement PLAYER, WarZoneMovement_PlayerBackward
    end

AboutToFightWallaceText:
	text "Wallace awaits."
	para "You must save your"
	line "game?"
	done

WarZoneMovement_PlayerForward:
    step UP
    step_end

WarZoneMovement_PlayerBackward:
    step DOWN
    step_end
    
JonathanScript:
    faceplayer
	opentext
	checkevent EVENT_BEAT_JONATHAN
	iftrue .FightDone
.fight
    checkevent EVENT_BEAT_WALLACE
    iftrue .wallaceBeat
	writetext JonathanSeenText
	sjump .cont
.wallaceBeat
    writetext JonathanSeenWallaceBeatText
.cont
	waitbutton
	closetext
	checkevent EVENT_BEAT_JONATHAN
	iftrue .skipRequest
	opentext
	writetext JonathanOfferFightText
	waitbutton
	nooryes
	iffalse .refused
	closetext
.skipRequest
	winlosstext JonathanBeatenText, JonathanWinsText
	loadvar VAR_BATTLETYPE, BATTLETYPE_BOSS_BATTLE
	loadtrainer JONATHAN, JONATHAN_1
	startbattle
	ifequal LOSE, .lose
	reloadmapafterbattle
	checkevent EVENT_BEAT_JONATHAN
	iftrue .skipPrize
    opentext
    writetext JonathanGiveAmbrosiaText
    waitbutton
    verbosegiveitem AMBROSIA
    closetext
	setevent EVENT_BEAT_JONATHAN
.skipPrize
	opentext
	writetext JonathanAfterBattleText
	waitbutton
	closetext
	special HealParty
	end
.FightDone:
	writetext JonathanAfterBattleText
	waitbutton
    closetext
	opentext
	writetext RematchTextJonathan
	nooryes
	iftrue .fight
.refused
	writetext RematchRefuseTextJonathan
	waitbutton
	closetext
	end
.lose
    special HealParty
    reloadmap
    opentext
    writetext JonathanWinAfterBattleText
    waitbutton
    closetext
    end
JonathanSeenText:
	text "Hello there hero."
	para "You're a bit late."
	para "I'm here to deal"
	line "with this."
	para "I'm JONATHAN by"
	line "the way."
	para "You've beaten my"
	line "brother ADAM."
	para "Well done on that."
	done
JonathanSeenWallaceBeatText:
	text "So you beat"
	line "WALLACE."
	para "You are a real"
	line "hero after all."
	para "It's actually"
	line "quite nice here"
	cont "when people aren't"
	cont "killing each"
	cont "other."
	done
JonathanOfferFightText:
    text "How about a quick"
    line "training session?"
    done
JonathanBeatenText:
    text "You got this!"
    done
JonathanWinsText:
    text "Better losing to"
    next "me than WALLACE."
    done
JonathanGiveAmbrosiaText:
    text "Here, my dad gave"
    line "me this."
    para "It might help you."
    done
JonathanAfterBattleText:
	text "Well hero, you've"
	line "got to have some"
	cont "important stuff to"
	cont "do."
	para "Try to have fun"
	line "with it."
	done
RematchTextJonathan:
    text "Would you like to"
    line "battle again?"
    done
RematchRefuseTextJonathan:
    text "You're a very busy"
    line "person I see."
    done
JonathanWinAfterBattleText:
	text "That was good!"
	para "Let's keep"
	line "training and"
	cont "you'll get"
	cont "stronger in no"
	cont "time."
	done

WarZone_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  12, 35, FUCHSIA_CITY, 12
	warp_event  13, 35, FUCHSIA_CITY, 12

	def_coord_events
	coord_event  20,  8, SCENE_ALWAYS, SaveBeforeWallaceScript
	coord_event  21,  8, SCENE_ALWAYS, SaveBeforeWallaceScript
	coord_event  20,  7, SCENE_ALWAYS, FightWallaceScript1
	coord_event  21,  7, SCENE_ALWAYS, FightWallaceScript2
	coord_event  7,  32, SCENE_ALWAYS, WarZoneBlueScript1
	coord_event  7,  33, SCENE_ALWAYS, WarZoneBlueScript2

	def_bg_events

	def_object_events
	object_event 20,  4, SPRITE_KOGA, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, WallaceScript, EVENT_BEAT_WALLACE
	object_event 20,  0, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, StevenScript, EVENT_FIELD_MON_7
	object_event 15,  4, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_RIGHT, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CynthiaScript, EVENT_FIELD_MON_8
	object_event 26,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LeonScript, EVENT_FIELD_MON_9
	object_event  4,  3, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSoldier1, EVENT_BEAT_WALLACE
	object_event 21, 23, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSoldier2, EVENT_BEAT_WALLACE
	object_event 35, 27, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSoldier3, EVENT_BEAT_WALLACE
	object_event 23, 12, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSoldier5, EVENT_BEAT_WALLACE

	object_event 12, 35, SPRITE_BLUE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_3
	object_event 20, 10, SPRITE_SILVER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
	object_event 21, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_2
	object_event 34,  4, SPRITE_FALKNER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_DEEP_RED, OBJECTTYPE_TRAINER, 4, InvaderOroboroScript, -1
	object_event 21, 10, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIELD_MON_6
	object_event 20, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 2, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, JonathanScript, -1

	object_event 19,  4, SPRITE_KYOGRE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_WALLACE
	object_event 21,  4, SPRITE_GROUDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_WALLACE
	object_event 20,  3, SPRITE_RAYQUAZA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_BEAT_WALLACE


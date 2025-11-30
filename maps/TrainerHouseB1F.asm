	object_const_def
	const BATTLE_ROULETTE_RECEPTIONIST
	const BATTLE_MIRROR_RECEPTIONIST
	const BATTLE_TRIAL_RECEPTIONIST
	const BATTLE_ARCADE_RECEPTIONIST
	const BATTLE_MIRROR_CHRIS
	const BATTLE_MIRROR_CHRIS_GOLD
	const BATTLE_MIRROR_KRIS
	const BATTLE_MIRROR_KRIS_GOLD

TrainerHouseB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .Chris

.Chris
    disappear BATTLE_MIRROR_CHRIS
    disappear BATTLE_MIRROR_CHRIS_GOLD
    disappear BATTLE_MIRROR_KRIS
    disappear BATTLE_MIRROR_KRIS_GOLD
    endcallback

BattleRouletteReceptionistScript:
	opentext
	writetext BattleRouletteIntroText
	promptbutton
	writetext BattleRouletteAskWantToBattleText
	yesorno
	iffalse .Declined
    writetext NeedToSaveText
    yesorno
    iffalse .Declined
    special TryQuickSave
    iffalse .Declined
	writetext BattleGoRightInText
	waitbutton
	closetext
	applymovement BATTLE_ROULETTE_RECEPTIONIST, Movement_MoveReceptionistOut
	applymovement PLAYER, Movement_EnterBattleRoom
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER

.sample
    random 48
    ifequal 0, .Brock
    ifequal 1, .Misty
    ifequal 2, .Surge
    ifequal 3, .Erika
    ifequal 4, .Janine
    ifequal 5, .Will
    ifequal 6, .Blaine
    ifequal 7, .Giovanni
    ifequal 8, .Falkner
    ifequal 9, .Bugsy
    ifequal 10, .Whitney
    ifequal 11, .Morty
    ifequal 12, .Chuck
    ifequal 13, .Jasmine
    ifequal 14, .Pryce
    ifequal 15, .Clair
    ifequal 16, .Sabrina
    ifequal 17, .Bruno
    ifequal 18, .Karen
    ifequal 19, .Adam
    ifequal 20, .Jonathan
    ifequal 21, .Lance
    ifequal 22, .Steven
    ifequal 23, .Wallace
    ifequal 24, .Cynthia
    ifequal 25, .Leon
    ifequal 26, .Blue
    ifequal 27, .Ash
    ifequal 28, .Red
    ifequal 29, .Patches
    ifequal 30, .Alder
    ifequal 31, .Diantha
    ifequal 32, .Aerith
    ifequal 33, .Yuna
    ifequal 34, .Rocket
    ifequal 35, .Tobias
    ifequal 36, .Henshin
    ifequal 37, .Seto
    ifequal 38, .Yami
    ifequal 39, .Aizen
    ifequal 40, .Xehanort
    ifequal 41, .ChrisChan
    ifequal 42, .Green
    ifequal 43, .Silver
    ifequal 44, .Crystal
    ifequal 45, .Dad
    ifequal 46, .Oak
    ifequal 47, .Hoen
    sjump .sample

.finish
	startbattle
	ifequal WIN, .win
    dontrestartmapmusic
	reloadmap
    warpfacing UP, TRAINER_HOUSE_B1F, 3, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleLoseText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end
.win
    dontrestartmapmusic
	reloadmapafterbattle
    warpfacing UP, TRAINER_HOUSE_B1F, 3, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleWinText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	sjump GivePrize

.Brock
    checkevent EVENT_BEAT_RED
    iffalse .brock1
    loadtrainer BROCK, MASTER_BROCK
    sjump .finish
.brock1
    checkevent EVENT_BEAT_BROCK
    iffalse .sample
    loadtrainer BROCK, BROCK1
    sjump .finish

.Misty
    checkevent EVENT_BEAT_RED
    iffalse .misty1
    loadtrainer MISTY, MASTER_MISTY
    sjump .finish
.misty1
    checkevent EVENT_BEAT_MISTY
    iffalse .sample
    loadtrainer MISTY, MISTY1
    sjump .finish

.Surge
    checkevent EVENT_BEAT_RED
    iffalse .surge1
    loadtrainer LT_SURGE, MASTER_SURGE
    sjump .finish
.surge1
    checkevent EVENT_BEAT_LTSURGE
    iffalse .sample
    loadtrainer LT_SURGE, LT_SURGE1
    sjump .finish

.Erika
    checkevent EVENT_BEAT_RED
    iffalse .erika1
    loadtrainer ERIKA, MASTER_ERIKA
    sjump .finish
.erika1
    checkevent EVENT_BEAT_ERIKA
    iffalse .sample
    loadtrainer ERIKA, ERIKA1
    sjump .finish

.Janine
    checkevent EVENT_BEAT_RED
    iffalse .janine1
    loadtrainer JANINE, MASTER_JANINE
    sjump .finish
.janine1
    checkevent EVENT_BEAT_JANINE
    iffalse .sample
    loadtrainer JANINE, JANINE1
    sjump .finish

.Will
    checkevent EVENT_BEAT_RED
    iffalse .will1
    loadtrainer WILL, MASTER_WILL
    sjump .finish
.will1
    checkevent EVENT_BEAT_WILL
    iffalse .sample
    loadtrainer WILL, WILL1
    sjump .finish

.Blaine
    checkevent EVENT_BEAT_RED
    iffalse .blaine1
    loadtrainer BLAINE, MASTER_BLAINE
    sjump .finish
.blaine1
    checkevent EVENT_BEAT_BLAINE
    iffalse .sample
    loadtrainer BLAINE, BLAINE1
    sjump .finish

.Giovanni
    checkevent EVENT_BEAT_RED
    iffalse .Giovanni1
    loadtrainer GIOVANNI, MASTER_GIOVANNI
    sjump .finish
.Giovanni1
    checkevent EVENT_BEAT_GIOVANNI
    iffalse .sample
    loadtrainer GIOVANNI, LEADER_GIOVANNI
    sjump .finish

.Falkner
    checkevent EVENT_BEAT_RED
    iffalse .Falkner1
    loadtrainer FALKNER, MASTER_FALKNER
    sjump .finish
.Falkner1
    checkevent EVENT_BEAT_FALKNER
    iffalse .sample
    loadtrainer FALKNER, FALKNER1
    sjump .finish

.Bugsy
    checkevent EVENT_BEAT_RED
    iffalse .Bugsy1
    loadtrainer BUGSY, MASTER_BUGSY
    sjump .finish
.Bugsy1
    checkevent EVENT_BEAT_BUGSY
    iffalse .sample
    loadtrainer BUGSY, BUGSY1
    sjump .finish

.Whitney
    checkevent EVENT_BEAT_RED
    iffalse .Whitney1
    loadtrainer WHITNEY, MASTER_WHITNEY
    sjump .finish
.Whitney1
    checkevent EVENT_BEAT_WHITNEY
    iffalse .sample
    loadtrainer WHITNEY, WHITNEY1
    sjump .finish

.Morty
    checkevent EVENT_BEAT_RED
    iffalse .Morty1
    loadtrainer MORTY, MASTER_MORTY
    sjump .finish
.Morty1
    checkevent EVENT_BEAT_MORTY
    iffalse .sample
    loadtrainer MORTY, MORTY1
    sjump .finish

.Chuck
    checkevent EVENT_BEAT_RED
    iffalse .Chuck1
    loadtrainer CHUCK, MASTER_CHUCK
    sjump .finish
.Chuck1
    checkevent EVENT_BEAT_CHUCK
    iffalse .sample
    loadtrainer CHUCK, CHUCK1
    sjump .finish

.Jasmine
    checkevent EVENT_BEAT_RED
    iffalse .Jasmine1
    loadtrainer JASMINE, MASTER_JASMINE
    sjump .finish
.Jasmine1
    checkevent EVENT_BEAT_JASMINE
    iffalse .sample
    loadtrainer JASMINE, JASMINE1
    sjump .finish

.Pryce
    checkevent EVENT_BEAT_RED
    iffalse .Pryce1
    loadtrainer PRYCE, MASTER_PRYCE
    sjump .finish
.Pryce1
    checkevent EVENT_BEAT_PRYCE
    iffalse .sample
    loadtrainer PRYCE, PRYCE1
    sjump .finish

.Clair
    checkevent EVENT_BEAT_RED
    iffalse .Clair1
    loadtrainer CLAIR, MASTER_CLAIR
    sjump .finish
.Clair1
    checkevent EVENT_BEAT_CLAIR
    iffalse .sample
    loadtrainer CLAIR, CLAIR1
    sjump .finish

.Sabrina
    checkevent EVENT_BEAT_RED
    iffalse .Sabrina1
    loadtrainer SABRINA, MASTER_SABRINA
    sjump .finish
.Sabrina1
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .sample
    loadtrainer SABRINA, SABRINA1
    sjump .finish

.Bruno
    checkevent EVENT_BEAT_RED
    iffalse .Bruno1
    loadtrainer BRUNO, MASTER_BRUNO
    sjump .finish
.Bruno1
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .sample
    loadtrainer BRUNO, BRUNO1
    sjump .finish

.Karen
    checkevent EVENT_BEAT_RED
    iffalse .Karen1
    loadtrainer KAREN, MASTER_KAREN
    sjump .finish
.Karen1
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .sample
    loadtrainer KAREN, KAREN1
    sjump .finish

.Adam
    checkevent EVENT_BEAT_MASTER_ADAM
    iffalse .Adam1
    loadtrainer ADAM, MASTER_ADAM
    sjump .finish
.Adam1
    checkevent EVENT_BEAT_RED
    iffalse .Adam2
    loadtrainer ADAM, ADAM_ARCADE
    sjump .finish
.Adam2
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .sample
    loadtrainer ADAM, ADAM_ELITE
    sjump .finish

.Jonathan
    checkevent EVENT_BEAT_RED
    iffalse .Jonathan1
    loadtrainer JONATHAN, MASTER_JONATHAN
    sjump .finish
.Jonathan1
    checkevent EVENT_BEAT_WALLACE
    iffalse .sample
    loadtrainer JONATHAN, JONATHAN_1
    sjump .finish

.Lance
    checkevent EVENT_BEAT_RED
    iffalse .Lance1
    loadtrainer CHAMPION, LANCE_ARCADE
    sjump .finish
.Lance1
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .sample
    loadtrainer CHAMPION, LANCE
    sjump .finish

.Red
    checkevent EVENT_BEAT_RED
    iffalse .sample
    loadtrainer RED, RED1
    sjump .finish

.Blue
    checkevent EVENT_BEAT_RED
    iffalse .Blue1
    loadtrainer BLUE, BLUE_ARCADE
    sjump .finish
.Blue1
    checkevent EVENT_BEAT_BLUE
    iffalse .sample
    loadtrainer BLUE, BLUE1
    sjump .finish

.Ash
    checkevent EVENT_BEAT_ASH
    iffalse .sample
    loadtrainer ASH, ASH1
    sjump .finish

.Steven
    checkevent EVENT_BEAT_RED
    iffalse .Steven1
    loadtrainer STEVEN, MASTER_STEVEN
    sjump .finish
.Steven1
    checkevent EVENT_BEAT_STEVEN
    iffalse .sample
    loadtrainer STEVEN, CHAMP_STEVEN
    sjump .finish

.Cynthia
    checkevent EVENT_BEAT_RED
    iffalse .Cynthia1
    loadtrainer CYNTHIA, MASTER_CYNTHIA
    sjump .finish
.Cynthia1
    checkevent EVENT_BEAT_CYNTHIA
    iffalse .sample
    loadtrainer CYNTHIA, CHAMP_CYNTHIA
    sjump .finish

.Leon
    checkevent EVENT_BEAT_RED
    iffalse .Leon1
    loadtrainer LEON, MASTER_LEON
    sjump .finish
.Leon1
    checkevent EVENT_BEAT_LEON
    iffalse .sample
    loadtrainer LEON, CHAMP_LEON
    sjump .finish

.Wallace
    checkevent EVENT_BEAT_MASTER_WALLACE
    iffalse .Wallace1
    loadtrainer WALLACE, MASTER_WALLACE
    sjump .finish
.Wallace1
    checkevent EVENT_BEAT_WALLACE
    iffalse .sample
    loadtrainer WALLACE, EMPEROR_WALLACE
    sjump .finish

.Patches
    checkevent EVENT_BEAT_INVADER_MANUS
    iffalse .Patches1
    loadtrainer INVADER, MANUS
    sjump .finish
.Patches1
    checkevent EVENT_BEAT_INVADER_PATCHES
    iffalse .sample
    loadtrainer INVADER, PATCHES
    sjump .finish

.Alder
    checkevent EVENT_BEAT_RED
    iffalse .sample
    loadtrainer HIKER, MASTER_ALDER
    sjump .finish

.Diantha
    checkevent EVENT_BEAT_RED
    iffalse .sample
    loadtrainer BEAUTY, MASTER_DIANTHA
    sjump .finish

.Aerith
    checkevent EVENT_BEAT_RED
    iffalse .Aerith2
    loadtrainer KIMONO_GIRL, MASTER_AERITH
    sjump .finish
.Aerith2
    checkevent EVENT_BEAT_AERITH_2
    iffalse .Aerith1
    loadtrainer KIMONO_GIRL, AERITH_2
    sjump .finish
.Aerith1
    checkevent EVENT_BEAT_AERITH_1
    iffalse .sample
    loadtrainer KIMONO_GIRL, AERITH_1
    sjump .finish

.Yuna
    checkevent EVENT_BEAT_RED
    iffalse .Yuna2
    loadtrainer KIMONO_GIRL, MASTER_YUNA
    sjump .finish
.Yuna2
    checkevent EVENT_BEAT_YUNA_2
    iffalse .Yuna1
    loadtrainer KIMONO_GIRL, YUNA_2
    sjump .finish
.Yuna1
    checkevent EVENT_BEAT_YUNA_1
    iffalse .sample
    loadtrainer KIMONO_GIRL, YUNA_1
    sjump .finish

.Rocket
    checkevent EVENT_BEAT_RED
    iffalse .Rocket2
    loadtrainer EXECUTIVEF, MASTER_EXECUTIVEF
    sjump .finish
.Rocket2
    checkevent EVENT_BEAT_ROCKET_EXECUTIVEM_1
    iffalse .Rocket1
    loadtrainer EXECUTIVEF, EXECUTIVEM_1
    sjump .finish
.Rocket1
    checkevent EVENT_BEAT_ROCKET_EXECUTIVEF_2
    iffalse .Rocket0
    loadtrainer EXECUTIVEF, EXECUTIVEF_1
    sjump .finish
.Rocket0
    loadtrainer GRUNTM, GRUNTM_1
    sjump .finish

.Tobias
    checkevent EVENT_BEAT_MASTER_TOBIAS
    iffalse .Tobias1
    loadtrainer COOLTRAINERM, MASTER_TOBIAS
    sjump .finish
.Tobias1
    checkevent EVENT_BEAT_TOBIAS
    iffalse .sample
    loadtrainer COOLTRAINERM, TOBIAS
    sjump .finish

.Henshin
	setval MUSIC_RED_DUNGEON
	writemem wBattleMusicOverride
    loadtrainer SAGE, HENSHIN
    sjump .finish

.Seto
    checkevent EVENT_BEAT_RED
    iffalse .Seto1
    loadtrainer BLUE, MASTER_SETO
    sjump .finish
.Seto1
    checkevent EVENT_BEAT_SETO
    iffalse .sample
    loadtrainer BLUE, SETO
    sjump .finish

.Yami
    checkevent EVENT_BEAT_RED
    iffalse .Yami1
    loadtrainer ASH, ATEM
    sjump .finish
.Yami1
    checkevent EVENT_BEAT_YAMI
    iffalse .sample
    loadtrainer ASH, ATEM
    sjump .finish

.Aizen
    checkevent EVENT_BEAT_RED
    iffalse .Aizen1
    loadtrainer POKEMANIAC, MASTER_AIZEN
    sjump .finish
.Aizen1
    checkevent EVENT_BEAT_AIZEN
    iffalse .sample
    loadtrainer POKEMANIAC, AIZEN
    sjump .finish

.Xehanort
    checkevent EVENT_BEAT_RED
    iffalse .Xehanort1
    loadtrainer SAGE, MASTER_XEHANORT
    sjump .finish
.Xehanort1
    checkevent EVENT_BEAT_XEHANORT
    iffalse .sample
    loadtrainer SAGE, XEHANORT
    sjump .finish

.Eusine
    checkevent EVENT_BEAT_RED
    iffalse .Eusine2
    loadtrainer MYSTICALMAN, MASTER_EUSINE
    sjump .finish
.Eusine2
    checkevent EVENT_BEAT_CELADON_EUSINE
    iffalse .Eusine1
    loadtrainer MYSTICALMAN, EUSINE_CELADON
    sjump .finish
.Eusine1
    checkevent EVENT_FOUGHT_EUSINE
    iffalse .sample
    loadtrainer MYSTICALMAN, EUSINE
    sjump .finish

.ChrisChan
    checkevent EVENT_BEAT_MASTER_CHRIS_CHAN
    iffalse .sample
    loadtrainer POKEFANM, MASTER_CHRIS_CHAN
    sjump .finish

.Green
    checkevent EVENT_BEAT_RED
    iffalse .green1
    loadtrainer LEAF, MASTER_GREEN
    sjump .finish
.green1
    checkevent EVENT_BEAT_GREEN
    iffalse .sample
    loadtrainer LEAF, GREEN1
    sjump .finish

.Silver
    checkevent EVENT_BEAT_MASTER_RIVAL
    iffalse .Silver7
    loadtrainer RIVAL2, MASTER_RIVAL
    sjump .finish
.Silver7
    checkevent EVENT_BEAT_SILVER_CAVE_RIVAL
    iffalse .Silver6
    loadtrainer RIVAL2, RIVAL2_SILVER_CAVE
    sjump .finish
.Silver6
    checkevent EVENT_BEAT_RIVAL_SAFFRON
    iffalse .Silver5
    loadtrainer RIVAL2, RIVAL2_SAFFRON
    sjump .finish
.Silver5
    checkevent EVENT_BEAT_CLAIR
    iffalse .Silver4
    loadtrainer RIVAL1, RIVAL1_5_CYNDAQUIL
    sjump .finish
.Silver4
    checkevent EVENT_BEAT_PRYCE
    iffalse .Silver3
    loadtrainer RIVAL1, RIVAL1_4_CYNDAQUIL
    sjump .finish
.Silver3
    checkevent EVENT_BEAT_WHITNEY
    iffalse .Silver2
    loadtrainer RIVAL1, RIVAL1_3_CYNDAQUIL
    sjump .finish
.Silver2
    checkevent EVENT_BEAT_FALKNER
    iffalse .Silver1
    loadtrainer RIVAL1, RIVAL1_2_CYNDAQUIL
    sjump .finish
.Silver1
    loadtrainer RIVAL1, RIVAL1_1_CYNDAQUIL
    sjump .finish

.Crystal
    checkevent EVENT_BEAT_MASTER_CRYSTAL
    iffalse .Crystal7
    loadtrainer CRYSTAL, MASTER_CRYSTAL
    sjump .finish
.Crystal7
    checkevent EVENT_BEAT_CRYSTAL_7
    iffalse .Crystal6
    loadtrainer CRYSTAL, CRYSTAL_7
    sjump .finish
.Crystal6
    checkevent EVENT_BEAT_CRYSTAL_6
    iffalse .Crystal5
    loadtrainer CRYSTAL, CRYSTAL_6
    sjump .finish
.Crystal5
    checkevent EVENT_BEAT_CRYSTAL_5
    iffalse .Crystal4
    loadtrainer CRYSTAL, CRYSTAL_5
    sjump .finish
.Crystal4
    checkevent EVENT_BEAT_CRYSTAL_4
    iffalse .Crystal3
    loadtrainer CRYSTAL, CRYSTAL_4
    sjump .finish
.Crystal3
    checkevent EVENT_BEAT_CRYSTAL_3
    iffalse .Crystal2
    loadtrainer CRYSTAL, CRYSTAL_3
    sjump .finish
.Crystal2
    checkevent EVENT_BEAT_CRYSTAL_2
    iffalse .Crystal1
    loadtrainer CRYSTAL, CRYSTAL_2
    sjump .finish
.Crystal1
    checkevent EVENT_BEAT_CRYSTAL_1
    iffalse .sample
    loadtrainer CRYSTAL, CRYSTAL_1
    sjump .finish

.Dad
    checkevent EVENT_BEAT_DAD
    iffalse .sample
    loadtrainer DAD, DAD_1
    sjump .finish

.Oak
    checkevent EVENT_BEAT_RED
    iffalse .Oak1
    loadtrainer POKEMON_PROF, MASTER_OAK
    sjump .finish
.Oak1
    checkevent EVENT_BEAT_OAK
    iffalse .sample
    loadtrainer POKEMON_PROF, OAK
    sjump .finish

.Hoen
    loadtrainer SOLDIER, SOLDIER_SPY
    sjump .finish

.Declined:
	writetext PleaseComeAgainText
	waitbutton
	closetext
	end

GivePrize:
    opentext
; 1% chance prizes
    random 100
    ifequal 0, .Ambrosia
    ifequal 1, .Masterball
    ifequal 2, .ChoiceSpecs
    ifequal 3, .ChoiceBand
    ifequal 4, .Leftovers
    ifequal 5, .LifeOrb
    ifequal 6, .FocusSash
    ifequal 7, .ExpertBelt
    ifequal 8, .MuscleBand
    ifequal 9, .WiseGlasses
    ifequal 10, .RareCandy
    ifequal 69, .AssaultVest
    ifequal 70, .HeavyBoots
    ifequal 99, .LuckyEgg

; 2% prizes
    ifequal 11, .PinkBow
    ifequal 12, .PinkBow
    ifequal 13, .Blackbelt
    ifequal 14, .Blackbelt
    ifequal 15, .SharpBeak
    ifequal 16, .SharpBeak
    ifequal 17, .PoisonBarb
    ifequal 18, .PoisonBarb
    ifequal 19, .SoftSand
    ifequal 20, .SoftSand
    ifequal 21, .HardStone
    ifequal 22, .HardStone
    ifequal 23, .SilverPowder
    ifequal 24, .SilverPowder
    ifequal 25, .SpellTag
    ifequal 26, .SpellTag
    ifequal 27, .Charcoal
    ifequal 28, .Charcoal
    ifequal 29, .MysticWater
    ifequal 30, .MysticWater
    ifequal 31, .MiracleSeed
    ifequal 32, .MiracleSeed
    ifequal 33, .Magnet
    ifequal 34, .Magnet
    ifequal 35, .TwistedSpoon
    ifequal 36, .TwistedSpoon
    ifequal 37, .NeverMeltIce
    ifequal 38, .NeverMeltIce
    ifequal 39, .DragonScale
    ifequal 40, .DragonScale
    ifequal 41, .BlackGlasses
    ifequal 42, .BlackGlasses
    ifequal 43, .MetalCoat
    ifequal 44, .MetalCoat
    ifequal 45, .PolkadotBow
    ifequal 46, .PolkadotBow
    ifequal 47, .MiracleBerry
    ifequal 48, .MiracleBerry
    ifequal 49, .Nugget
    ifequal 50, .Nugget

; 3% prizes
    ifequal 51, .Protein
    ifequal 52, .Protein
    ifequal 53, .Protein
    ifequal 54, .Iron
    ifequal 55, .Iron
    ifequal 56, .Iron
    ifequal 57, .Carbos
    ifequal 58, .Carbos
    ifequal 59, .Carbos
    ifequal 60, .Calcium
    ifequal 61, .Calcium
    ifequal 62, .Calcium
    ifequal 63, .HpUp
    ifequal 64, .HpUp
    ifequal 65, .HpUp
    ifequal 66, .PpUp
    ifequal 67, .PpUp
    ifequal 68, .PpUp

; 5% prizes
    ifequal 71, .FullRestore
    ifequal 72, .FullRestore
    ifequal 73, .FullRestore
    ifequal 74, .FullRestore
    ifequal 75, .FullRestore
    ifequal 76, .PokeBall
    ifequal 77, .PokeBall
    ifequal 78, .PokeBall
    ifequal 79, .PokeBall
    ifequal 80, .PokeBall
    ifequal 81, .GreatBall
    ifequal 82, .GreatBall
    ifequal 83, .GreatBall
    ifequal 84, .GreatBall
    ifequal 85, .GreatBall
    ifequal 86, .UltraBall
    ifequal 87, .UltraBall
    ifequal 88, .UltraBall
    ifequal 89, .UltraBall
    ifequal 90, .UltraBall
    ifequal 91, .MaxRevive
    ifequal 92, .MaxRevive
    ifequal 93, .MaxRevive
    ifequal 94, .MaxRevive
    ifequal 95, .MaxElixer
    ifequal 96, .MaxElixer
    ifequal 97, .MaxElixer
    ifequal 98, .MaxElixer
    end

.Ambrosia:
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .HpUp
    verbosegiveitem AMBROSIA
    sjump .done
.Masterball:
    verbosegiveitem MASTER_BALL
    sjump .done
.ChoiceSpecs:
    verbosegiveitem CHOICE_SPECS
    sjump .done
.ChoiceBand:
    verbosegiveitem CHOICE_BAND
    sjump .done
.Leftovers:
    verbosegiveitem LEFTOVERS
    sjump .done
.LifeOrb:
    verbosegiveitem LIFE_ORB
    sjump .done
.FocusSash:
    verbosegiveitem FOCUS_SASH
    sjump .done
.ExpertBelt:
    verbosegiveitem EXPERT_BELT
    sjump .done
.MuscleBand:
    verbosegiveitem MUSCLE_BAND
    sjump .done
.WiseGlasses:
    verbosegiveitem WISE_GLASSES
    sjump .done
.RareCandy:
    verbosegiveitem RARE_CANDY
    sjump .done
.PinkBow:
    verbosegiveitem PINK_BOW
    sjump .done
.Blackbelt:
    verbosegiveitem BLACKBELT_I
    sjump .done
.SharpBeak:
    verbosegiveitem SHARP_BEAK
    sjump .done
.PoisonBarb:
    verbosegiveitem POISON_BARB
    sjump .done
.SoftSand:
    verbosegiveitem SOFT_SAND
    sjump .done
.HardStone:
    verbosegiveitem HARD_STONE
    sjump .done
.SilverPowder:
    verbosegiveitem SILVERPOWDER
    sjump .done
.SpellTag:
    verbosegiveitem SPELL_TAG
    sjump .done
.Charcoal:
    verbosegiveitem CHARCOAL
    sjump .done
.MysticWater:
    verbosegiveitem MYSTIC_WATER
    sjump .done
.MiracleSeed:
    verbosegiveitem MIRACLE_SEED
    sjump .done
.Magnet:
    verbosegiveitem MAGNET
    sjump .done
.TwistedSpoon:
    verbosegiveitem TWISTEDSPOON
    sjump .done
.NeverMeltIce:
    verbosegiveitem NEVERMELTICE
    sjump .done
.DragonScale:
    verbosegiveitem DRAGON_SCALE
    sjump .done
.BlackGlasses:
    verbosegiveitem BLACKGLASSES
    sjump .done
.MetalCoat:
    verbosegiveitem METAL_COAT
    sjump .done
.PolkadotBow:
    verbosegiveitem POLKADOT_BOW
    sjump .done
.MiracleBerry:
    verbosegiveitem MIRACLEBERRY
    sjump .done
.Nugget:
    verbosegiveitem NUGGET
    sjump .done
.Protein:
    verbosegiveitem PROTEIN
    sjump .done
.Iron:
    verbosegiveitem IRON
    sjump .done
.Carbos:
    verbosegiveitem CARBOS
    sjump .done
.Calcium:
    verbosegiveitem CALCIUM
    sjump .done
.HpUp:
    verbosegiveitem HP_UP
    sjump .done
.PpUp:
    verbosegiveitem PP_MAX
    sjump .done
.MaxElixer:
    verbosegiveitem MAX_ELIXER
    sjump .done
.AssaultVest:
    verbosegiveitem ASSAULT_VEST
    sjump .done
.HeavyBoots:
    verbosegiveitem HEAVY_BOOTS
    sjump .done
.LuckyEgg:
    verbosegiveitem LUCKY_EGG
    sjump .done
.FullRestore:
    verbosegiveitem FULL_RESTORE
    sjump .done
.PokeBall:
    verbosegiveitem POKE_BALL
    sjump .done
.GreatBall:
    verbosegiveitem GREAT_BALL
    sjump .done
.UltraBall:
    verbosegiveitem ULTRA_BALL
    sjump .done
.MaxRevive:
    verbosegiveitem MAX_REVIVE
.done
	closetext
	end
	
BattleMirrorReceptionistScript:
    opentext
    writetext BattleMirrorIntroText
    waitbutton
    yesorno
    iffalse .Declined
    writetext NeedToSaveText
    yesorno
    iffalse .Declined
    special TryQuickSave
    iffalse .Declined
    writetext BattleGoRightInText
    waitbutton
    closetext
	applymovement BATTLE_MIRROR_RECEPTIONIST, Movement_MoveReceptionistOut
	applymovement PLAYER, Movement_EnterBattleRoom
	pause 15
	readmem wMarkOfGod
	ifequal 0, .normalChris
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .goldKris
	appear BATTLE_MIRROR_CHRIS_GOLD
	sjump .fightCal
.goldKris
  	appear BATTLE_MIRROR_KRIS_GOLD
  	sjump .fightCal
.normalChris
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .normalKris
	appear BATTLE_MIRROR_CHRIS
	sjump .fightCal
.normalKris
    appear BATTLE_MIRROR_KRIS
.fightCal
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .Female
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer CAL, CAL1
	startbattle
	ifequal WIN, .Win
	sjump .over
.Female
    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	loadtrainer CAL_F, CAL_F1
	startbattle
	ifequal WIN, .Win
.over
    dontrestartmapmusic
	reloadmap
    warpfacing UP, TRAINER_HOUSE_B1F, 17, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleLoseText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end
.Win
    dontrestartmapmusic
	reloadmapafterbattle
    warpfacing UP, TRAINER_HOUSE_B1F, 17, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleWinText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	sjump GiveBattleMirrorPrize
.Declined:
	writetext PleaseComeAgainText
	waitbutton
	closetext
	end

GiveBattleMirrorPrize:
    opentext
    random 14
    ifequal 0, .StarPiece
    ifequal 1, .SilverLeaf
    ifequal 2, .GoldLeaf
    ifequal 3, .TeruSama
    ifequal 4, .BigMushroom
    ifequal 5, .CleanseTag
    ifequal 6, .SlowpokeTail
    ifequal 7, .BigPearl
    ifequal 8, .RageCandyBar
    ifequal 9, .SacredAsh
    ifequal 10, .BrickPiece
    ifequal 11, .MirageMail
    ifequal 12, .MusicMail
    ifequal 13, .MiracleBerry
.StarPiece
    verbosegiveitem STAR_PIECE
    closetext
    end
.SilverLeaf
    verbosegiveitem SILVER_LEAF
    closetext
    end
.GoldLeaf
    verbosegiveitem GOLD_LEAF
    closetext
    end
.TeruSama
    verbosegiveitem ITEM_BE
    closetext
    end
.BigMushroom
    verbosegiveitem BIG_MUSHROOM
    closetext
    end
.CleanseTag
    verbosegiveitem CLEANSE_TAG
    closetext
    end
.SlowpokeTail
    verbosegiveitem SLOWPOKETAIL
    closetext
    end
.BigPearl
    verbosegiveitem BIG_PEARL
    closetext
    end
.RageCandyBar
    verbosegiveitem RAGECANDYBAR
    closetext
    end
.SacredAsh
    verbosegiveitem SACRED_ASH
    closetext
    end
.BrickPiece
    verbosegiveitem BRICK_PIECE
    closetext
    end
.MirageMail
    verbosegiveitem MIRAGE_MAIL
    closetext
    end
.MusicMail
    verbosegiveitem MUSIC_MAIL
    closetext
    end
.MiracleBerry
    verbosegiveitem MIRACLEBERRY
    closetext
    end

BattleTrialReceptionistScript:
    opentext
    writetext BattleTrialIntroText
    waitbutton
    yesorno
    iffalse .Declined
    writetext NeedToSaveText
    yesorno
    iffalse .Declined
    special TryQuickSave
    iffalse .Declined
    checkevent EVENT_BEAT_BATTLE_TRIAL_MASTER
    iftrue .ImpossibleUnlocked
    checkevent EVENT_BEAT_BATTLE_TRIAL
    iftrue .MasterUnlocked
    sjump .Standard

.ImpossibleUnlocked:
    writetext WhatTrialText
	loadmenu .ImpossibleMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Standard
	ifequal 2, .Master
	ifequal 3, .Impossible
	closetext
	end
.ImpossibleMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 12, 7
	dw .ImpossibleMenuData
	db 1 ; default option
.ImpossibleMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 3, 1 ; rows, columns
	db 5 ; spacing
	dba .ImpossibleText
	dbw BANK(@), NULL
.ImpossibleText:
	db "Normal@"
	db "Master@"
	db "Impossible@"

.MasterUnlocked:
    writetext WhatTrialText
	loadmenu .MasterMenuHeader
	_2dmenu
	closewindow
	ifequal 1, .Standard
	ifequal 2, .Master
	closetext
	end
.MasterMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 9, 5
	dw .MasterMenuData
	db 1 ; default option
.MasterMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 5 ; spacing
	dba .MasterText
	dbw BANK(@), NULL
.MasterText:
	db "Normal@"
	db "Master@"

.Standard
    writetext ExplainStandardTrialText
    waitbutton
    writetext BattleGoRightInText
    waitbutton
    closetext
	applymovement BATTLE_TRIAL_RECEPTIONIST, Movement_MoveReceptionistOut
	applymovement PLAYER, Movement_EnterBattleRoom

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer YOUNGSTER, JULIUS
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial2Text
	waitbutton
	closetext
	setval MUSIC_HO_OH_BATTLE
	writemem wBattleMusicOverride
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer SAGE, LI
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial3Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer FALKNER, FALKNER1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem HP_UP
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial4Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer INVADER, SIEGMEYER
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial5Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer GRUNTM, GRUNTM_1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial6Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer BUGSY, BUGSY1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem NUGGET
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial7Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer POKEFANM, BRANDON
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial8Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer INVADER, LAUTREC
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial9Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer WHITNEY, WHITNEY1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem QUICK_CLAW
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial10Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer MORTY, MORTY1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial11Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer KIMONO_GIRL, AERITH_1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial12Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer KIMONO_GIRL, YUNA_1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem FOCUS_SASH
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial13Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer MYSTICALMAN, EUSINE
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial14Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer CHUCK, CHUCK1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial15Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer JASMINE, JASMINE1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem LIFE_ORB
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial16Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer GRUNTF, GRUNTF_4
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial17Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer GRUNTM, GRUNTM_31
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial18Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer PRYCE, PRYCE1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem CHOICE_BAND
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial19Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer INVADER, LOGAN
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial20Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer CLAIR, CLAIR1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial21Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer WHITNEY, JOY2
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem CHOICE_SPECS
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial22Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer SABRINA, SABRINA1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial23Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer BRUNO, BRUNO1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial24Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer KAREN, KAREN1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem LEFTOVERS
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial25Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer INVADER, SOLAIRE
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial26Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer ADAM, ADAM_ELITE
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial27Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer CHAMPION, LANCE
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem AMBROSIA
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial28Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer POKEMON_PROF, PROF_OAK
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial29Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer JONATHAN, JONATHAN_1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial30Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer WALLACE, EMPEROR_WALLACE
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	setevent EVENT_BEAT_BATTLE_TRIAL
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem STAR_PRIZE
	writetext TrialUnlockMasterText
	waitbutton
	closetext
	sjump .Win

.Master
    writetext ExplainMasterTrialText
    waitbutton
    writetext BattleGoRightInText
    waitbutton
    closetext
	applymovement BATTLE_TRIAL_RECEPTIONIST, Movement_MoveReceptionistOut
	applymovement PLAYER, Movement_EnterBattleRoom

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer STEVEN, MASTER_STEVEN
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial2Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer CYNTHIA, MASTER_CYNTHIA
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial3Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer LEON, MASTER_LEON
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem AMBROSIA
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext Trial4Text
	waitbutton
	closetext

    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer ASH, ASH1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial5Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer RED, RED1
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial6Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer POKEMON_PROF, MASTER_OAK
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	setevent EVENT_BEAT_BATTLE_TRIAL_MASTER
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem SILVER_PRIZE
	writetext TrialUnlockImpossibleText
	waitbutton
	closetext
	sjump .Win

.Impossible
    writetext ExplainImpossibleTrialText
    waitbutton
    writetext BattleGoRightInText
    waitbutton
    closetext
	applymovement BATTLE_TRIAL_RECEPTIONIST, Movement_MoveReceptionistOut
	applymovement PLAYER, Movement_EnterBattleRoom

	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer WALLACE, MASTER_WALLACE
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial2Text
	waitbutton
	closetext
    winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer LEAF, MASTER_GREEN
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext Trial3Text
	waitbutton
	closetext
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer CHAMPION, MASTER_LANCE
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext NowHeal
	waitbutton
	special LoadPokemonData
	special HealParty
	writetext TrialLeaderText
	waitbutton
	closetext
	special HealParty
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
    loadtrainer ASH, MASTER_ASH
	startbattle
	ifequal LOSE, .Lose
	reloadmap
	opentext
	writetext AcceptPrize
	waitbutton
	verbosegiveitem GOLD_PRIZE
	writetext TrialCongratsText
	waitbutton
	closetext

.Win
    dontrestartmapmusic
	reloadmapafterbattle
	setevent EVENT_BEAT_BATTLE_TRIAL
    warpfacing UP, TRAINER_HOUSE_B1F, 31, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleWinNoPrizeText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end
.Lose
    dontrestartmapmusic
    reloadmap
    warpfacing UP, TRAINER_HOUSE_B1F, 31, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleLoseText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
	end
.Declined:
	writetext PleaseComeAgainText
	waitbutton
	closetext
	end

BattleArcadeReceptionistScript:
	opentext
	writetext BattleArcadeIntroText
	yesorno
	iffalse .Declined
    writetext NeedToSaveText
    yesorno
    iffalse .Declined
    special TryQuickSave
    iffalse .Declined
    setval 0
    writemem wHandOfGod
    setval 1
    writemem wShinyOverride
	setval WEATHER_NONE
	writemem wFieldWeather
   ; writetext WantToPlayAsAnotherText
   ; yesorno
   ; iffalse .pickEnemy
    sjump .ChoosePlayerCharacter
.pickEnemy
    writetext FineThenText
    waitbutton
.chooseEnemy
    sjump .ChooseEnemyCharacter
.beginBattle
	writetext BattleGoRightInText
	waitbutton
	closetext
	applymovement BATTLE_ARCADE_RECEPTIONIST, Movement_MoveReceptionistOut
	applymovement PLAYER, Movement_EnterBattleRoom
	winlosstext victoryText, defeatText
    loadvar VAR_BATTLETYPE, BATTLETYPE_BATTLE_FRONTIER
	startbattle
	ifequal WIN, .win
	dontrestartmapmusic
	reloadmap
    warpfacing UP, TRAINER_HOUSE_B1F, 45, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleLoseText
	waitbutton
	closetext
	special LoadPokemonData
	special HealParty
    setval 0
    writemem wShinyOverride
	end
.win
    dontrestartmapmusic
	reloadmapafterbattle
    warpfacing UP, TRAINER_HOUSE_B1F, 45, 13
    turnobject PLAYER, UP
	opentext
	writetext BattleWinText
	waitbutton
	verbosegiveitem GOLD_BERRY
	closetext
	special LoadPokemonData
	special HealParty
    setval 0
    writemem wShinyOverride
	end
.Declined:
	writetext PleaseComeAgainText
	waitbutton
	closetext
	end

.ChoosePlayerCharacter:
	setval BATTLETYPE_BATTLE_FRONTIER
	writemem wBattleType
    writetext PickYourPlayerText
    checkevent EVENT_BEAT_RED
    iffalse .notBeatRedPlayerMenu
    loadmenu .PostRedCharacterMenuHeader
    _2dmenu
    sjump .donePlayerMenu
.notBeatRedPlayerMenu
    checkevent EVENT_BEAT_WALLACE
    iffalse .notBeatWallacePlayerMenu
    loadmenu .PostWallaceCharacterMenuHeader
    _2dmenu
    sjump .donePlayerMenu
.notBeatWallacePlayerMenu
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .notBeatE4PlayerMenu
    loadmenu .PostE4CharacterMenuHeader
    _2dmenu
    sjump .donePlayerMenu
.notBeatE4PlayerMenu
    loadmenu .DefaultCharacterMenuHeader
    _2dmenu
.donePlayerMenu

	closewindow
	ifequal 1, .FalknerPlayer
	ifequal 2, .BugsyPlayer
	ifequal 3, .WhitneyPlayer
	ifequal 4, .MortyPlayer
	ifequal 5, .ChuckPlayer
	ifequal 6, .JasminePlayer
	ifequal 7, .PrycePlayer
	ifequal 8, .ClairPlayer
	ifequal 9, .BrockPlayer
	ifequal 10, .MistyPlayer
	ifequal 11, .SurgePlayer
	ifequal 12, .ErikaPlayer
	ifequal 13, .JaninePlayer
	ifequal 14, .WillPlayer
	ifequal 15, .BlainePlayer
	ifequal 16, .SabrinaPlayer
	ifequal 17, .BrunoPlayer
	ifequal 18, .KarenPlayer
	ifequal 19, .GiovanniPlayer
	ifequal 20, .OakPlayer
	ifequal 21, .StevenPlayer
	ifequal 22, .CynthiaPlayer
	ifequal 23, .LeonPlayer
	ifequal 24, .WallacePlayer
    ifequal 25, .AdamPlayer
    ifequal 26, .JonathanPlayer
    ifequal 27, .LancePlayer
    ifequal 28, .BluePlayer
    ifequal 29, .RedPlayer
	ifequal 30, .AshPlayer
	closetext
	end

.ChooseEnemyCharacter:
    writetext PickYourEnemyText

    checkevent EVENT_BEAT_RED
    iffalse .notBeatRedEnemyMenu
    loadmenu .PostRedCharacterMenuHeader
    _2dmenu
    sjump .doneEnemyMenu
.notBeatRedEnemyMenu
    checkevent EVENT_BEAT_WALLACE
    iffalse .notBeatWallaceEnemyMenu
    loadmenu .PostWallaceCharacterMenuHeader
    _2dmenu
    sjump .doneEnemyMenu
.notBeatWallaceEnemyMenu
    checkevent EVENT_BEAT_ELITE_FOUR
    iffalse .notBeatE4EnemyMenu
    loadmenu .PostE4CharacterMenuHeader
    _2dmenu
    sjump .doneEnemyMenu
.notBeatE4EnemyMenu
    loadmenu .DefaultCharacterMenuHeader
    _2dmenu
.doneEnemyMenu
	closewindow
	ifequal 1, .FalknerEnemy
	ifequal 2, .BugsyEnemy
	ifequal 3, .WhitneyEnemy
	ifequal 4, .MortyEnemy
	ifequal 5, .ChuckEnemy
	ifequal 6, .JasmineEnemy
	ifequal 7, .PryceEnemy
	ifequal 8, .ClairEnemy
	ifequal 9, .BrockEnemy
	ifequal 10, .MistyEnemy
	ifequal 11, .SurgeEnemy
	ifequal 12, .ErikaEnemy
	ifequal 13, .JanineEnemy
	ifequal 14, .WillEnemy
	ifequal 15, .BlaineEnemy
	ifequal 16, .SabrinaEnemy
	ifequal 17, .BrunoEnemy
	ifequal 18, .KarenEnemy
	ifequal 19, .GiovanniEnemy
	ifequal 20, .OakEnemy
	ifequal 21, .StevenEnemy
	ifequal 22, .CynthiaEnemy
	ifequal 23, .LeonEnemy
	ifequal 24, .WallaceEnemy
    ifequal 25, .AdamEnemy
    ifequal 26, .JonathanEnemy
    ifequal 27, .LanceEnemy
    ifequal 28, .BlueEnemy
    ifequal 29, .RedEnemy
    ifequal 30, .AshEnemy
	closetext
	end

.FalknerPlayer
    writetext PlayAsFalknerText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval FALKNER
	writemem wOtherTrainerClass
	setval MASTER_FALKNER
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.FalknerEnemy
    writetext PlayAgainstFalknerText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer FALKNER, MASTER_FALKNER
    sjump .beginBattle

.BugsyPlayer
    writetext PlayAsBugsyText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval BUGSY
	writemem wOtherTrainerClass
	setval MASTER_BUGSY
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.BugsyEnemy
    writetext PlayAgainstBugsyText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer BUGSY, MASTER_BUGSY
    sjump .beginBattle

.WhitneyPlayer
    writetext PlayAsWhitneyText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval WHITNEY
	writemem wOtherTrainerClass
	setval MASTER_WHITNEY
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.WhitneyEnemy
    writetext PlayAgainstWhitneyText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer WHITNEY, MASTER_WHITNEY
    sjump .beginBattle

.MortyPlayer
    writetext PlayAsMortyText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval MORTY
	writemem wOtherTrainerClass
	setval MASTER_MORTY
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.MortyEnemy
    writetext PlayAgainstMortyText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer MORTY, MASTER_MORTY
    sjump .beginBattle

.ChuckPlayer
    writetext PlayAsChuckText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval CHUCK
	writemem wOtherTrainerClass
	setval MASTER_CHUCK
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.ChuckEnemy
    writetext PlayAgainstChuckText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer CHUCK, MASTER_CHUCK
    sjump .beginBattle

.JasminePlayer
    writetext PlayAsJasmineText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval JASMINE
	writemem wOtherTrainerClass
	setval MASTER_JASMINE
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.JasmineEnemy
    writetext PlayAgainstJasmineText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer JASMINE, MASTER_JASMINE
    sjump .beginBattle

.PrycePlayer
    writetext PlayAsPryceText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval PRYCE
	writemem wOtherTrainerClass
	setval MASTER_PRYCE
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.PryceEnemy
    writetext PlayAgainstPryceText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer PRYCE, MASTER_PRYCE
    sjump .beginBattle

.ClairPlayer
    writetext PlayAsClairText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval CLAIR
	writemem wOtherTrainerClass
	setval MASTER_CLAIR
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.ClairEnemy
    writetext PlayAgainstClairText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer CLAIR, MASTER_CLAIR
    sjump .beginBattle

.BrockPlayer
    writetext PlayAsBrockText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval BROCK
	writemem wOtherTrainerClass
	setval MASTER_BROCK
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.BrockEnemy
    writetext PlayAgainstBrockText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer BROCK, MASTER_BROCK
    sjump .beginBattle

.MistyPlayer
    writetext PlayAsMistyText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval MISTY
	writemem wOtherTrainerClass
	setval MASTER_MISTY
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.MistyEnemy
    writetext PlayAgainstMistyText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer MISTY, MASTER_MISTY
    sjump .beginBattle

.SurgePlayer
    writetext PlayAsSurgeText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval LT_SURGE
	writemem wOtherTrainerClass
	setval MASTER_SURGE
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.SurgeEnemy
    writetext PlayAgainstSurgeText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer LT_SURGE, MASTER_SURGE
    sjump .beginBattle

.ErikaPlayer
    writetext PlayAsErikaText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval ERIKA
	writemem wOtherTrainerClass
	setval MASTER_ERIKA
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.ErikaEnemy
    writetext PlayAgainstErikaText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer ERIKA, MASTER_ERIKA
    sjump .beginBattle

.JaninePlayer
    writetext PlayAsJanineText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval JANINE
	writemem wOtherTrainerClass
	setval MASTER_JANINE
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.JanineEnemy
    writetext PlayAgainstJanineText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer JANINE, MASTER_JANINE
    sjump .beginBattle

.WillPlayer
    writetext PlayAsWillText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval WILL
	writemem wOtherTrainerClass
	setval MASTER_WILL
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.WillEnemy
    writetext PlayAgainstWillText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer WILL, MASTER_WILL
    sjump .beginBattle

.BlainePlayer
    writetext PlayAsBlaineText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval BLAINE
	writemem wOtherTrainerClass
	setval MASTER_BLAINE
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.BlaineEnemy
    writetext PlayAgainstBlaineText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer BLAINE, MASTER_BLAINE
    sjump .beginBattle

.GiovanniPlayer
    writetext PlayAsGiovanniText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval GIOVANNI
	writemem wOtherTrainerClass
	setval MASTER_GIOVANNI
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.GiovanniEnemy
    writetext PlayAgainstGiovanniText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer GIOVANNI, MASTER_GIOVANNI
    sjump .beginBattle

.SabrinaPlayer
    writetext PlayAsSabrinaText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval SABRINA
	writemem wOtherTrainerClass
	setval MASTER_SABRINA
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.SabrinaEnemy
    writetext PlayAgainstSabrinaText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer SABRINA, MASTER_SABRINA
    sjump .beginBattle

.BrunoPlayer
    writetext PlayAsBrunoText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval BRUNO
	writemem wOtherTrainerClass
	setval MASTER_BRUNO
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.BrunoEnemy
    writetext PlayAgainstBrunoText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer BRUNO, MASTER_BRUNO
    sjump .beginBattle

.KarenPlayer
    writetext PlayAsKarenText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval KAREN
	writemem wOtherTrainerClass
	setval MASTER_KAREN
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.KarenEnemy
    writetext PlayAgainstKarenText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer KAREN, MASTER_KAREN
    sjump .beginBattle

.AshPlayer
    writetext PlayAsAshText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval ASH
	writemem wOtherTrainerClass
    scall WhichVariantChoice
    ifequal TRUE, .MasterAshPlayer
	setval ASH1
	sjump .AshPlayerDone
.MasterAshPlayer
	setval MASTER_ASH
.AshPlayerDone
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.AshEnemy
    writetext PlayAgainstAshText
    yesorno
    iffalse .ChooseEnemyCharacter
    scall WhichVariantChoice
    ifequal TRUE, .MasterAshEnemy
	loadtrainer ASH, ASH1
	sjump .beginBattle
.MasterAshEnemy
	loadtrainer ASH, MASTER_ASH
	sjump .beginBattle

.AdamPlayer
    writetext PlayAsAdamText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval ADAM
	writemem wOtherTrainerClass
    scall WhichVariantChoice
    ifequal TRUE, .MasterAdamPlayer
	;setval WEATHER_RAIN
	;writemem wFieldWeather
	setval ADAM_ARCADE
	sjump .AdamPlayerDone
.MasterAdamPlayer
	setval MASTER_ADAM
.AdamPlayerDone
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.AdamEnemy
    writetext PlayAgainstAdamText
    yesorno
    iffalse .ChooseEnemyCharacter
    scall WhichVariantChoice
    ifequal TRUE, .MasterAdamEnemy
	;setval WEATHER_RAIN
	;writemem wFieldWeather
	loadtrainer ADAM, ADAM_ARCADE
	sjump .beginBattle
.MasterAdamEnemy
	loadtrainer ADAM, MASTER_ADAM
	sjump .beginBattle

.StevenPlayer
    writetext PlayAsStevenText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval STEVEN
	writemem wOtherTrainerClass
	setval MASTER_STEVEN
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.StevenEnemy
    writetext PlayAgainstStevenText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer STEVEN, MASTER_STEVEN
    sjump .beginBattle

.CynthiaPlayer
    writetext PlayAsCynthiaText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval CYNTHIA
	writemem wOtherTrainerClass
	setval MASTER_CYNTHIA
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.CynthiaEnemy
    writetext PlayAgainstCynthiaText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer CYNTHIA, MASTER_CYNTHIA
    sjump .beginBattle

.LeonPlayer
    writetext PlayAsLeonText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval LEON
	writemem wOtherTrainerClass
	setval MASTER_LEON
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.LeonEnemy
    writetext PlayAgainstLeonText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer LEON, MASTER_LEON
    sjump .beginBattle

.WallacePlayer
    writetext PlayAsWallaceText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval WALLACE
	writemem wOtherTrainerClass
	setval MASTER_WALLACE
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.WallaceEnemy
    writetext PlayAgainstWallaceText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer WALLACE, MASTER_WALLACE
    sjump .beginBattle

.LancePlayer
    writetext PlayAsLanceText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval CHAMPION
	writemem wOtherTrainerClass
    scall WhichVariantChoice
    ifequal TRUE, .MasterLancePlayer
	setval LANCE_ARCADE
	sjump .LancePlayerDone
.MasterLancePlayer
	setval MASTER_LANCE
.LancePlayerDone
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.LanceEnemy
    writetext PlayAgainstLanceText
    yesorno
    iffalse .ChooseEnemyCharacter
    scall WhichVariantChoice
    ifequal TRUE, .MasterLanceEnemy
	loadtrainer CHAMPION, LANCE_ARCADE
	sjump .beginBattle
.MasterLanceEnemy
	loadtrainer CHAMPION, MASTER_LANCE
	sjump .beginBattle

.BluePlayer
    writetext PlayAsBlueText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval BLUE
	writemem wOtherTrainerClass
    scall WhichVariantChoice
    ifequal TRUE, .MasterBluePlayer
	setval BLUE_ARCADE
	sjump .BluePlayerDone
.MasterBluePlayer
	setval MASTER_BLUE
.BluePlayerDone
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.BlueEnemy
    writetext PlayAgainstBlueText
    yesorno
    iffalse .ChooseEnemyCharacter
    scall WhichVariantChoice
    ifequal TRUE, .MasterBlueEnemy
	loadtrainer BLUE, BLUE_ARCADE
	sjump .beginBattle
.MasterBlueEnemy
	loadtrainer BLUE, MASTER_BLUE
	sjump .beginBattle

.RedPlayer
    writetext PlayAsRedText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval RED
	writemem wOtherTrainerClass
    scall WhichVariantChoice
    ifequal TRUE, .MasterRedPlayer
	setval RED1
	sjump .RedPlayerDone
.MasterRedPlayer
	setval MASTER_RED
.RedPlayerDone
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.RedEnemy
    writetext PlayAgainstRedText
    yesorno
    iffalse .ChooseEnemyCharacter
    scall WhichVariantChoice
    ifequal TRUE, .MasterRedEnemy
	loadtrainer RED, RED1
	sjump .beginBattle
.MasterRedEnemy
	loadtrainer RED, MASTER_RED
	sjump .beginBattle

.JonathanPlayer
    writetext PlayAsJonathanText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval JONATHAN
	writemem wOtherTrainerClass
    scall WhichVariantChoice
    ifequal TRUE, .MasterJonathanPlayer
	setval JONATHAN_ARCADE
	sjump .RedPlayerDone
.MasterJonathanPlayer
	setval MASTER_JONATHAN
.JonathanPlayerDone
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.JonathanEnemy
    writetext PlayAgainstJonathanText
    yesorno
    iffalse .ChooseEnemyCharacter
    scall WhichVariantChoice
    ifequal TRUE, .MasterJonathanEnemy
	loadtrainer JONATHAN, JONATHAN_ARCADE
	sjump .beginBattle
.MasterJonathanEnemy
	loadtrainer JONATHAN, MASTER_JONATHAN
	sjump .beginBattle

.OakPlayer
    writetext PlayAsOakText
    yesorno
    iffalse .ChoosePlayerCharacter
	setval POKEMON_PROF
	writemem wOtherTrainerClass
	setval MASTER_OAK
	writemem wOtherTrainerID
	special OverridePlayerParty
    sjump .chooseEnemy
.OakEnemy
    writetext PlayAgainstOakText
    yesorno
    iffalse .ChooseEnemyCharacter
    loadtrainer POKEMON_PROF, MASTER_OAK
    sjump .beginBattle

.PostRedCharacterMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .PostRedCharacterMenuData
	db 1 ; default option
.PostRedCharacterMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 5, 6 ; rows, columns
	db 3 ; spacing
	dba .PostRedCharacterText
	dbw BANK(@), NULL
.PostRedCharacterText:
	db "FK@"
	db "BG@"
	db "WH@"
	db "MT@"
	db "CH@"
	db "JS@"
	db "PY@"
	db "CL@"
	db "BK@"
	db "MS@"
	db "SU@"
	db "ER@"
    db "JA@"
    db "WL@"
    db "BL@"
	db "SB@"
	db "BN@"
	db "KN@"
    db "GV@"
	db "OK@"
    db "ST@"
    db "CY@"
    db "LE@"
    db "WC@"
    db "AD@"
    db "JN@"
    db "LN@"
    db "BU@"
    db "RD@"
    db "AS@"

.PostWallaceCharacterMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .PostWallaceCharacterMenuData
	db 1 ; default option
.PostWallaceCharacterMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 4, 6 ; rows, columns
	db 3 ; spacing
	dba .PostWallaceCharacterText
	dbw BANK(@), NULL
.PostWallaceCharacterText:
	db "FK@"
	db "BG@"
	db "WH@"
	db "MT@"
	db "CH@"
	db "JS@"
	db "PY@"
	db "CL@"
	db "BK@"
	db "MS@"
	db "SU@"
	db "ER@"
    db "JA@"
    db "WL@"
    db "BL@"
	db "SB@"
	db "BN@"
	db "KN@"
    db "GV@"
	db "OK@"
    db "ST@"
    db "CY@"
    db "LE@"
    db "WC@"

.PostE4CharacterMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .PostE4CharacterMenuData
	db 1 ; default option
.PostE4CharacterMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 4, 5 ; rows, columns
	db 3 ; spacing
	dba .PostE4CharacterText
	dbw BANK(@), NULL
.PostE4CharacterText:
	db "FK@"
	db "BG@"
	db "WH@"
	db "MT@"
	db "CH@"
	db "JS@"
	db "PY@"
	db "CL@"
	db "BK@"
	db "MS@"
	db "SU@"
	db "ER@"
    db "JA@"
    db "WL@"
    db "BL@"
	db "SB@"
	db "BN@"
	db "KN@"
    db "GV@"
	db "OK@"

.DefaultCharacterMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 19, 11
	dw .DefaultCharacterMenuData
	db 1 ; default option
.DefaultCharacterMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 3, 5 ; rows, columns
	db 3 ; spacing
	dba .DefaultCharacterText
	dbw BANK(@), NULL
.DefaultCharacterText:
	db "FK@"
	db "BG@"
	db "WH@"
	db "MT@"
	db "CH@"
	db "JS@"
	db "PY@"
	db "CL@"
	db "BK@"
	db "MS@"
	db "SU@"
	db "ER@"
    db "JA@"
    db "WL@"
    db "BL@"

WhichVariantChoice:
    writetext WhichVariantText
	loadmenu .WhichVariantHeader
	_2dmenu
	closewindow
	ifequal 1, .Trainer
	ifequal 2, .Master
	closetext
	end
.WhichVariantHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 10, 5
	dw .WhichVariantMenuData
	db 1 ; default option
.WhichVariantMenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	dn 2, 1 ; rows, columns
	db 5 ; spacing
	dba .WingText
	dbw BANK(@), NULL
.WingText:
	db "Trainer@"
	db "Master@"
.Trainer
    setval FALSE
    end
.Master
    setval TRUE
    end
WhichVariantText:
    text "Which variant?"
    done

PlayAsFalknerText:
    text "Play as"
    line "Leader Falkner?"
    done

PlayAgainstFalknerText:
    text "Play against"
    line "Leader Falkner?"
    done

PlayAsBugsyText:
    text "Play as"
    line "Leader Bugsy?"
    done

PlayAgainstBugsyText:
    text "Play against"
    line "Leader Bugsy?"
    done

PlayAsWhitneyText:
    text "Play as"
    line "Leader Whitney?"
    done

PlayAgainstWhitneyText:
    text "Play against"
    line "Leader Whitney?"
    done

PlayAsMortyText:
    text "Play as"
    line "Leader Morty?"
    done

PlayAgainstMortyText:
    text "Play against"
    line "Leader Morty?"
    done

PlayAsChuckText:
    text "Play as"
    line "Leader Chuck?"
    done

PlayAgainstChuckText:
    text "Play against"
    line "Leader Chuck?"
    done

PlayAsJasmineText:
    text "Play as"
    line "Leader Jasmine?"
    done

PlayAgainstJasmineText:
    text "Play against"
    line "Leader Jasmine?"
    done

PlayAsPryceText:
    text "Play as"
    line "Leader Pryce?"
    done

PlayAgainstPryceText:
    text "Play against"
    line "Leader Pryce?"
    done

PlayAsClairText:
    text "Play as"
    line "Leader Clair?"
    done

PlayAgainstClairText:
    text "Play against"
    line "Leader Clair?"
    done

PlayAsBrockText:
    text "Play as"
    line "Leader Brock?"
    done

PlayAgainstBrockText:
    text "Play against"
    line "Leader Brock?"
    done

PlayAsMistyText:
    text "Play as"
    line "Leader Misty?"
    done

PlayAgainstMistyText:
    text "Play against"
    line "Leader Misty?"
    done

PlayAsSurgeText:
    text "Play as"
    line "Leader Surge?"
    done

PlayAgainstSurgeText:
    text "Play against"
    line "Leader Surge?"
    done

PlayAsErikaText:
    text "Play as"
    line "Leader Erika?"
    done

PlayAgainstErikaText:
    text "Play against"
    line "Leader Erika?"
    done

PlayAsJanineText:
    text "Play as"
    line "Leader Janine?"
    done

PlayAgainstJanineText:
    text "Play against"
    line "Leader Janine?"
    done

PlayAsWillText:
    text "Play as"
    line "Leader Will?"
    done

PlayAgainstWillText:
    text "Play against"
    line "Leader Will?"
    done

PlayAsBlaineText:
    text "Play as"
    line "Leader Blaine?"
    done

PlayAgainstBlaineText:
    text "Play against"
    line "Leader Blaine?"
    done

PlayAsSabrinaText:
    text "Play as"
    line "Elite 4 Sabrina?"
    done

PlayAgainstSabrinaText:
    text "Play against"
    line "Elite 4 Sabrina?"
    done

PlayAsBrunoText:
    text "Play as"
    line "Elite 4 Bruno?"
    done

PlayAgainstBrunoText:
    text "Play against"
    line "Elite 4 Bruno?"
    done

PlayAsKarenText:
    text "Play as"
    line "Elite 4 Karen?"
    done

PlayAgainstKarenText:
    text "Play against"
    line "Elite 4 Karen?"
    done

PlayAsGiovanniText:
    text "Play as"
    line "Leader Giovanni?"
    done

PlayAgainstGiovanniText:
    text "Play against"
    line "Leader Giovanni?"
    done

PlayAsOakText:
    text "Play as"
    line "Prof Oak?"
    done

PlayAgainstOakText:
    text "Play against"
    line "Prof Oak?"
    done

PlayAsStevenText:
    text "Play as"
    line "Champion Steven?"
    done

PlayAgainstStevenText:
    text "Play against"
    line "Champion Steven?"
    done

PlayAsCynthiaText:
    text "Play as"
    line "Champion Cynthia?"
    done

PlayAgainstCynthiaText:
    text "Play against"
    line "Champion Cynthia?"
    done

PlayAsLeonText:
    text "Play as"
    line "Champion Leon?"
    done

PlayAgainstLeonText:
    text "Play against"
    line "Champion Leon?"
    done

PlayAsWallaceText:
    text "Play as"
    line "Emperor Wallace?"
    done

PlayAgainstWallaceText:
    text "Play against"
    line "Emperor Wallace?"
    done

PlayAsAdamText:
    text "Play as"
    line "Adam?"
    done

PlayAgainstAdamText:
    text "Play against"
    line "Adam?"
    done

PlayAsLanceText:
    text "Play as"
    line "Lance?"
    done

PlayAgainstLanceText:
    text "Play against"
    line "Lance?"
    done

PlayAsJonathanText:
    text "Play as"
    line "Jonathan?"
    done

PlayAgainstJonathanText:
    text "Play against"
    line "Jonathan?"
    done

PlayAsBlueText:
    text "Play as"
    line "Blue?"
    done

PlayAgainstBlueText:
    text "Play against"
    line "Blue?"
    done

PlayAsRedText:
    text "Play as"
    line "Red?"
    done

PlayAgainstRedText:
    text "Play against"
    line "Red?"
    done

PlayAsAshText:
    text "Play as"
    line "Ash?"
    done

PlayAgainstAshText:
    text "Play against"
    line "Ash?"
    done

NeedToSaveText:
    text "You will need to"
    line "save your game."
    cont "Is that alright?"
    done

BattleArcadeIntroText:
    text "Welcome to the"
    line "Battle Arcade."

	para "Here you can fight"
	line "using super"
	cont "powered trainers"
	cont "of your choosing."

    para "Do you want to"
    line "fight?"
    done

WantToPlayAsAnotherText:
    text "You want to"
    line "play as a super"
    cont "trainer!?"
    done

FineThenText:
    text "Fine, you can"
    line "play as your"
    cont "normal self."
    done

PickYourPlayerText:
    text "Choose your"
    line "character."
    done

PickYourEnemyText:
    text "Choose your"
    line "opponent."
    done

BattleTrialIntroText:
    text "Welcome to the"
    line "Battle Trial."

    para "Here you can"
    line "fight consecutive"
    cont "opponents with"
    cont "increasing"
    cont "difficulty."

    para "When you clear a"
    line "trial you unlock"
    cont "the next"
    cont "difficulty."

    para "Would you like"
    line "to see how far"
    cont "you can get?"
    done

ExplainStandardTrialText:
    text "The Standard Trial"
    line "consists of 30"
    cont "total battles."

    para "With your #mon"
    line "being healed every"
    cont "3 battles."
    done

ExplainMasterTrialText:
    text "The Master Trial"
    line "consists of 6"
    cont "total battles."

    para "With your #mon"
    line "being healed every"
    cont "3 battles."
    done

ExplainImpossibleTrialText:
    text "Impossible Trial!"

    para "It consists of 4"
    line "total battles."

    para "With your #mon"
    line "healed before"
    cont "the final battle."
    done

WhatTrialText:
    text "Which Trial do"
    line "you want to take."
    prompt

BattleMirrorIntroText:
    text "Welcome to the"
    line "Battle Mirror."

    para "Here you can"
    line "fight a simulation"
    cont "of yourself."

    para "Would you like to"
    line "battle?"
    done

AcceptPrize:
    text "Well done!"

    para "Please accept"
    line "this prize."
    done

NowHeal:
    text "Your #mon will"
    line "now be restored."
    done

Trial2Text:
    text "Now for battle 2."
    done

Trial3Text:
    text "Now for battle 3."
    done

Trial4Text:
    text "Now for battle 4."
    done

Trial5Text:
    text "Now for battle 5."
    done

Trial6Text:
    text "Now for battle 6."
    done

Trial7Text:
    text "Now for battle 7."
    done

Trial8Text:
    text "Now for battle 8."
    done

Trial9Text:
    text "Now for battle 9."
    done

Trial10Text:
    text "Now for battle 10."
    done

Trial11Text:
    text "Now for battle 11."
    done

Trial12Text:
    text "Now for battle 12."
    done

Trial13Text:
    text "Now for battle 13."
    done

Trial14Text:
    text "Now for battle 14."
    done

Trial15Text:
    text "Now for battle 15."
    done

Trial16Text:
    text "Now for battle 16."
    done

Trial17Text:
    text "Now for battle 17."
    done

Trial18Text:
    text "Now for battle 18."
    done

Trial19Text:
    text "Now for battle 19."
    done

Trial20Text:
    text "Now for battle 20."
    done

Trial21Text:
    text "Now for battle 21."
    done

Trial22Text:
    text "Now for battle 22."
    done

Trial23Text:
    text "Now for battle 23."
    done

Trial24Text:
    text "Now for battle 24."
    done

Trial25Text:
    text "Now for battle 25."
    done

Trial26Text:
    text "Now for battle 26."
    done

Trial27Text:
    text "Now for battle 27."
    done

Trial28Text:
    text "Now for battle 28."
    done

Trial29Text:
    text "Now for battle 29."
    done

Trial30Text:
    text "Now for battle 30."
    done

TrialUnlockMasterText:
    text "Congratulations!"

    para "You have now"
    line "unlocked the"
    cont "Master Trial!"

    para "A more difficult"
    line "trial with a"
    cont "total of 6"
    cont "Battles."
    done

TrialUnlockImpossibleText:
    text "Congratulations!"

    para "You have now"
    line "unlocked the"
    cont "Impossible Trial!"

    para "An insane trial"
    line "with 4 brutal"
    cont "battles."
    done

TrialLeaderText:
    text "You are a"
    line "remarkable"
    cont "trainer."

    para "Now you shall"
    line "face the elusive"
    cont "master of the"
    cont "Battle Trial."

    para "Let the final"
    line "ultimate trial"
    cont "begin!"
    done

TrialCongratsText:
    text "Congratulations!"

    para "I can't believe"
    line "what I just"
    cont "witnessed!"

    para "You are the"
    line "greatest trainer"
    cont "in all existence!"
    done

victoryText:
    text "Victory!"
    done

defeatText:
    text "Defeat!"
    done

Movement_MoveReceptionistOut:
    step UP
    step LEFT
    turn_head RIGHT
    step_end

Movement_EnterBattleRoom:
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

BattleLoseText:
    text "Better luck"
    line "next time."
    done

BattleWinText:
    text "Well done!"

    para "Please accept"
    line "this prize."
    done

BattleWinNoPrizeText:
    text "Well done!"
    done

BattleRouletteIntroText:
	text "Welcome to the"
	line "Battle Roulette."

	para "Here you can"
	line "battle a random"
	cont "memorable enemy"
	cont "you have beaten."

	para "And maybe some"
	line "you haven't."

	para "You will receive"
	line "a random prize"
	cont "if you win."
	done

BattleRouletteAskWantToBattleText:
	text "Would you like to"
	line "battle?"
	done

BattleGoRightInText:
	text "Please go right"
	line "through."
	done

PleaseComeAgainText:
	text "Sorry. Only those"
	line "trainers who will"

	para "be playing are"
	line "allowed to go in."
	done

BattleRouletteSecondChallengeDeniedText:
	text "I'm sorry."
	line "This would be your"

	para "second time today."
	line "You're permitted"

	para "to enter just once"
	line "a day."
	done

BattleRouletteCalBeatenText:
	text "I lost…"
	line "Darn…"
	done

BattleRouletteCalBeforeText:
	text "I traveled out"
	line "here just so I"
	cont "could battle you."
	done

TrainerHouseB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3, 15, BATTLE_TOWER_OUTSIDE, 6
	warp_event  4, 15, BATTLE_TOWER_OUTSIDE, 7
	warp_event 17, 15, BATTLE_TOWER_OUTSIDE, 8
	warp_event 18, 15, BATTLE_TOWER_OUTSIDE, 9
	warp_event 31, 15, BATTLE_TOWER_OUTSIDE, 10
	warp_event 32, 15, BATTLE_TOWER_OUTSIDE, 11
	warp_event 45, 15, BATTLE_TOWER_OUTSIDE, 12
	warp_event 46, 15, BATTLE_TOWER_OUTSIDE, 13

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 12, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleRouletteReceptionistScript, -1
	object_event 17, 12, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleMirrorReceptionistScript, -1
	object_event 31, 12, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleTrialReceptionistScript, -1
	object_event 45, 12, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BattleArcadeReceptionistScript, -1
	object_event 18,  3, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_1
	object_event 18,  3, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_TEMP_EVENT_2
	object_event 18,  3, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIELD_MON_1
	object_event 18,  3, SPRITE_KRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GOLD, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_FIELD_MON_2

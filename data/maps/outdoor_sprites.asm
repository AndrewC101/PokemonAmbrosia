; Valid sprite IDs for each map group.
; Maps with environment ROUTE or TOWN can only use these sprites.

; DevNote - outdoor spites, here is how this works
; Maps are grouped into map groups
; Each map group has a set of 23 outdoor sprites
; Only the 9 sprites in positions 13 - 21 can have walking animations
; the first 12 are unimportant padding, you can put any non-walking sprite in there
; the last two are always pokeball and tree

; IMPORTANT!
; when you cross one mapgroup to another by a map connection the new set is not loaded
; this means you need to keep such groups the same to avoid errors
; this applies in two transitions, so ensure
; NewBarkGroupSprites = CherrygroveGroupSprites
; OlivineGroupSprites = CianwoodGroupSprites
; VermilionGroupSprites = FuchsiaGroupSprites = LavenderGroupSprites

OutdoorSprites:
; entries correspond to MAPGROUP_* constants
	table_width 2, OutdoorSprites
	dw OlivineGroupSprites
	dw MahoganyGroupSprites
	dw DungeonsGroupSprites
	dw EcruteakGroupSprites
	dw BlackthornGroupSprites
	dw CinnabarGroupSprites
	dw CeruleanGroupSprites
	dw AzaleaGroupSprites
	dw LakeOfRageGroupSprites
	dw VioletGroupSprites
	dw GoldenrodGroupSprites
	dw VermilionGroupSprites
	dw PalletGroupSprites
	dw PewterGroupSprites
	dw FastShipGroupSprites
	dw IndigoGroupSprites
	dw FuchsiaGroupSprites
	dw LavenderGroupSprites
	dw SilverGroupSprites
	dw CableClubGroupSprites
	dw CeladonGroupSprites
	dw CianwoodGroupSprites
	dw ViridianGroupSprites
	dw NewBarkGroupSprites
	dw SaffronGroupSprites
	dw CherrygroveGroupSprites
	dw HallOfOriginSprites
	dw DestinyTowerSprites
	dw AncientRuinSprites
	dw WarZoneSprites
	dw MuseumSprites
	dw ManorSprites
	assert_table_length NUM_MAP_GROUPS

; Route1 and ViridianCity are connected
; Route2 and PewterCity are connected
; PalletTown and Route21 are connected
PalletGroupSprites:
; Route1, PalletTown
ViridianGroupSprites:
; Route2, Route22, ViridianCity
PewterGroupSprites:
; Route3, PewterCity
CinnabarGroupSprites:
; Route19, Route20, Route21, CinnabarIsland
	db SPRITE_GRAMPS
	db SPRITE_MONSTER
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_BEAUTY
	db SPRITE_BUG_CATCHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_SWIMMER_GIRL
	db SPRITE_SWIMMER_GUY

	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_BUTTERFREE
	db SPRITE_PIKACHU
	db SPRITE_BLASTOISE
	db SPRITE_MOLTRES
	db SPRITE_KIMONO_GIRL
	db SPRITE_CHARMANDER
	db SPRITE_BULBASAUR
	db SPRITE_SQUIRTLE
	db SPRITE_HERACROSS
	db SPRITE_BLUE
	db 0 ; end

; CeruleanCity and Route5 are connected
CeruleanGroupSprites:
; Route4, Route9, Route10North, Route24, Route25, CeruleanCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_MONSTER
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKET
	db SPRITE_MISTY

	db SPRITE_POKE_BALL
	db SPRITE_SLOWPOKE
	db SPRITE_SQUIRTLE
	db SPRITE_ALAKAZAM
	db SPRITE_RAICHU
	db SPRITE_PERSIAN
	db SPRITE_NURSE
	db SPRITE_BLISSEY
	db SPRITE_POLIWRATH
	db SPRITE_BLASTOISE
	db 0 ; end

SaffronGroupSprites:
; Route5, SaffronCity
	db SPRITE_COOLTRAINER_M
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_YOUNGSTER
	db SPRITE_MONSTER
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKET
	db SPRITE_SILVER

	db SPRITE_POKE_BALL
	db SPRITE_ALAKAZAM
	db SPRITE_SLOWPOKE
	db SPRITE_SQUIRTLE
	db SPRITE_RAICHU
	db SPRITE_PERSIAN
	db SPRITE_NURSE
	db SPRITE_BLISSEY
	db SPRITE_POLIWRATH
	db SPRITE_BLASTOISE
	db SPRITE_BELDUM
	db 0 ; end

CeladonGroupSprites:
; Route7, Route16, Route17, CeladonCity
	db SPRITE_FISHER
	db SPRITE_DRAGON
	db SPRITE_TEACHER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_BIKER
	db SPRITE_MONSTER
	db SPRITE_BLUE

	db SPRITE_POLIWRATH
	db SPRITE_CHARIZARD
	db SPRITE_POKE_BALL
	db SPRITE_ESPEON
	db SPRITE_UMBREON
	db SPRITE_GALLADE
	db SPRITE_GARDEVOIR
	db SPRITE_FRUIT_TREE
	db SPRITE_FROAKIE
	db 0 ; end

; Route11, Route12 and Route13 are connected
VermilionGroupSprites:
; Route6, Route11, VermilionCity
LavenderGroupSprites:
; Route8, Route12, Route10South, LavenderTown
FuchsiaGroupSprites:
; Route13, Route14, Route15, Route18, FuchsiaCity
	db SPRITE_POKEFAN_M
	db SPRITE_OFFICER
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_FISHER
	db SPRITE_TEACHER
	db SPRITE_BIRD
	db SPRITE_MONSTER
	db SPRITE_BIKER

	db SPRITE_BIG_SNORLAX
	db SPRITE_WILL
	db SPRITE_KIMONO_GIRL
	db SPRITE_TAUROS
	db SPRITE_MACHAMP
	db SPRITE_VENUSAUR
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_ELECTABUZZ
	db SPRITE_CHIMCHAR
	db SPRITE_TREECKO
	db 0 ; end

IndigoGroupSprites:
; Route23
    db SPRITE_COOLTRAINER_M
	db 0 ; end
; Route29 and CherrygroveCity are connected
NewBarkGroupSprites:
; Route26, Route27, Route29, NewBarkTown
CherrygroveGroupSprites:
; Route30, Route31, CherrygroveCity
	db SPRITE_BUG_CATCHER
	db SPRITE_FISHER
	db SPRITE_BEAUTY
	db SPRITE_COOLTRAINER_M
	db SPRITE_YOUNGSTER
	db SPRITE_MONSTER
	db SPRITE_GRAMPS
	db SPRITE_SILVER
	db SPRITE_BIRD

    db SPRITE_HERACROSS
    db SPRITE_MEOWTH
    db SPRITE_PIKACHU
    db SPRITE_TEACHER
    db SPRITE_ARCANINE
    db SPRITE_MAGIKARP
    db SPRITE_COOLTRAINER_F
    db SPRITE_WILL
    db SPRITE_RIOLU
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

HallOfOriginSprites:
DestinyTowerSprites:
AncientRuinSprites:
WarZoneSprites:
MuseumSprites:
ManorSprites:
SilverGroupSprites:
	db SPRITE_SILVER
	db SPRITE_BIRD
	db SPRITE_SUPER_NERD
	db SPRITE_BEAUTY
	db SPRITE_MONSTER
	db SPRITE_GRAMPS

	db SPRITE_WILL
	db SPRITE_BLASTOISE
	db SPRITE_VOLCARONA
	db SPRITE_CHARIZARD
	db SPRITE_VENUSAUR
	db SPRITE_BIG_SNORLAX
	db SPRITE_SCEPTILE
	db SPRITE_GRENINJA
	db SPRITE_INFERNAPE
	db SPRITE_SWAMPERT
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db 0 ; end

; Route37 and EcruteakCity are connected
VioletGroupSprites:
; Route32, Route35, Route36, Route37, VioletCity
EcruteakGroupSprites:
; EcruteakCity
	db SPRITE_FISHER
	db SPRITE_LASS
	db SPRITE_BEAUTY
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_M
	db SPRITE_BUG_CATCHER
	db SPRITE_MONSTER
	db SPRITE_BIRD

    db SPRITE_OFFICER
    db SPRITE_STARAPTOR
    db SPRITE_GENGAR
    db SPRITE_MURKROW
    db SPRITE_MEOWTH
    db SPRITE_MUDKIP
    db SPRITE_KIMONO_GIRL
    db SPRITE_AMPHAROS
	db SPRITE_POKE_BALL
	db SPRITE_FRUIT_TREE
	db SPRITE_SUICUNE
	db 0 ; end

AzaleaGroupSprites:
; Route33, AzaleaTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_OFFICER
	db SPRITE_POKEFAN_M
	db SPRITE_MONSTER
	db SPRITE_TEACHER
	db SPRITE_AZALEA_ROCKET
	db SPRITE_LASS
	db SPRITE_SILVER

	db SPRITE_FRUIT_TREE
	db SPRITE_COOLTRAINER_M
    db SPRITE_COOLTRAINER_F
    db SPRITE_WILL
	db SPRITE_SLOWPOKE
	db SPRITE_KURT_OUTSIDE ; non-walking version of SPRITE_KURT
	db 0 ; end

GoldenrodGroupSprites:
; Route34, GoldenrodCity
	db SPRITE_MONSTER
	db SPRITE_ROCKET
	db SPRITE_LASS
	db SPRITE_GRAMPS
    db SPRITE_YOUNGSTER
    db SPRITE_ROCKET_GIRL
    db SPRITE_POKEFAN_M

	db SPRITE_DAY_CARE_MON_1
	db SPRITE_DAY_CARE_MON_2
	db SPRITE_ABRA
	db SPRITE_MEOWTH
	db SPRITE_POKE_BALL
	db 0 ; end

; OlivineCity and Route40 are connected
OlivineGroupSprites:
; Route38, Route39, OlivineCity
CianwoodGroupSprites:
; Route40, Route41, CianwoodCity, BattleTowerOutside
	db SPRITE_POKEFAN_M
	db SPRITE_SAILOR
	db SPRITE_SUPER_NERD
	db SPRITE_BEAUTY
	db SPRITE_SWIMMER_GIRL
    db SPRITE_OLIVINE_RIVAL
	db SPRITE_TWIN
	db SPRITE_MONSTER

    db SPRITE_WILL
	db SPRITE_LASS
	db SPRITE_STANDING_YOUNGSTER
	db SPRITE_POLIWRATH
	db SPRITE_COOLTRAINER_M
	db SPRITE_COOLTRAINER_F
	db SPRITE_KIMONO_GIRL
	db SPRITE_MEWTWO
	db SPRITE_SUICUNE
	db SPRITE_STARAPTOR
	db 0 ; end

LakeOfRageGroupSprites:
; Route43, LakeOfRage
	db SPRITE_LANCE
	db SPRITE_GRAMPS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_F
	db SPRITE_FISHER
	db SPRITE_COOLTRAINER_M
	db SPRITE_BIRD
	db SPRITE_MONSTER

	db SPRITE_GYARADOS
	db SPRITE_SALAMENCE
	db SPRITE_MAGMAR
	db SPRITE_AMPHAROS
	db SPRITE_SWAMPERT
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

MahoganyGroupSprites:
; Route42, Route44, MahoganyTown
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_LASS
	db SPRITE_SUPER_NERD
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_MONSTER
	db SPRITE_BIRD
	db SPRITE_FISHER

	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db SPRITE_ABOMASNOW
	db SPRITE_MILOTIC
	db SPRITE_TOGEKISS
	db SPRITE_CHANSEY
	db SPRITE_SUICUNE
	db 0 ; end

BlackthornGroupSprites:
; Route45, Route46, BlackthornCity
	db SPRITE_GRAMPS
	db SPRITE_YOUNGSTER
	db SPRITE_DRAGON
	db SPRITE_YOUNGSTER
	db SPRITE_COOLTRAINER_M
	db SPRITE_POKEFAN_M
	db SPRITE_BLACK_BELT
	db SPRITE_COOLTRAINER_F
	db SPRITE_MONSTER

    db SPRITE_WILL
	db SPRITE_SEADRA
	db SPRITE_DRAGONAIR
	db SPRITE_DRATINI
	db SPRITE_GEODUDE
	db SPRITE_PONYTA
	db SPRITE_ZUBAT
	db SPRITE_GARCHOMP
	db SPRITE_EXCADRILL
	db SPRITE_FRUIT_TREE
	db SPRITE_POKE_BALL
	db 0 ; end

DungeonsGroupSprites:
; NationalPark, NationalParkBugContest, RuinsOfAlphOutside
	db SPRITE_LASS
	db SPRITE_POKEFAN_F
	db SPRITE_TEACHER
	db SPRITE_YOUNGSTER
	db SPRITE_MONSTER
	db SPRITE_POKEFAN_M
	db SPRITE_ROCKER
	db SPRITE_FISHER
	db SPRITE_WILL

	db SPRITE_SCIENTIST
	db SPRITE_CHARIZARD
    db SPRITE_GAMEBOY_KID
    db SPRITE_SUPER_NERD
    db SPRITE_SAGE
	db SPRITE_MEOWTH
	db SPRITE_PINSIR
	db SPRITE_SCYTHER
	db SPRITE_POKE_BALL
	db 0 ; end

FastShipGroupSprites:
; OlivinePort, VermilionPort, MountMoonSquare, TinTowerRoof
	db SPRITE_SAILOR
	db SPRITE_FISHING_GURU
	db SPRITE_GENTLEMAN
	db SPRITE_SUPER_NERD
	db SPRITE_HO_OH
	db SPRITE_TEACHER
	db SPRITE_COOLTRAINER_F
	db SPRITE_YOUNGSTER
	db SPRITE_FAIRY

    db SPRITE_MONSTER
	db SPRITE_HO_OH
	db SPRITE_ROCK
	db 0 ; end

CableClubGroupSprites:
; (no outdoor maps)
	; 0 of max 9 walking sprites
	db 0 ; end

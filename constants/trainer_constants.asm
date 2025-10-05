__trainer_class__ = 0

trainerclass: MACRO
\1 EQU __trainer_class__
__trainer_class__ += 1
	const_def 1
ENDM

; trainer class ids
; `trainerclass` indexes are for:
; - TrainerClassNames (see data/trainers/class_names.asm)
; - TrainerClassAttributes (see data/trainers/attributes.asm)
; - TrainerClassDVs (see data/trainers/dvs.asm)
; - TrainerGroups (see data/trainers/party_pointers.asm)
; - TrainerEncounterMusic (see data/trainers/encounter_music.asm)
; - TrainerPicPointers (see data/trainers/pic_pointers.asm)
; - TrainerPalettes (see data/trainers/palettes.asm)
; - BTTrainerClassSprites (see data/trainers/sprites.asm)
; - BTTrainerClassGenders (see data/trainers/genders.asm)
; trainer constants are Trainers indexes, for the sub-tables of TrainerGroups (see data/trainers/parties.asm)
CHRIS EQU __trainer_class__
	trainerclass TRAINER_NONE ; 0
	const PHONECONTACT_MOM
	const PHONECONTACT_BIKESHOP
	const PHONECONTACT_BILL
	const PHONECONTACT_ELM
	const PHONECONTACT_BUENA
NUM_NONTRAINER_PHONECONTACTS EQU const_value - 1

KRIS EQU __trainer_class__
	trainerclass FALKNER ; 1
	const FALKNER1
	const MASTER_FALKNER

	trainerclass WHITNEY ; 2
	const WHITNEY1
	const MASTER_WHITNEY
	const JOY1
	const JOY2
	const JOY3
	const JOY4

	trainerclass BUGSY ; 3
	const BUGSY1
	const MASTER_BUGSY

	trainerclass MORTY ; 4
	const MORTY1
	const MASTER_MORTY

	trainerclass PRYCE ; 5
	const PRYCE1
	const MASTER_PRYCE

	trainerclass JASMINE ; 6
	const JASMINE1
	const MASTER_JASMINE

	trainerclass CHUCK ; 7
	const CHUCK1
	const MASTER_CHUCK

	trainerclass CLAIR ; 8
	const CLAIR1
	const MASTER_CLAIR

	trainerclass RIVAL1 ; 9
	const RIVAL1_1_CHIKORITA
	const RIVAL1_1_CYNDAQUIL
	const RIVAL1_1_TOTODILE
	const RIVAL1_2_CHIKORITA
	const RIVAL1_2_CYNDAQUIL
	const RIVAL1_2_TOTODILE
	const RIVAL1_3_CHIKORITA
	const RIVAL1_3_CYNDAQUIL
	const RIVAL1_3_TOTODILE
	const RIVAL1_4_CHIKORITA
	const RIVAL1_4_CYNDAQUIL
	const RIVAL1_4_TOTODILE
	const RIVAL1_5_CHIKORITA
	const RIVAL1_5_CYNDAQUIL
	const RIVAL1_5_TOTODILE

	trainerclass POKEMON_PROF ; a
	const PROF_OAK
	const MASTER_OAK

	trainerclass WILL ; b
	const WILL1
	const MASTER_WILL

	trainerclass CAL ; c
	const CAL1

	trainerclass BRUNO ; d
	const BRUNO1
	const MASTER_BRUNO

	trainerclass KAREN ; e
	const KAREN1
	const MASTER_KAREN

	trainerclass ADAM ; f
	const ADAM_ELITE
	const MASTER_ADAM
	const ADAM_ARCADE

	trainerclass CHAMPION ; 10
	const LANCE
	const MASTER_LANCE
	const LANCE_DRAGONITE
	const LANCE_ARCADE

	trainerclass BROCK ; 11
	const BROCK1
	const MASTER_BROCK

	trainerclass MISTY ; 12
	const MISTY1
	const MASTER_MISTY

	trainerclass LT_SURGE ; 13
	const LT_SURGE1
	const MASTER_SURGE

	trainerclass SCIENTIST ; 14
	const ROSS
	const MITCH
	const JED
	const MARC
	const RICH

	trainerclass ERIKA ; 15
	const ERIKA1
	const MASTER_ERIKA

	trainerclass YOUNGSTER ; 16
	const JOEY1
	const MIKEY
	const ALBERT
	const GORDON
	const SAMUEL
	const IAN
	const JOEY2
	const JOEY3
	const WARREN
	const JIMMY
	const OWEN
	const JASON
	const JOEY4
	const JOEY5
	const MASTER_JOEY
	const JULIUS

	trainerclass SCHOOLBOY ; 17
	const JACK1
	const KIPP
	const ALAN1
	const JOHNNY
	const DANNY
	const TOMMY
	const DUDLEY
	const JOE
	const BILLY
	const CHAD1
	const NATE
	const RICKY
	const JACK2
	const JACK3
	const ALAN2
	const ALAN3
	const CHAD2
	const CHAD3
	const JACK4
	const JACK5
	const ALAN4
	const ALAN5
	const CHAD4
	const CHAD5

	trainerclass BIRD_KEEPER ; 18
	const ROD
	const ABE
	const BRYAN
	const THEO
	const TOBY
	const DENIS
	const VANCE1
	const HANK
	const ROY
	const BORIS
	const BOB
	const JOSE1
	const PETER
	const JOSE2
	const PERRY
	const BRET
	const JOSE3
	const VANCE2
	const VANCE3

	trainerclass LASS ; 20
	const CARRIE
	const BRIDGET
	const ALICE
	const KRISE
	const CONNIE1
	const LINDA
	const LAURA
	const SHANNON
	const MICHELLE
	const DANA1
	const ELLEN
	const CONNIE2 ; unused
	const CONNIE3 ; unused
	const DANA2
	const DANA3
	const DANA4
	const DANA5
	const EVEE

	trainerclass JANINE ; 1a
	const JANINE1
	const MASTER_JANINE

	trainerclass COOLTRAINERM ; 1b
	const NICK
	const AARON
	const PAUL
	const CODY
	const MIKE
	const GAVEN1
	const GAVEN2
	const RYAN
	const JAKE
	const GAVEN3
	const BLAKE
	const BRIAN
	const ERICK ; unused
	const ANDY ; unused
	const TYLER ; unused
	const SEAN
	const KEVIN
	const STEVE ; unused
	const ALLEN
	const DARIN
	const TOBIAS
	const MASTER_TOBIAS
	const RONALD
	const BRAD
	const DOUGLAS

	trainerclass COOLTRAINERF ; 1c
	const GWEN
	const LOIS
	const FRAN
	const LOLA
	const KATE
	const IRENE
	const KELLY
	const JOYCE
	const BETH1
	const REENA1
	const MEGAN
	const BETH2
	const CAROL
	const QUINN
	const EMMA
	const CYBIL
	const JENN
	const BETH3
	const REENA2
	const REENA3
	const CARA
	const ROXANNE
	const CLARISSA

	trainerclass BEAUTY ; 1d
	const VICTORIA
	const SAMANTHA
	const JULIE ; unused
	const JACLYN ; unused
	const BRENDA ; unused
	const CASSIE
	const CAROLINE ; unused
	const CARLENE ; unused
	const JESSICA ; unused
	const RACHAEL ; giovanni gym
	const ANGELICA ; unused
	const KENDRA ; unused
	const VERONICA ; unused
	const JULIA
	const THERESA ; unused
	const VALERIE
	const OLIVIA
	const MASTER_DIANTHA
	const COLETTE
	const HILLARY
	const SHIRLEY

	trainerclass POKEMANIAC ; 1e
	const LARRY
	const ANDREW2
	const CALVIN
	const SHANE
	const BEN
	const BRENT1
	const RON
	const ETHAN
	const BRENT2
	const BRENT3
	const ISSAC
	const DONALD
	const ZACH
	const BRENT4
	const MILLER
	const AIZEN
	const MASTER_AIZEN
	const IRWIN1
	const FRITZ
	const HORTON
	const ULTIMA

	trainerclass GRUNTM ; 1f
	const GRUNTM_1
	const GRUNTM_2
	const GRUNTM_3
	const GRUNTM_4
	const GRUNTM_5
	const GRUNTM_6
	const GRUNTM_7
	const GRUNTM_8
	const GRUNTM_9
	const GRUNTM_10
	const GRUNTM_11
	const GRUNTM_12 ; unused
	const GRUNTM_13
	const GRUNTM_14
	const GRUNTM_15
	const GRUNTM_16
	const GRUNTM_17
	const GRUNTM_18
	const GRUNTM_19
	const GRUNTM_20
	const GRUNTM_21
	const GRUNTM_22 ; unused
	const GRUNTM_23 ; unused
	const GRUNTM_24
	const GRUNTM_25
	const GRUNTM_26 ; unused
	const GRUNTM_27 ; unused
	const GRUNTM_28
	const GRUNTM_29
	const GRUNTM_30
	const GRUNTM_31

	trainerclass GENTLEMAN ; 20 ; Remove?
	const PRESTON
	const EDWARD
	const GREGORY
	const VIRGIL ; unused
	const ALFRED

	trainerclass GIOVANNI ; 21 ; Remove?
	const LEADER_GIOVANNI
	const MASTER_GIOVANNI

	trainerclass CYNTHIA ; 22
	const CHAMP_CYNTHIA
	const MASTER_CYNTHIA
	const WIFE

	trainerclass SABRINA ; 23
	const SABRINA1
	const MASTER_SABRINA

	trainerclass BUG_CATCHER ; 24
	const DON
	const ROB
	const ED
	const WADE1
	const BUG_CATCHER_BENNY
	const AL
	const JOSH
	const ARNIE1
	const KEN
	const WADE2
	const WADE3
	const DOUG
	const ARNIE2
	const ARNIE3
	const WADE4
	const WADE5
	const ARNIE4
	const ARNIE5
	const WAYNE

	trainerclass FISHER ; 25
	const JUSTIN
	const RALPH1
	const ARNOLD
	const KYLE
	const HENRY
	const MARVIN
	const TULLY1
	const ANDRE
	const RAYMOND
	const WILTON1
	const EDGAR
	const JONAH
	const MARTIN
	const STEPHEN
	const BARNEY
	const RALPH2
	const RALPH3
	const TULLY2
	const TULLY3
	const WILTON2
	const SCOTT
	const WILTON3
	const RALPH4
	const RALPH5
	const TULLY4

	trainerclass SWIMMERM ; 26
	const HAROLD
	const SIMON
	const RANDALL
	const CHARLIE
	const GEORGE
	const BERKE
	const KIRK
	const MATHEW
	const HAL ; unused
	const PATON ; unused
	const DARYL ; unused
	const WALTER ; unused
	const TONY ; unused
	const JEROME
	const TUCKER
	const RICK ; unused
	const CAMERON
	const SETH
	const JAMES2 ; unused
	const LEWIS ; unused
	const PARKER

	trainerclass SWIMMERF ; 27
	const ELAINE
	const PAULA
	const KAYLEE
	const SUSIE
	const DENISE
	const KARA
	const WENDY
	const LISA ; unused
	const JILL ; unused
	const MARY ; unused
	const KATIE ; unused
	const DAWN
	const TARA ; unused
	const NICOLE
	const LORI
	const JODY ; unused
	const NIKKI
	const DIANA
	const BRIANA

	trainerclass SAILOR ; 28
	const EUGENE
	const HUEY1
	const TERRELL
	const KENT
	const ERNEST
	const JEFF
	const GARRETT
	const KENNETH
	const STANLY
	const HARRY
	const HUEY2
	const HUEY3
	const HUEY4

	trainerclass SUPER_NERD ; 29
	const STAN
	const ERIC
	const GREGG ; unused
	const JAY ; unused
	const DAVE ; unused
	const SAM
	const TOM
	const PAT
	const SHAWN
	const TERU
	const RUSS ; unused
	const NORTON ; unused
	const HUGH
	const MARKUS
	const CLYDE
	const VINCENT

	trainerclass RIVAL2 ; 2a
	const RIVAL2_SAFFRON
	const RIVAL2_SILVER_CAVE
	const MASTER_RIVAL

	trainerclass WALLACE ; 2b ; Remove?
	const EMPEROR_WALLACE
	const MASTER_WALLACE

	trainerclass HIKER ; 2c
	const ANTHONY1
	const RUSSELL
	const PHILLIP
	const LEONARD
	const ANTHONY2
	const BENJAMIN
	const ERIK
	const MICHAEL
	const PARRY1
	const TIMOTHY
	const BAILEY
	const ANTHONY3
	const TIM
	const NOLAND
	const SIDNEY
	const KENNY
	const JIM
	const DANIEL
	const PARRY2
	const PARRY3
	const ANTHONY4
	const ANTHONY5
	const MASTER_ALDER
	const MAHOGANY_MURDERER

	trainerclass BIKER ; 2d
	const BIKER_BENNY ; unused
	const KAZU ; unused
	const DWAYNE
	const HARRIS
	const ZEKE
	const CHARLES
	const RILEY
	const JOEL
	const GLENN

	trainerclass BLAINE ; 2e
	const BLAINE1
	const MASTER_BLAINE

	trainerclass STEVEN ; 2f ; Remove?
	const CHAMP_STEVEN
	const MASTER_STEVEN

	trainerclass FIREBREATHER ; 30
	const OTIS
	const DICK ; unused
	const NED ; unused
	const BURT
	const BILL
	const WALT
	const RAY
	const LYLE
	const DUNCAN
	const EDDIE
	const COREY

	trainerclass LEON ; 31 ; Remove?
	const CHAMP_LEON
	const MASTER_LEON
	const BROTHER

	trainerclass BLACKBELT_T ; 32
	const KENJI1 ; unused
	const YOSHI
	const KENJI2 ; unused
	const LAO
	const NOB
	const KIYO
	const LUNG
	const KENJI3
	const WAI
	const JONNY

	trainerclass EXECUTIVEM ; 33
	const EXECUTIVEM_1
	const EXECUTIVEM_2
	const EXECUTIVEM_3
	const EXECUTIVEM_4
	const PRIMERA

	trainerclass PSYCHIC_T ; 34
	const NATHAN
	const FRANKLIN
	const HERMAN
	const FIDEL
	const GREG
	const NORMAN
	const MARK
	const PHIL
	const RICHARD
	const GILBERT
	const JARED
	const RODNEY
	const JAMIE

	trainerclass PICNICKER ; 35
	const LIZ1
	const GINA1
	const BROOKE
	const KIM
	const CINDY
	const HOPE
	const SHARON
	const DEBRA
	const GINA2
	const ERIN1
	const LIZ2
	const LIZ3
	const HEIDI
	const EDNA
	const GINA3
	const TIFFANY1
	const TIFFANY2
	const ERIN2
	const TANYA
	const TIFFANY3
	const ERIN3
	const LIZ4
	const LIZ5
	const GINA4
	const GINA5
	const TIFFANY4

	trainerclass CAMPER ; 36
	const ROLAND
	const TODD1
	const IVAN
	const ELLIOT
	const BARRY
	const LLOYD
	const DEAN
	const SID
	const HARVEY ; unused
	const DALE ; unused
	const TED
	const TODD2
	const TODD3
	const THOMAS ; unused
	const LEROY ; unused
	const DAVID ; unused
	const JOHN ; unused
	const JERRY
	const SPENCER
	const TODD4
	const TODD5
	const QUENTIN

	trainerclass EXECUTIVEF ; 37
	const EXECUTIVEF_1
	const EXECUTIVEF_2
	const MASTER_EXECUTIVEF

	trainerclass SAGE ; 38
	const CHOW
	const NICO
	const JIN
	const TROY
	const JEFFREY
	const PING
	const EDMOND
	const NEAL
	const LI
	const GAKU
	const MASA
	const KOJI
	const HENSHIN
	const XEHANORT
	const MASTER_XEHANORT

	trainerclass MEDIUM ; 39
	const MARTHA
	const GRACE
	const BETHANY ; unused
	const MARGRET ; unused
	const ETHEL ; unused
	const REBECCA
	const DORIS
	const ATHENA

	trainerclass SOLDIER ; 3a
	const SOLDIER_1
	const SOLDIER_2
	const SOLDIER_3
	const SOLDIER_4
	const SOLDIER_5
	const SOLDIER_6
	const SOLDIER_7
	const SOLDIER_8
	const SOLDIER_9
	const SOLDIER_SPY
	const MASTER_DRAKE

	trainerclass POKEFANM ; 3b
	const WILLIAM
	const DEREK1
	const ROBERT
	const JOSHUA
	const CARTER
	const TREVOR
	const BRANDON
	const JEREMY
	const COLIN
	const DEREK2 ; unused
	const DEREK3 ; unused
	const JARETH
	const REX
	const ALLAN
	const CHRIS_CHAN
	const MASTER_CHRIS_CHAN

	trainerclass KIMONO_GIRL ; 3c
	const NAOKO_UNUSED ; unused
	const NAOKO
	const SAYO
	const ZUKI
	const KUNI
	const MIKI
	const YUNA_1
	const YUNA_2
	const MASTER_YUNA
	const AERITH_1
	const AERITH_2
	const MASTER_AERITH

	trainerclass TWINS ; 3d
	const AMYANDMAY1
	const ANNANDANNE1
	const ANNANDANNE2
	const AMYANDMAY2
	const JOANDZOE1
	const JOANDZOE2
	const MEGANDPEG1
	const MEGANDPEG2
	const LEAANDPIA1
	const LEAANDPIA2 ; unused

	trainerclass POKEFANF ; 3e
	const BEVERLY1
	const RUTH
	const KATHLEEN
	const BEVERLY3
	const GEORGIA
	const JAIME

	trainerclass RED ; 3f
	const RED1
	const MASTER_RED
	const RED_MEWTWO

	trainerclass BLUE ; 40
	const BLUE1
	const MASTER_BLUE
	const SETO
	const MASTER_SETO
	const BLUE_ARCADE

	trainerclass OFFICER ; 41 ; Remove?
	const KEITH
	const DIRK

	trainerclass GRUNTF ; 42
	const GRUNTF_1
	const GRUNTF_2
	const GRUNTF_3
	const GRUNTF_4
	const GRUNTF_5
	const GRUNTF_6

	trainerclass MYSTICALMAN ; 43
	const EUSINE
	const EUSINE_CELADON
	const MASTER_EUSINE
	const KING_JARETH

    trainerclass INVADER ; 44
    const GIANT_DAD
    const SIEGMEYER
    const LAUTREC
    const BACKSTABER
    const PATCHES
    const LOGAN
    const SOLAIRE
    const HAVEL
    const OROBORO
    const LEEROY
    const VARRE
    const ARTORIAS
    const MASTER_PATCHES
    const MANUS

    trainerclass CRYSTAL ; 45
    const CRYSTAL_1
    const CRYSTAL_2
    const CRYSTAL_3
    const CRYSTAL_4
    const CRYSTAL_5
    const CRYSTAL_6
    const CRYSTAL_7
    const MASTER_CRYSTAL

    trainerclass LEAF ; 46
    const GREEN1
    const MASTER_GREEN
    const GREEN_ARCADE

    trainerclass LORD_OAK ; 47
    const OAK

    trainerclass ROLE_PLAYER_NORMAL ; 48
    const SW_CH1_HERO       ; gui gon, obi wan, anikan
    const SW_CH1_VILLAIN    ; maul
    const SW_CH2_HERO       ; obi wan
    const SW_CH2_VILLAIN    ; anikan
    const SW_CH3_HERO       ; xwing, xwing, luke xwing, falcon
    const SW_CH3_VILLAIN    ; tie fight, tie fight, tie adv, death star
    const SW_CH4_HERO       ; luke
    const SW_CH4_VILLAIN    ; vader, emperor
    const SW_CH5_HERO       ; luke, vader
    const SW_CH5_VILLAIN    ; emperor
    const SW_CH6_HERO       ; obi wan, luke, leia, anikan
    const SW_CH6_VILLAIN    ; maul, grevious, vader, emperor

    const YGO_HENSHIN       ; cosmo qe, mb dragon, pug moth, g guardian
    const YGO_SETO          ; bew dragon, bew dragon, bew dragon, ult dragon
    const YGO_YAMI          ; obilesk, slipher, ra, exodia
    const YGO_YAMI_WEAK     ; kuribo, dark mag, dark mag g, chaos mag
    const YGO_SETO_YAMI     ; g guardian, ult dragon, yami
    const YGO_NIGHTMARE     ; orichalcos, necrofiend, raigeki, draco jar, relinquish, div serpnt

    const DBZ_CH1_HERO      ; goku, picollo
    const DBZ_CH1_VILLAIN   ; raddiz
    const DBZ_CH2_HERO      ; yamcha, tein, krillin, picollo, gohan
    const DBZ_CH2_VILLAIN   ; nappa, vegita
    const DBZ_CH3_HERO      ; goku
    const DBZ_CH4_HERO      ; goku, vegita
    const DBZ_CH4_VILLAIN   ; freeza

    const LOTR_CH1_HERO     ; frodo, sam
    const LOTR_CH1_VILLAIN  ; witch king
    const LOTR_CH2_HERO     ; aragon, legolas, gim, gandalf
    const LOTR_CH2_VILLAIN  ; ork, worg, LURTZ, balrog
    const LOTR_CH3_HERO     ; gandalf
    const LOTR_CH3_VILLAIN  ; grima, saroman, witch king
    const LOTR_CH4_HERO     ; aragon, undead
    const LOTR_CH4_VILLAIN  ; nasgule, mumakil, gothmog
    const LOTR_CH5_HERO     ; frodo, sam
    const LOTR_CH5_VILLAIN  ; sauron
    const LOTR_CH6_HERO     ; frodo, sam, legolas, gimli, aragorn, gandalf
    const LOTR_CH6_VILLAIN  ; lurtz, gothmog, saruman, witch king, balrog, sauron

    const MERLIN_MERLIN     ; merlin
    const MERLIN_ARTHUR    ; arthur
    const MERLIN_MORGANA    ; morgana
    const MERLIN_UTHER      ; uther
    const MERLIN_MORDRED    ; mordred
    const MERLIN_HEROES      ; arthur, merlin, gwen, uther, gaius, kilgharrah
    const MERLIN_VILLAINS   ; mordred, morgana, aithusa

    const HOEN_WAR_KOGA
    const HOEN_WAR_DRAKE
    const HOEN_WAR_JANINE
    const HOEN_WAR_WALLACE

    const MULTIVERSE_HEROES        ; luke, darkMagG, Goku, Aero, Gandalf, Merlin
    const MULTIVERSE_VILLAINS      ; Freiza, Mordred, Necrofiend, Palp, GeoWeapon, Sauron
    const MULTIVERSE_DEITIES       ; Force, Shenron, Exodia, Galadreil, Aithusa, Arceus

    trainerclass ROLE_PLAYER_SHINY ; 48
    const DBZ_CH5_VEGETA
    const DBZ_CH5_GOKU
    const MERLIN_EMRYS
    const HOEN_WAR_ARCEUS

	trainerclass CAL_F
	const CAL_F1

	trainerclass DAD
	const DAD_1
	const CELADON_ME
	const ME
	const ME_IMPOSSIBLE

	trainerclass JONATHAN
	const JONATHAN_1
	const JONATHAN_ARCADE
	const MASTER_JONATHAN

	trainerclass ASH
	const ASH1
	const MASTER_ASH
	const ATEM

NUM_TRAINER_CLASSES EQU __trainer_class__ - 1

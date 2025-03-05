; pokemon ids
; indexes for:
; - PokemonNames (see data/pokemon/names.asm)
; - BaseData (see data/pokemon/base_stats.asm)
; - EvosAttacksPointers (see data/pokemon/evos_attacks_pointers.asm)
; - EggMovePointers (see data/pokemon/egg_move_pointers.asm)
; - PokemonCries (see data/pokemon/cries.asm)
; - MonMenuIcons (see data/pokemon/menu_icons.asm)
; - PokemonPicPointers (see data/pokemon/pic_pointers.asm)
; - PokemonPalettes (see data/pokemon/palettes.asm)
; - PokedexDataPointerTable (see data/pokemon/dex_entry_pointers.asm)
; - AlphabeticalPokedexOrder (see data/pokemon/dex_order_alpha.asm)
; - NewPokedexOrder (see data/pokemon/dex_order_new.asm)
; - Pokered_MonIndices (see data/pokemon/gen1_order.asm)
; - Footprints (see gfx/footprints.asm)
; - AnimationPointers (see gfx/pokemon/anim_pointers.asm)
; - AnimationIdlePointers (see gfx/pokemon/idle_pointers.asm)
; - BitmasksPointers (see gfx/pokemon/bitmask_pointers.asm)
; - FramesPointers (see gfx/pokemon/frame_pointers.asm)
; - EZChat_SortedPokemon (see data/pokemon/ezchat_order.asm)
	const_def 1
	const BULBASAUR  ; 01
	const IVYSAUR    ; 02
	const VENUSAUR   ; 03
	const CHARMANDER ; 04
	const CHARMELEON ; 05
	const CHARIZARD  ; 06
	const SQUIRTLE   ; 07
	const WARTORTLE  ; 08
	const BLASTOISE  ; 09
	const CATERPIE   ; 0a
	const METAPOD    ; 0b
	const BUTTERFREE ; 0c
	const HONEDGE    ; 0d
	const DOUBLADE   ; 0e
	const AEGISLASH  ; 0f
	const STARLY     ; 10
	const STARAVIA   ; 11
	const STARAPTOR  ; 12
	const RATTATA    ; 13
	const RATICATE   ; 14
	const BUNEARY    ; 15
	const LOPUNNY    ; 16
	const EKANS      ; 17 *
	const ARBOK      ; 18 *
	const PIKACHU    ; 19
	const RAICHU     ; 1a
	const ROTOM  ; 1b *
	const POLTEGEIST  ; 1c *
	const NIDORAN_F  ; 1d
	const NIDORINA   ; 1e
	const NIDOQUEEN  ; 1f
	const NIDORAN_M  ; 20
	const NIDORINO   ; 21
	const NIDOKING   ; 22
	const CLEFAIRY   ; 23
	const CLEFABLE   ; 24
	const VULPIX     ; 25
	const NINETALES  ; 26
	const JIGGLYPUFF ; 27
	const WIGGLYTUFF ; 28
	const ZUBAT      ; 29
	const GOLBAT     ; 2a
	const PAWNIARD     ; 2b  ....
	const BISHARP      ; 2c  ....
	const REGIGIGAS  ; 2d  ....
	const ZYGARDE      ; 2e
	const HAWLUCHA   ; 2f
	const LARVESTA   ; 30
	const VOLCARONA  ; 31
	const ARCTOZOLT    ; 32 *
	const ARCTOVISH    ; 33 *
	const MEOWTH     ; 34
	const PERSIAN    ; 35
	const PSYDUCK    ; 36 *
	const GOLDUCK    ; 37 *
	const SHROOMISH  ; 38
	const BRELOOM    ; 39
	const GROWLITHE  ; 3a
	const ARCANINE   ; 3b
	const POLIWAG    ; 3c
	const POLIWHIRL  ; 3d
	const POLIWRATH  ; 3e
	const ABRA       ; 3f
	const KADABRA    ; 40
	const ALAKAZAM   ; 41
	const MACHOP     ; 42
	const MACHOKE    ; 43
	const MACHAMP    ; 44
	const BELLSPROUT ; 45
	const WEEPINBELL ; 46
	const VICTREEBEL ; 47
	const TENTACOOL  ; 48
	const TENTACRUEL ; 49
	const GEODUDE    ; 4a
	const GRAVELER   ; 4b
	const GOLEM      ; 4c
	const PONYTA     ; 4d *
	const RAPIDASH   ; 4e *
	const SLOWPOKE   ; 4f
	const SLOWBRO    ; 50
	const MAGNEMITE  ; 51
	const MAGNETON   ; 52
	const MAMOSWINE  ; 53
	const ELECTIVIRE ; 54
	const MAGNEZONE  ; 55
	const YANMEGA    ; 56
	const GLISCOR    ; 57
	const FERROSEED  ; 58
	const FERROTHORN ; 59
	const SHELLDER   ; 5a
	const CLOYSTER   ; 5b
	const GASTLY     ; 5c
	const HAUNTER    ; 5d
	const GENGAR     ; 5e
	const ONIX       ; 5f
	const DROWZEE    ; 60
	const HYPNO      ; 61
	const FEEBAS     ; 62
	const MILOTIC    ; 63
	const MUDKIP    ; 64
	const ELECTRODE  ; 65
	const EXEGGCUTE  ; 66
	const EXEGGUTOR  ; 67
	const MARILL     ; 68
	const AZUMARILL  ; 69
	const SOLOSIS    ; 6a
	const DUOSION    ; 6b
	const REUNICLUS  ; 6c
	const KOFFING    ; 6d
	const WEEZING    ; 6e
	const RHYHORN    ; 6f
	const RHYDON     ; 70
	const CHANSEY    ; 71
	const WEAVILE    ; 72
	const RHYPERIOR  ; 73
	const HORSEA     ; 74
	const SEADRA     ; 75
	const MAGMORTAR  ; 76
	const HONCHKROW  ; 77
	const STARYU     ; 78
	const STARMIE    ; 79
	const MR__MIME   ; 7a
	const SCYTHER    ; 7b
	const JYNX       ; 7c
	const ELECTABUZZ ; 7d
	const MAGMAR     ; 7e
	const PINSIR     ; 7f
	const TAUROS     ; 80
	const MAGIKARP   ; 81
	const GYARADOS   ; 82
	const LAPRAS     ; 83
	const DITTO      ; 84
	const EEVEE      ; 85
	const VAPOREON   ; 86
	const JOLTEON    ; 87
	const FLAREON    ; 88
	const PORYGON    ; 89
	const RALTS      ; 8a
	const KIRLIA     ; 8b
	const GARDEVOIR  ; 8c
	const GALLADE     ; 8d
	const AERODACTYL ; 8e
	const SNORLAX    ; 8f
	const ARTICUNO   ; 90
	const ZAPDOS     ; 91
	const MOLTRES    ; 92
	const DRATINI    ; 93
	const DRAGONAIR  ; 94
	const DRAGONITE  ; 95
	const DARKRAI    ; 96
	const MEW        ; 97
JOHTO_POKEMON EQU const_value
	const TREECKO    ; 98
	const GROVYLE    ; 99
	const SCEPTILE   ; 9a
	const CHIMCHAR   ; 9b
	const MONFERNO   ; 9c
	const INFERNAPE  ; 9d
	const FROAKIE    ; 9e
	const FROGADIER  ; 9f
	const GRENINJA   ; a0
	const RIOLU      ; a1
	const LUCARIO    ; a2
	const HOOTHOOT   ; a3
	const NOCTOWL    ; a4
	const DRILBUR    ; a5
	const EXCADRILL  ; a6
	const JOLTIK     ; a7
	const GALVANTULA ; a8
	const CROBAT     ; a9
	const CHINCHOU   ; aa
	const LANTURN    ; ab
	const LITWICK    ; ac
	const LAMPENT    ; ad
	const CHANDELURE ; ae
	const TOGEPI     ; af
	const TOGETIC    ; b0
	const TOGEKISS   ; b1
	const SIGILYPH   ; b2
	const MAREEP     ; b3
	const FLAAFFY    ; b4
	const AMPHAROS   ; b5
	const SYLVEON    ; b6
	const MISMAGIUS  ; b7
	const PORYGONZ   ; b8
	const GENESECT   ; b9
	const POLITOED   ; ba
	const TIMBURR    ; bb
	const GURDURR    ; bc
	const CONKELDURR ; bd
	const BELDUM     ; be
	const METANG     ; bf
	const METAGROSS  ; c0
	const YANMA      ; c1
	const MARSHTOMP     ; c2 *
	const SWAMPERT   ; c3 *
	const ESPEON     ; c4
	const UMBREON    ; c5
	const MURKROW    ; c6
	const SLOWKING   ; c7
	const MISDREAVUS ; c8
	const UNOWN      ; c9
	const WOBBUFFET  ; ca
	const BAGON      ; cb
	const SHELGON    ; cc
	const SALAMENCE  ; cd
	const DUNSPARCE  ; ce
	const GLIGAR     ; cf
	const STEELIX    ; d0
	const GIBLE      ; d1
	const GABITE     ; d2
	const GARCHOMP   ; d3
	const SCIZOR     ; d4
	const SHAYMIN    ; d5
	const HERACROSS  ; d6
	const SNEASEL    ; d7
	const TEDDIURSA  ; d8
	const URSARING   ; d9
	const LATIAS     ; da
	const DEOXYS     ; db
	const SWINUB     ; dc
	const PILOSWINE  ; dd
	const SPIRITOMB  ; de
	const LATIOS     ; df
	const PALKIA     ; e0
	const KYOGRE     ; e1
	const GROUDON    ; e2
	const SKARMORY   ; e3
	const HOUNDOUR   ; e4
	const HOUNDOOM   ; e5
	const KINGDRA    ; e6
	const COTTONEE   ; e7
	const WHIMSICOTT ; e8
	const PORYGON2   ; e9
	const RAYQUAZA   ; ea
	const SMEARGLE   ; eb
	const DIALGA     ; ec
	const KLEFKI     ; ed
	const XERNEAS    ; ee
	const YVELTAL    ; ef
	const GIRATINA   ; f0
	const MILTANK    ; f1
	const BLISSEY    ; f2
	const RAIKOU     ; f3
	const ENTEI      ; f4
	const SUICUNE    ; f5
	const LARVITAR   ; f6
	const PUPITAR    ; f7
	const TYRANITAR  ; f8
	const LUGIA      ; f9
	const HO_OH      ; fa
	const CELEBI     ; fb
	const MEWTWO     ; fc
	const ARCEUS     ; fd
NUM_POKEMON EQU const_value - 1
	const EGG        ; fe

; Unown forms
; indexes for:
; - UnownWords (see data/pokemon/unown_words.asm)
; - UnownPicPointers (see data/pokemon/unown_pic_pointers.asm)
; - UnownAnimationPointers (see gfx/pokemon/unown_anim_pointers.asm)
; - UnownAnimationIdlePointers (see gfx/pokemon/unown_idle_pointers.asm)
; - UnownBitmasksPointers (see gfx/pokemon/unown_bitmask_pointers.asm)
; - UnownFramesPointers (see gfx/pokemon/unown_frame_pointers.asm)
	const_def 1
	const UNOWN_A ;  1
	const UNOWN_B ;  2
	const UNOWN_C ;  3
	const UNOWN_D ;  4
	const UNOWN_E ;  5
	const UNOWN_F ;  6
	const UNOWN_G ;  7
	const UNOWN_H ;  8
	const UNOWN_I ;  9
	const UNOWN_J ; 10
	const UNOWN_K ; 11
	const UNOWN_L ; 12
	const UNOWN_M ; 13
	const UNOWN_N ; 14
	const UNOWN_O ; 15
	const UNOWN_P ; 16
	const UNOWN_Q ; 17
	const UNOWN_R ; 18
	const UNOWN_S ; 19
	const UNOWN_T ; 20
	const UNOWN_U ; 21
	const UNOWN_V ; 22
	const UNOWN_W ; 23
	const UNOWN_X ; 24
	const UNOWN_Y ; 25
	const UNOWN_Z ; 26
NUM_UNOWN EQU const_value - 1 ; 26

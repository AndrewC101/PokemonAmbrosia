INCLUDE "constants.asm"


SECTION "Evolutions and Attacks", ROMX

; Evos+attacks data structure:
; - Evolution methods:
;    * db EVOLVE_LEVEL, level, species
;    * db EVOLVE_ITEM, used item, species
;    * db EVOLVE_TRADE, held item (or -1 for none), species
;    * db EVOLVE_HAPPINESS, TR_* constant (ANYTIME, MORNDAY, NITE), species
;    * db EVOLVE_STAT, level, ATK_*_DEF constant (LT, GT, EQ), species
; - db 0 ; no more evolutions
; - Learnset (in increasing level order):
;    * db level, move
; - db 0 ; no more level-up moves

INCLUDE "data/pokemon/evos_attacks_pointers.asm"

EvosAttacks::

BulbasaurEvosAttacks:
	db EVOLVE_LEVEL, 16, IVYSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, LEECH_SEED
	db 12, SLUDGE
	db 17, RAZOR_LEAF
	db 18, SLEEP_POWDER
	db 20, STUN_SPORE
	db 25, LEAF_BLADE
	db 30, CROSS_POISON
	db 33, SLUDGE_BOMB
	db 40, GROWTH
	db 45, SYNTHESIS
;	db 50, SOLARBEAM
	db 0 ; no more level-up moves

IvysaurEvosAttacks:
	db EVOLVE_LEVEL, 32, VENUSAUR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, LEECH_SEED
	db 12, SLUDGE
	db 16, RAZOR_LEAF
	db 18, SLEEP_POWDER
	db 20, STUN_SPORE
	db 25, LEAF_BLADE
	db 30, CROSS_POISON
	db 33, SLUDGE_BOMB
	db 40, GROWTH
	db 45, SYNTHESIS
;	db 50, SOLARBEAM
	db 0 ; no more level-up moves

VenusaurEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 7, LEECH_SEED
	db 12, SLUDGE
	db 16, RAZOR_LEAF
	db 18, SLEEP_POWDER
	db 20, STUN_SPORE
	db 25, LEAF_BLADE
	db 30, CROSS_POISON
	db 32, SLUDGE_BOMB
	db 40, GROWTH
	db 45, SYNTHESIS
	db 50, SOLARBEAM
	db 0 ; no more level-up moves

CharmanderEvosAttacks:
	db EVOLVE_LEVEL, 16, CHARMELEON
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 17, FLAME_WHEEL
	db 25, SLASH
	db 36, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

CharmeleonEvosAttacks:
	db EVOLVE_LEVEL, 36, CHARIZARD
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 16, FLAME_WHEEL
	db 25, SLASH
	db 30, DRAGON_PULSE
	db 37, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

CharizardEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, GROWL
	db 7, EMBER
	db 13, SMOKESCREEN
	db 20, RAGE
	db 25, SLASH
	db 30, DRAGON_PULSE
	db 36, WING_ATTACK
	db 36, FLAMETHROWER
	db 40, AIR_SLASH
	db 50, FIRE_BLAST
	db 55, FLARE_BLITZ
	db 60, DRAGON_DANCE
	db 0 ; no more level-up moves

SquirtleEvosAttacks:
	db EVOLVE_LEVEL, 16, WARTORTLE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, DEFENSE_CURL
	db 12, WATER_GUN
	db 17, BITE
	db 20, RAPID_SPIN
	db 25, BUBBLEBEAM
	db 31, BODY_SLAM
	db 37, RAIN_DANCE
	db 40, SURF
	db 50, HYDRO_PUMP
	db 60, SHELL_SMASH
	db 0 ; no more level-up moves

WartortleEvosAttacks:
	db EVOLVE_LEVEL, 36, BLASTOISE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, DEFENSE_CURL
	db 13, WATER_GUN
	db 16, BITE
	db 20, RAPID_SPIN
	db 25, BUBBLEBEAM
	db 31, BODY_SLAM
	db 37, RAIN_DANCE
	db 40, SURF
	db 50, HYDRO_PUMP
	db 60, SHELL_SMASH
	db 0 ; no more level-up moves

BlastoiseEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, BUBBLE
	db 10, DEFENSE_CURL
	db 13, WATER_GUN
	db 19, BITE
	db 20, RAPID_SPIN
	db 25, BUBBLEBEAM
	db 31, BODY_SLAM
	db 37, RAIN_DANCE
	db 40, SURF
	db 50, HYDRO_PUMP
	db 60, SHELL_SMASH
	db 0 ; no more level-up moves

CaterpieEvosAttacks:
	db EVOLVE_LEVEL, 7, METAPOD
	db 0 ; no more evolutions
	db 1, TACKLE
	db 0 ; no more level-up moves

MetapodEvosAttacks:
	db EVOLVE_LEVEL, 10, BUTTERFREE
	db 0 ; no more evolutions
	db 1, HARDEN
	db 1, TACKLE
	db 7, HARDEN
	db 0 ; no more level-up moves

ButterfreeEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 10, CONFUSION
	db 12, LEECH_LIFE
	db 15, POISONPOWDER
	db 15, STUN_SPORE
	db 18, SLEEP_POWDER
	db 23, PSYBEAM
	db 28, PSYCHIC_M
	db 32, AIR_SLASH
	db 36, BUG_BUZZ
	db 40, QUIVER_DANCE
	db 50, BATON_PASS
	db 0 ; no more level-up moves

HonedgeEvosAttacks:
	db EVOLVE_LEVEL, 30, DOUBLADE
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 1, NIGHT_SHADE
	db 12, METAL_CLAW
	db 20, SLASH
	db 24, NIGHT_SLASH
	db 28, SHADOW_BALL
	db 31, IRON_HEAD
	db 36, SHADOW_PUNCH
	db 39, FLASH_CANNON
	db 45, CLOSE_COMBAT
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

DoubladeEvosAttacks:
	db EVOLVE_LEVEL, 40, AEGISLASH
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 1, NIGHT_SHADE
	db 12, METAL_CLAW
	db 20, SLASH
	db 24, NIGHT_SLASH
	db 28, SHADOW_BALL
	db 30, IRON_HEAD
	db 36, SHADOW_PUNCH
	db 39, FLASH_CANNON
	db 45, CLOSE_COMBAT
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

AegislashEvosAttacks:
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 1, NIGHT_SHADE
	db 12, METAL_CLAW
	db 20, SLASH
	db 24, NIGHT_SLASH
	db 28, SHADOW_BALL
	db 32, IRON_HEAD
	db 36, SHADOW_PUNCH
	db 39, FLASH_CANNON
	db 40, KINGS_SHIELD
	db 42, BULLET_PUNCH
	db 45, KINGS_SHIELD
	db 46, CLOSE_COMBAT
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

StarlyEvosAttacks:
	db EVOLVE_LEVEL, 14, STARAVIA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PECK
	db 1, SAND_ATTACK
	db 5, QUICK_ATTACK
	db 9, FALSE_SWIPE
	db 15, WING_ATTACK
	db 24, SLASH
	db 35, FLY
	db 36, ROOST
	db 40, EXTREMESPEED
	db 45, DOUBLE_EDGE
	db 50, CLOSE_COMBAT
	db 55, BRAVE_BIRD
	db 0 ; no more level-up moves

StaraviaEvosAttacks:
	db EVOLVE_LEVEL, 34, STARAPTOR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PECK
    db 1, SAND_ATTACK
	db 5, QUICK_ATTACK
	db 9, FALSE_SWIPE
	db 14, WING_ATTACK
	db 24, SLASH
	db 35, FLY
	db 36, ROOST
	db 40, EXTREMESPEED
	db 45, DOUBLE_EDGE
	db 50, CLOSE_COMBAT
	db 55, BRAVE_BIRD
	db 0 ; no more level-up moves

StaraptorEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PECK
	db 1, SAND_ATTACK
	db 5, QUICK_ATTACK
	db 9, FALSE_SWIPE
	db 16, WING_ATTACK
	db 24, SLASH
	db 34, FLY
	db 36, ROOST
	db 40, EXTREMESPEED
	db 45, DOUBLE_EDGE
	db 50, CLOSE_COMBAT
	db 55, BRAVE_BIRD
	db 0 ; no more level-up moves

RattataEvosAttacks:
	db EVOLVE_LEVEL, 20, RATICATE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 13, HYPER_FANG
	db 20, FALSE_SWIPE
	db 25, CRUNCH
	db 30, EXTREMESPEED
	db 50, FINAL_FANG
	db 0 ; no more level-up moves

RaticateEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 7, QUICK_ATTACK
	db 13, HYPER_FANG
	db 20, FALSE_SWIPE
	db 25, CRUNCH
	db 30, EXTREMESPEED
	db 50, FINAL_FANG
	db 0 ; no more level-up moves

BunearyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, LOPUNNY
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SPLASH
	db 9, DRAIN_KISS
	db 12, QUICK_ATTACK
	db 16, CHARM
	db 20, DOUBLE_KICK
	db 24, HEADBUTT
	db 28, ATTRACT
	db 33, DRAIN_PUNCH
	db 36, SUCKER_PUNCH
	db 40, PLAY_ROUGH
	db 46, MEGA_KICK
	db 50, HI_JUMP_KICK
	db 0 ; no more level-up moves

LopunnyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SPLASH
	db 9, DRAIN_KISS
	db 12, QUICK_ATTACK
	db 16, CHARM
	db 20, DOUBLE_KICK
	db 24, HEADBUTT
	db 28, ATTRACT
	db 33, DRAIN_PUNCH
	db 36, SUCKER_PUNCH
	db 40, PLAY_ROUGH
	db 46, MEGA_KICK
	db 50, HI_JUMP_KICK
	db 0 ; no more level-up moves

EkansEvosAttacks:
	db EVOLVE_LEVEL, 22, ARBOK
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 9, POISON_STING
	db 15, BITE
	db 23, GLARE
	db 28, CRUNCH
	db 33, CROSS_POISON
	db 40, HAZE
	db 45, DRAGON_DANCE
	db 0 ; no more level-up moves

ArbokEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 9, POISON_STING
	db 15, BITE
	db 23, GLARE
	db 28, CRUNCH
	db 33, CROSS_POISON
	db 40, HAZE
	db 45, DRAGON_DANCE
	db 0 ; no more level-up moves

PikachuEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, RAICHU
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
	db 20, BODY_SLAM
	db 26, DISCHARGE
	db 30, AGILITY
	db 33, CRUNCH
	db 36, THUNDERBOLT
	db 40, EXTREMESPEED
	db 45, THUNDER
	db 50, VOLT_TACKLE
	db 85, PIKA_THUNDER
	db 0 ; no more level-up moves

RaichuEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, GROWL
	db 6, TAIL_WHIP
	db 8, THUNDER_WAVE
	db 11, QUICK_ATTACK
	db 20, BODY_SLAM
	db 26, DISCHARGE
	db 33, CRUNCH
	db 36, THUNDERBOLT
	db 45, THUNDER
	db 50, VOLT_TACKLE
	db 0 ; no more level-up moves

RotomEvosAttacks:
	db 0 ; no more evolutions
	db 1, THUNDERSHOCK
	db 1, WATER_GUN
	db 10, CONFUSE_RAY
	db 15, THUNDER_WAVE
	db 25, PAIN_SPLIT
	db 30, SHADOW_BALL
	db 35, DISCHARGE
	db 40, THUNDERBOLT
	db 45, HYDRO_PUMP
	db 0 ; no more level-up moves

PoltegeistEvosAttacks:
	db 0 ; no more evolutions
	db 1, DEFENSE_CURL
	db 1, MEGA_DRAIN
	db 10, LICK
	db 30, SHADOW_BALL
	db 35, GIGA_DRAIN
	db 45, NASTY_PLOT
	db 60, SHELL_SMASH
	db 75, BATON_PASS
	db 0 ; no more level-up moves

NidoranFEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, SCRATCH
	db 8, ACID
	db 10, DOUBLE_KICK
	db 12, POISON_STING
	db 17, HORN_ATTACK
	db 20, SLUDGE
	db 0 ; no more level-up moves

NidorinaEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOQUEEN
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, SCRATCH
	db 8, ACID
	db 10, DOUBLE_KICK
	db 12, POISON_STING
	db 16, HORN_ATTACK
	db 20, SLUDGE
	db 0 ; no more level-up moves

NidoqueenEvosAttacks:
	db 0 ; no more evolutions
	db 8, ACID
	db 10, DOUBLE_KICK
	db 12, POISON_STING
	db 17, HORN_ATTACK
	db 20, SLUDGE
	db 30, BODY_SLAM
	db 35, SLUDGE_BOMB
	db 40, EARTH_POWER
	db 0 ; no more level-up moves

NidoranMEvosAttacks:
	db EVOLVE_LEVEL, 16, NIDORINO
	db 0 ; no more evolutions
	db 1, LEER
	db 1, HORN_ATTACK
	db 8, ACID
	db 10, DOUBLE_KICK
	db 12, POISON_STING
	db 20, SLUDGE
	db 0 ; no more level-up moves

NidorinoEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, NIDOKING
	db 0 ; no more evolutions
	db 1, LEER
	db 1, HORN_ATTACK
	db 8, ACID
	db 10, DOUBLE_KICK
	db 12, POISON_STING
	db 20, SLUDGE
	db 0 ; no more level-up moves

NidokingEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, DOUBLE_KICK
	db 1, POISON_STING
	db 20, SLUDGE
	db 30, THRASH
	db 35, CROSS_POISON
	db 40, EARTHQUAKE
	db 0 ; no more level-up moves

ClefairyEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, CLEFABLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, GROWL
	db 4, SPLASH
	db 8, SING
	db 16, DRAIN_KISS
	db 25, MOONLIGHT
	db 30, ATTRACT
	db 36, PLAY_ROUGH
	db 40, MOON_BLAST
	db 45, CALM_MIND
	db 0 ; no more level-up moves

ClefableEvosAttacks:
	db 0 ; no more evolutions
	db 1, SING
	db 1, METRONOME
	db 16, DRAIN_KISS
	db 25, MOONLIGHT
	db 30, ATTRACT
	db 36, PLAY_ROUGH
	db 40, MOON_BLAST
	db 45, CALM_MIND
	db 0 ; no more level-up moves

VulpixEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, NINETALES
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, EMBER
	db 10, CONFUSE_RAY
	db 14, DRAIN_KISS
	db 20, PSYBEAM
	db 25, HYPNOSIS
	db 30, FLAME_WHEEL
	db 36, FLAMETHROWER
	db 40, MOON_BLAST
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

NinetalesEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, EMBER
	db 10, CONFUSE_RAY
	db 14, DRAIN_KISS
	db 20, PSYBEAM
	db 25, HYPNOSIS
	db 30, FLAME_WHEEL
	db 36, FLAMETHROWER
	db 40, MOON_BLAST
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

MawileEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 10, BITE
	db 15, METAL_CLAW
	db 20, DRAIN_KISS
	db 25, CRUNCH
	db 30, SUCKER_PUNCH
	db 35, IRON_HEAD
	db 40, PLAY_ROUGH
	db 0 ; no more level-up moves

KingambitEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 10, METAL_CLAW
	db 15, FEINT_ATTACK
	db 18, FALSE_SWIPE
	db 20, MACH_PUNCH
	db 25, BULLET_PUNCH
	db 30, NIGHT_SLASH
	db 35, IRON_HEAD
	db 41, SUCKER_PUNCH
	db 50, SWORDS_DANCE
	db 60, GUILLOTINE
	db 0 ; no more level-up moves

ZubatEvosAttacks:
	db EVOLVE_LEVEL, 22, GOLBAT
	db 0 ; no more evolutions
	db 1, ACID
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 10, BITE
	db 13, HYPNOSIS
	db 17, CONFUSE_RAY
	db 20, SLUDGE
	db 23, WING_ATTACK
	db 30, AIR_SLASH
	db 35, CRUNCH
	db 40, SLUDGE_BOMB
	db 45, CROSS_POISON
	db 0 ; no more level-up moves

GolbatEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, CROBAT
	db 0 ; no more evolutions
	db 1, ACID
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 10, BITE
	db 13, HYPNOSIS
	db 17, CONFUSE_RAY
	db 20, SLUDGE
	db 22, WING_ATTACK
	db 30, AIR_SLASH
	db 35, CRUNCH
	db 40, SLUDGE_BOMB
	db 45, CROSS_POISON
	db 50, BRAVE_BIRD
	db 55, HAZE
	db 0 ; no more level-up moves

PawniardEvosAttacks:
	db EVOLVE_LEVEL, 30, BISHARP
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 10, METAL_CLAW
	db 15, FEINT_ATTACK
	db 18, FALSE_SWIPE
	db 20, MACH_PUNCH
	db 25, BULLET_PUNCH
	db 31, NIGHT_SLASH
	db 35, IRON_HEAD
	db 41, SUCKER_PUNCH
	db 51, SWORDS_DANCE
	db 0 ; no more level-up moves

BisharpEvosAttacks:
    db EVOLVE_LEVEL, 50, KINGAMBIT
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 10, METAL_CLAW
	db 15, FEINT_ATTACK
	db 18, FALSE_SWIPE
	db 20, MACH_PUNCH
	db 25, BULLET_PUNCH
	db 30, NIGHT_SLASH
	db 35, IRON_HEAD
	db 41, SUCKER_PUNCH
	db 51, SWORDS_DANCE
	db 0 ; no more level-up moves

RegigigasEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, CONFUSE_RAY
	db 18, STOMP
	db 24, PROTECT
	db 30, BODY_SLAM
	db 40, ZEN_HEADBUTT
	db 50, SHADOW_PUNCH
	db 60, DYNAMICPUNCH
	db 70, DOUBLE_EDGE
	db 0 ; no more level-up moves

ZygardeEvosAttacks:
	db 0 ; no more evolutions
	db 1, DIG
	db 1, DRAGON_PULSE
	db 1, EARTH_POWER
	db 1, BITE
	db 30, CRUNCH
	db 40, EARTHQUAKE
	db 50, DRAGON_CLAW
	db 60, GLARE
	db 70, DRAGON_DANCE
	db 80, OBLITERATE
	db 0 ; no more level-up moves

HawluchaEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WING_ATTACK
	db 8, FALSE_SWIPE
	db 12, LOW_KICK
	db 16, ENCORE
	db 20, DOUBLE_KICK
	db 25, SUBMISSION
	db 30, ROOST
	db 41, BULK_UP
	db 45, HI_JUMP_KICK
	db 50, BRAVE_BIRD
	db 0 ; no more level-up moves

LarvestaEvosAttacks:
	db EVOLVE_LEVEL, 50, VOLCARONA
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEECH_LIFE
	db 15, ANCIENTPOWER
	db 25, FLAME_WHEEL
	db 30, X_SCISSOR
	db 40, BUG_BUZZ
	db 51, FIRE_BLAST
	db 60, FLARE_BLITZ
	db 65, MORNING_SUN
	db 0 ; no more level-up moves

VolcaronaEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEECH_LIFE
	db 15, ANCIENTPOWER
	db 25, FLAME_WHEEL
	db 30, X_SCISSOR
	db 40, BUG_BUZZ
	db 50, QUIVER_DANCE
	db 55, FIRE_BLAST
	db 60, MORNING_SUN
	db 0 ; no more level-up moves

ArctozoltEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWDER_SNOW
	db 1, THUNDERSHOCK
	db 12, BITE
	db 21, ANCIENTPOWER
	db 28, THUNDERPUNCH
	db 30, ICE_PUNCH
	db 35, DISCHARGE
	db 40, THUNDERBOLT
	db 42, ICE_BEAM
	db 45, AVALANCHE
	db 50, BOLT_BREAK
	db 0 ; no more level-up moves

DracovishEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 12, BITE
	db 21, ANCIENTPOWER
	db 28, BUBBLEBEAM
	db 30, DRAGON_CLAW
	db 35, CRUNCH
	db 40, SURF
	db 42, DRAGON_PULSE
	db 45, OUTRAGE
	db 50, SAVAGE_REND
	db 0 ; no more level-up moves

MeowthEvosAttacks:
	db EVOLVE_LEVEL, 28, PERSIAN
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SCREECH
	db 10, BITE
	db 16, FALSE_SWIPE
	db 22, SWIFT
	db 30, SLASH
	db 0 ; no more level-up moves

PersianEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, SCREECH
	db 10, BITE
	db 16, FALSE_SWIPE
	db 22, SWIFT
	db 28, SLASH
	db 0 ; no more level-up moves

SnoverEvosAttacks:
	db EVOLVE_LEVEL, 35, ABOMASNOW
	db 0 ; no more evolutions
	db 1, POWDER_SNOW
	db 1, ABSORB
	db 15, LEECH_SEED
	db 20, RAZOR_LEAF
	db 25, ICY_WIND
	db 30, ICE_PUNCH
	db 36, LEAF_BLADE
	db 41, GIGA_DRAIN
	db 45, ICE_BEAM
	db 50, AVALANCHE
	db 55, BLIZZARD
	db 0 ; no more level-up moves

AbomasnowEvosAttacks:
	db 0 ; no more evolutions
	db 1, POWDER_SNOW
	db 1, ABSORB
	db 15, LEECH_SEED
	db 20, RAZOR_LEAF
	db 25, ICY_WIND
	db 30, ICE_PUNCH
	db 35, LEAF_BLADE
	db 40, GIGA_DRAIN
	db 45, ICE_BEAM
	db 50, AVALANCHE
	db 55, BLIZZARD
	db 0 ; no more level-up moves

ShroomishEvosAttacks:
	db EVOLVE_LEVEL, 23, BRELOOM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, STUN_SPORE
	db 8, LEECH_SEED
	db 12, MEGA_DRAIN
	db 15, RAZOR_LEAF
	db 19, FOCUS_ENERGY
	db 24, GIGA_DRAIN
	db 41, LEAF_BLADE
	db 45, SPORE
	db 0 ; no more level-up moves

BreloomEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 5, STUN_SPORE
	db 8, LEECH_SEED
	db 12, MEGA_DRAIN
	db 15, RAZOR_LEAF
	db 19, FOCUS_ENERGY
	db 23, KARATE_CHOP
	db 26, GIGA_DRAIN
	db 33, MACH_PUNCH
	db 37, DRAIN_PUNCH
	db 40, LEAF_BLADE
	db 45, SPORE
	db 0 ; no more level-up moves

GrowlitheEvosAttacks:
	db EVOLVE_ITEM, FIRE_STONE, ARCANINE
	db 0 ; no more evolutions
	db 1, BITE
	db 9, EMBER
	db 18, LEER
	db 24, FLAME_WHEEL
	db 28, ROAR
	db 30, CRUNCH
	db 33, PLAY_ROUGH
	db 36, FLAMETHROWER
	db 40, MORNING_SUN
	db 42, EXTREMESPEED
	db 45, FIRE_BLAST
	db 0 ; no more level-up moves

ArcanineEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 9, EMBER
	db 18, LEER
	db 24, FLAME_WHEEL
	db 28, ROAR
	db 30, CRUNCH
	db 33, PLAY_ROUGH
	db 36, FLAMETHROWER
	db 40, MORNING_SUN
	db 42, EXTREMESPEED
	db 45, FIRE_BLAST
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

PoliwagEvosAttacks:
	db EVOLVE_LEVEL, 25, POLIWHIRL
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 10, WATER_GUN
	db 13, DOUBLESLAP
	db 20, BUBBLEBEAM
	db 26, BODY_SLAM
	db 30, RAIN_DANCE
	db 35, WATERFALL
	db 42, BULK_UP
	db 45, HYDRO_PUMP
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

PoliwhirlEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, POLIWRATH
	db EVOLVE_LEVEL, 40, POLITOED
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 10, WATER_GUN
	db 13, DOUBLESLAP
	db 20, BUBBLEBEAM
	db 25, BODY_SLAM
	db 30, RAIN_DANCE
	db 35, WATERFALL
	db 42, BULK_UP
	db 45, HYDRO_PUMP
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

PoliwrathEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 7, HYPNOSIS
	db 10, WATER_GUN
	db 13, DOUBLESLAP
	db 20, BUBBLEBEAM
	db 25, RAIN_DANCE
	db 30, DRAIN_PUNCH
	db 35, WATERFALL
	db 42, BULK_UP
	db 45, CLOSE_COMBAT
	db 50, HYDRO_PUMP
	db 55, BELLY_DRUM
	db 0 ; no more level-up moves

AbraEvosAttacks:
	db EVOLVE_LEVEL, 16, KADABRA
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 0 ; no more level-up moves

KadabraEvosAttacks:
	db EVOLVE_LEVEL, 40, ALAKAZAM
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
    db 33, ZEN_HEADBUTT
	db 38, PSYCHIC_M
	db 41, CALM_MIND
	db 45, REFLECT
	db 0 ; no more level-up moves

AlakazamEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 16, CONFUSION
	db 18, DISABLE
	db 21, PSYBEAM
	db 26, RECOVER
    db 33, ZEN_HEADBUTT
	db 38, PSYCHIC_M
	db 40, CALM_MIND
	db 45, REFLECT
	db 0 ; no more level-up moves

MachopEvosAttacks:
	db EVOLVE_LEVEL, 28, MACHOKE
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 7, FOCUS_ENERGY
	db 13, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 23, MACH_PUNCH
	db 29, STRENGTH
	db 32, DRAIN_PUNCH
	db 35, SHADOW_PUNCH
	db 40, DYNAMICPUNCH
	db 45, BULK_UP
	db 0 ; no more level-up moves

MachokeEvosAttacks:
	db EVOLVE_LEVEL, 40, MACHAMP
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 8, FOCUS_ENERGY
	db 15, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 23, MACH_PUNCH
	db 28, STRENGTH
	db 32, DRAIN_PUNCH
	db 35, SHADOW_PUNCH
	db 41, DYNAMICPUNCH
	db 45, BULK_UP
	db 0 ; no more level-up moves

MachampEvosAttacks:
	db 0 ; no more evolutions
	db 1, LOW_KICK
	db 1, LEER
	db 8, FOCUS_ENERGY
	db 15, KARATE_CHOP
	db 19, SEISMIC_TOSS
	db 23, MACH_PUNCH
	db 28, STRENGTH
	db 32, DRAIN_PUNCH
	db 35, SHADOW_PUNCH
	db 40, DYNAMICPUNCH
	db 45, BULK_UP
	db 0 ; no more level-up moves

BellsproutEvosAttacks:
	db EVOLVE_LEVEL, 21, WEEPINBELL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, ACID
	db 6, GROWTH
	db 11, POISON_STING
	db 15, RAZOR_LEAF
	db 18, SLEEP_POWDER
	db 22, SLUDGE
	db 24, SLASH
	db 26, STUN_SPORE
	db 30, CROSS_POISON
	db 35, SLUDGE_BOMB
	db 40, LEAF_BLADE
	db 0 ; no more level-up moves

WeepinbellEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, VICTREEBEL
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, ACID
	db 6, GROWTH
	db 11, POISON_STING
	db 15, RAZOR_LEAF
	db 18, SLEEP_POWDER
	db 21, SLUDGE
	db 24, SLASH
	db 26, STUN_SPORE
	db 30, CROSS_POISON
	db 35, SLUDGE_BOMB
	db 40, LEAF_BLADE
	db 0 ; no more level-up moves

VictreebelEvosAttacks:
	db 0 ; no more evolutions
	db 1, VINE_WHIP
	db 1, ACID
	db 6, GROWTH
	db 11, POISON_STING
	db 15, RAZOR_LEAF
	db 18, SLEEP_POWDER
	db 21, SLUDGE
	db 24, SLASH
	db 26, STUN_SPORE
	db 30, CROSS_POISON
	db 35, SLUDGE_BOMB
	db 40, LEAF_BLADE
	db 0 ; no more level-up moves

TentacoolEvosAttacks:
	db EVOLVE_LEVEL, 30, TENTACRUEL
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SUPERSONIC
	db 1, WATER_GUN
	db 10, ACID
	db 15, WRAP
	db 20, BUBBLEBEAM
	db 25, SLUDGE
	db 31, CROSS_POISON
	db 35, SLUDGE_BOMB
	db 40, SCALD
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

TentacruelEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 1, SUPERSONIC
	db 1, WATER_GUN
	db 10, ACID
	db 15, WRAP
	db 20, BUBBLEBEAM
	db 25, SLUDGE
	db 30, CROSS_POISON
	db 35, SLUDGE_BOMB
	db 40, SCALD
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

GeodudeEvosAttacks:
	db EVOLVE_LEVEL, 25, GRAVELER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 20, SELFDESTRUCT
	db 26, ROCK_SLIDE
	db 30, ROLLOUT
	db 41, STONE_EDGE
	db 45, EARTHQUAKE
	db 50, SANDSTORM
	db 55, EXPLOSION
	db 0 ; no more level-up moves

GravelerEvosAttacks:
	db EVOLVE_LEVEL, 40, GOLEM
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 20, SELFDESTRUCT
	db 25, ROCK_SLIDE
	db 30, ROLLOUT
	db 41, STONE_EDGE
	db 45, EARTHQUAKE
	db 50, SANDSTORM
	db 55, EXPLOSION
	db 0 ; no more level-up moves

GolemEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 6, DEFENSE_CURL
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 21, SELFDESTRUCT
	db 25, ROCK_SLIDE
	db 30, ROLLOUT
	db 40, STONE_EDGE
	db 45, EARTHQUAKE
	db 50, SANDSTORM
	db 55, EXPLOSION
	db 0 ; no more level-up moves

PonytaEvosAttacks:
	db EVOLVE_LEVEL, 30, RAPIDASH
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, TAIL_WHIP
	db 13, EMBER
	db 19, STOMP
	db 23, FLAME_WHEEL
	db 26, FIRE_SPIN
	db 31, AGILITY
	db 36, FLAMETHROWER
	db 45, FIRE_BLAST
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

RapidashEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, GROWL
	db 8, TAIL_WHIP
	db 13, EMBER
	db 19, STOMP
	db 23, FLAME_WHEEL
	db 26, FIRE_SPIN
	db 30, MEGAHORN
	db 33, CROSS_POISON
	db 36, FLAMETHROWER
	db 45, FIRE_BLAST
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

SlowpokeEvosAttacks:
	db EVOLVE_LEVEL, 32, SLOWBRO
	db EVOLVE_ITEM, WATER_STONE, SLOWKING
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 12, WATER_GUN
	db 18, CONFUSION
	db 22, BUBBLEBEAM
	db 25, PSYBEAM
	db 28, ZEN_HEADBUTT
	db 33, RECOVER
	db 36, PSYCHIC_M
	db 45, CALM_MIND
	db 50, SCALD
	db 0 ; no more level-up moves

SlowbroEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 12, WATER_GUN
	db 18, CONFUSION
	db 22, BUBBLEBEAM
	db 25, PSYBEAM
	db 28, ZEN_HEADBUTT
	db 32, RECOVER
	db 35, PSYCHIC_M
	db 45, CALM_MIND
	db 50, SCALD
	db 0 ; no more level-up moves

MagnemiteEvosAttacks:
	db EVOLVE_LEVEL, 30, MAGNETON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 10, SONICBOOM
	db 15, THUNDER_WAVE
	db 20, TRI_ATTACK
	db 25, FLASH_CANNON
	db 31, DISCHARGE
    db 36, THUNDERBOLT
	db 40, ZAP_CANNON
	db 50, EXPLOSION
	db 0 ; no more level-up moves

MagnetonEvosAttacks:
    db EVOLVE_ITEM, THUNDERSTONE, MAGNEZONE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 10, SONICBOOM
	db 15, THUNDER_WAVE
	db 20, TRI_ATTACK
	db 25, FLASH_CANNON
	db 30, DISCHARGE
    db 36, THUNDERBOLT
	db 40, ZAP_CANNON
	db 50, EXPLOSION
	db 0 ; no more level-up moves

MamoswineEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 16, MAGNITUDE
	db 20, ICY_WIND
	db 25, BODY_SLAM
	db 30, DIG
	db 37, AMNESIA
	db 42, EARTHQUAKE
	db 46, BLIZZARD
	db 50, AVALANCHE
	db 0 ; no more level-up moves

ElectivireEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, THUNDERSHOCK
	db 16, LIGHT_SCREEN
	db 20, THUNDER_WAVE
	db 24, THUNDERPUNCH
	db 28, SUBMISSION
	db 32, DISCHARGE
	db 36, THUNDERBOLT
	db 40, THUNDER
	db 50, VOLT_TACKLE
	db 0 ; no more level-up moves

MagnezoneEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 11, SUPERSONIC
	db 16, SONICBOOM
	db 21, THUNDER_WAVE
	db 26, FLASH_CANNON
	db 30, DISCHARGE
	db 33, TRI_ATTACK
    db 36, THUNDERBOLT
	db 40, ZAP_CANNON
	db 50, EXPLOSION
	db 0 ; no more level-up moves

YanmegaEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 7, QUICK_ATTACK
	db 10, BITE
	db 14, LEECH_LIFE
	db 18, WING_ATTACK
	db 21, SUPERSONIC
	db 26, HYPNOSIS
	db 30, ANCIENTPOWER
	db 35, AIR_SLASH
	db 40, BUG_BUZZ
	db 0 ; no more level-up moves

GliscorEvosAttacks:
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 6, SAND_ATTACK
	db 9, HARDEN
	db 14, CUT
	db 18, MAGNITUDE
	db 24, NIGHT_SLASH
	db 28, SLASH
	db 33, SANDSTORM
	db 37, X_SCISSOR
	db 42, EARTHQUAKE
	db 50, SWORDS_DANCE
	db 55, GUILLOTINE
	db 0 ; no more level-up moves

FerroseedEvosAttacks:
	db EVOLVE_LEVEL, 30, FERROTHORN
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 5, METAL_CLAW
	db 10, LEECH_LIFE
	db 15, LEECH_SEED
	db 20, RAZOR_LEAF
	db 25, IRON_HEAD
	db 31, LEAF_BLADE
	db 35, FLASH_CANNON
	db 40, EXPLOSION
	db 0 ; no more level-up moves

FerrothornEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 5, METAL_CLAW
	db 10, LEECH_LIFE
	db 15, LEECH_SEED
	db 20, RAZOR_LEAF
	db 25, IRON_HEAD
	db 31, LEAF_BLADE
	db 35, FLASH_CANNON
	db 40, EXPLOSION
	db 0 ; no more level-up moves

ShellderEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, CLOYSTER
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, PROTECT
	db 9, POWDER_SNOW
	db 17, AURORA_BEAM
	db 22, BUBBLEBEAM
	db 30, CLAMP
	db 35, WATERFALL
	db 40, ICE_BEAM
	db 50, HYDRO_PUMP
	db 55, AVALANCHE
	db 60, SHELL_SMASH
	db 0 ; no more level-up moves

CloysterEvosAttacks:
	db 0 ; no more evolutions
	db 1, AURORA_BEAM
	db 1, PROTECT
	db 22, BUBBLEBEAM
	db 30, CLAMP
	db 35, WATERFALL
	db 40, ICE_BEAM
	db 45, SPIKES
	db 60, SHELL_SMASH
	db 0 ; no more level-up moves

GastlyEvosAttacks:
	db EVOLVE_LEVEL, 25, HAUNTER
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, ACID
	db 8, CONFUSE_RAY
	db 13, MEAN_LOOK
	db 16, NIGHT_SHADE
	db 20, SLUDGE
	db 26, SHADOW_PUNCH
	db 30, SHADOW_BALL
	db 40, SLUDGE_BOMB
	db 45, DREAM_EATER
	db 48, DESTINY_BOND
	db 0 ; no more level-up moves

HaunterEvosAttacks:
	db EVOLVE_LEVEL, 40, GENGAR
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, ACID
	db 8, CONFUSE_RAY
	db 13, MEAN_LOOK
	db 16, NIGHT_SHADE
	db 20, SLUDGE
	db 25, SHADOW_PUNCH
	db 30, SHADOW_BALL
	db 41, SLUDGE_BOMB
	db 45, DREAM_EATER
	db 48, DESTINY_BOND
	db 0 ; no more level-up moves

GengarEvosAttacks:
	db 0 ; no more evolutions
	db 1, HYPNOSIS
	db 1, LICK
	db 1, ACID
	db 8, CONFUSE_RAY
	db 13, MEAN_LOOK
	db 16, NIGHT_SHADE
	db 20, SLUDGE
	db 25, SHADOW_PUNCH
	db 30, SHADOW_BALL
	db 40, SLUDGE_BOMB
	db 45, DREAM_EATER
	db 48, DESTINY_BOND
	db 0 ; no more level-up moves

OnixEvosAttacks:
	db EVOLVE_LEVEL, 32, STEELIX
	db 0 ; no more evolutions
	db 1, TACKLE
	db 10, WRAP
	db 15, ROCK_THROW
	db 20, MAGNITUDE
	db 25, ROCK_SLIDE
	db 28, BODY_SLAM
	db 33, IRON_HEAD
	db 36, CRUNCH
	db 45, EARTHQUAKE
	db 50, DRAGON_DANCE
	db 0 ; no more level-up moves

UrsalunaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 8, LICK
	db 15, HEADBUTT
	db 22, REST
	db 26, CRUNCH
	db 30, SLASH
	db 33, PLAY_ROUGH
	db 35, BODY_SLAM
	db 40, CLOSE_COMBAT
	db 45, EARTHQUAKE
	db 50, DOUBLE_EDGE
	db 60, MOONLIGHT
	db 0 ; no more level-up moves

UrsalunaBEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 8, LICK
	db 15, HEADBUTT
	db 22, REST
	db 26, CRUNCH
	db 30, SLASH
	db 33, PLAY_ROUGH
	db 35, TRI_ATTACK
	db 40, MOONLIGHT
	db 45, EARTH_POWER
	db 50, MOON_BLAST
	db 60, HYPER_BEAM
	db 0 ; no more level-up moves

FeebasEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, MILOTIC
	db 0 ; no more evolutions
	db 1, SPLASH
	db 15, TACKLE
	db 30, FLAIL
	db 100, WATER_GUN
	db 0 ; no more level-up moves

MiloticEvosAttacks:
	db 0 ; no more evolutions
	db 25, BUBBLEBEAM
	db 30, AURORA_BEAM
	db 33, HYPNOSIS
	db 36, RECOVER
	db 40, SCALD
	db 45, HYDRO_PUMP
	db 50, CALM_MIND
	db 0 ; no more level-up moves

MudkipEvosAttacks:
	db EVOLVE_LEVEL, 16, MARSHTOMP
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 11, ROCK_THROW
    db 17, MAGNITUDE
	db 20, BUBBLEBEAM
	db 25, ROCK_SLIDE
	db 30, BODY_SLAM
	db 36, WATERFALL
	db 40, AMNESIA
	db 45, SCALD
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

MimikyuEvosAttacks:
	db 0 ; no more evolutions
	db 1, SPLASH
	db 1, LICK
	db 1, PAIN_SPLIT
	db 10, MIMIC
	db 15, DRAIN_KISS
	db 20, CHARM
	db 25, NIGHT_SLASH
	db 30, SUCKER_PUNCH
	db 35, SHADOW_PUNCH
	db 40, PLAY_ROUGH
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

ExeggcuteEvosAttacks:
	db EVOLVE_ITEM, LEAF_STONE, EXEGGUTOR
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HYPNOSIS
	db 7, REFLECT
	db 13, LEECH_SEED
	db 19, POISONPOWDER
	db 25, STUN_SPORE
	db 31, GIGA_DRAIN
	db 37, SLEEP_POWDER
	db 40, PSYCHIC_M
	db 43, SOLARBEAM
	db 48, SUNNY_DAY
	db 0 ; no more level-up moves

ExeggutorEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 7, REFLECT
	db 10, STOMP
	db 13, LEECH_SEED
	db 19, POISONPOWDER
	db 25, STUN_SPORE
	db 31, GIGA_DRAIN
	db 37, SLEEP_POWDER
	db 40, PSYCHIC_M
	db 43, SOLARBEAM
	db 48, SUNNY_DAY
	db 0 ; no more level-up moves

MarillEvosAttacks:
	db EVOLVE_LEVEL, 18, AZUMARILL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 6, DEFENSE_CURL
	db 15, BUBBLEBEAM
	db 19, HEADBUTT
	db 22, RAIN_DANCE
	db 25, ROLLOUT
	db 30, BODY_SLAM
	db 35, WATERFALL
	db 40, PLAY_ROUGH
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

AzumarillEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 6, DEFENSE_CURL
	db 16, BUBBLEBEAM
	db 18, HEADBUTT
	db 22, RAIN_DANCE
	db 25, ROLLOUT
	db 30, BODY_SLAM
	db 35, WATERFALL
	db 40, PLAY_ROUGH
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

SolosisEvosAttacks:
    db EVOLVE_LEVEL, 30, DUOSION
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, PROTECT
	db 12, CHARM
	db 16, PSYBEAM
	db 20, LIGHT_SCREEN
	db 20, REFLECT
	db 30, RECOVER
	db 35, BARRIER
	db 41, PSYCHIC_M
	db 50, CALM_MIND
	db 0 ; no more level-up moves

DuosionEvosAttacks:
    db EVOLVE_LEVEL, 40, REUNICLUS
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, PROTECT
	db 12, CHARM
	db 16, PSYBEAM
	db 20, LIGHT_SCREEN
	db 20, REFLECT
	db 30, RECOVER
	db 35, BARRIER
	db 41, PSYCHIC_M
	db 50, CALM_MIND
	db 0 ; no more level-up moves

ReuniclusEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, PROTECT
	db 12, CHARM
	db 16, PSYBEAM
	db 20, LIGHT_SCREEN
	db 20, REFLECT
	db 30, RECOVER
	db 35, BARRIER
	db 40, PSYCHIC_M
	db 50, CALM_MIND
	db 0 ; no more level-up moves

KoffingEvosAttacks:
	db EVOLVE_LEVEL, 32, WEEZING
	db 0 ; no more evolutions
	db 1, ACID
	db 1, TACKLE
	db 17, SLUDGE
	db 20, SELFDESTRUCT
	db 24, SMOKESCREEN
	db 28, HAZE
	db 33, SLUDGE_BOMB
	db 40, DESTINY_BOND
	db 45, NASTY_PLOT
	db 50, EXPLOSION
	db 0 ; no more level-up moves

WeezingEvosAttacks:
	db 0 ; no more evolutions
	db 1, ACID
	db 1, TACKLE
	db 17, SLUDGE
	db 21, SELFDESTRUCT
	db 24, SMOKESCREEN
	db 28, HAZE
	db 32, SLUDGE_BOMB
	db 40, DESTINY_BOND
	db 45, NASTY_PLOT
	db 50, EXPLOSION
	db 0 ; no more level-up moves

RhyhornEvosAttacks:
	db EVOLVE_LEVEL, 35, RHYDON
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, SCARY_FACE
	db 12, ROCK_THROW
	db 16, MAGNITUDE
	db 22, TAKE_DOWN
	db 28, CROSS_POISON
	db 32, ROCK_SLIDE
	db 36, HORN_DRILL
	db 40, MEGAHORN
	db 45, EARTHQUAKE
	db 51, STONE_EDGE
	db 0 ; no more level-up moves

RhydonEvosAttacks:
	db EVOLVE_LEVEL, 50, RHYPERIOR
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, SCARY_FACE
	db 12, ROCK_THROW
	db 16, MAGNITUDE
	db 22, TAKE_DOWN
	db 28, CROSS_POISON
	db 32, ROCK_SLIDE
	db 35, HORN_DRILL
	db 40, MEGAHORN
	db 45, EARTHQUAKE
	db 51, STONE_EDGE
	db 55, DRAGON_DANCE
	db 0 ; no more level-up moves

ChanseyEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, BLISSEY
	db 0 ; no more evolutions
	db 1, POUND
	db 5, GROWL
	db 9, TAIL_WHIP
	db 13, SOFTBOILED
	db 17, DOUBLESLAP
	db 20, SING
	db 25, BODY_SLAM
    db 33, TRI_ATTACK
	db 36, LIGHT_SCREEN
	db 40, SOFTBOILED
	db 45, DOUBLE_EDGE
	db 50, HEAL_BELL
	db 0 ; no more level-up moves

WeavileEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, SCRATCH
	db 1, FOCUS_ENERGY
	db 14, POWDER_SNOW
	db 18, FEINT_ATTACK
	db 22, SLASH
	db 25, SCREECH
	db 30, ICE_PUNCH
	db 33, SUCKER_PUNCH
	db 36, DARK_PULSE
	db 41, NASTY_PLOT
	db 45, NIGHT_SLASH
	db 50, AVALANCHE
	db 0 ; no more level-up moves

RhyperiorEvosAttacks:
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, SCARY_FACE
	db 12, ROCK_THROW
	db 16, MAGNITUDE
	db 22, TAKE_DOWN
	db 28, CROSS_POISON
	db 32, ROCK_SLIDE
	db 36, HORN_DRILL
	db 40, MEGAHORN
	db 45, EARTHQUAKE
	db 50, STONE_EDGE
	db 55, DRAGON_DANCE
	db 0 ; no more level-up moves

HorseaEvosAttacks:
	db EVOLVE_LEVEL, 25, SEADRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 8, SMOKESCREEN
	db 10, LEER
	db 13, WATER_GUN
	db 20, BUBBLEBEAM
	db 25, RAIN_DANCE
	db 31, WATERFALL
	db 40, DRAGON_PULSE
	db 45, DRAGON_CLAW
	db 50, HYDRO_PUMP
	db 55, DRAGON_DANCE
	db 0 ; no more level-up moves

SeadraEvosAttacks:
	db EVOLVE_LEVEL, 40, KINGDRA
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 8, SMOKESCREEN
	db 10, LEER
	db 13, WATER_GUN
	db 20, BUBBLEBEAM
	db 25, RAIN_DANCE
	db 30, WATERFALL
	db 41, DRAGON_PULSE
	db 45, DRAGON_CLAW
	db 50, HYDRO_PUMP
	db 55, DRAGON_DANCE
	db 60, OUTRAGE
	db 0 ; no more level-up moves

MagmortarEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, POISON_GAS
	db 14, FLAME_WHEEL
	db 19, CONFUSE_RAY
	db 24, FIRE_PUNCH
	db 30, LOW_KICK
	db 36, SUNNY_DAY
	db 40, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

HonchkrowEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, NIGHT_SHADE
	db 1, MEAN_LOOK
	db 1, FEINT_ATTACK
	db 16, HAZE
	db 21, WING_ATTACK
	db 30, AIR_SLASH
	db 33, NIGHT_SLASH
	db 36, DARK_PULSE
	db 41, NASTY_PLOT
	db 45, CLOSE_COMBAT
	db 50, SUCKER_PUNCH
	db 55, BRAVE_BIRD
	db 0 ; no more level-up moves

StaryuEvosAttacks:
	db EVOLVE_ITEM, WATER_STONE, STARMIE
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, RAPID_SPIN
	db 16, SWIFT
	db 19, RECOVER
	db 22, PSYBEAM
	db 25, BUBBLEBEAM
	db 33, AURORA_BEAM
	db 38, PSYCHIC_M
	db 40, RECOVER
	db 45, BLIZZARD
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

StarmieEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, HARDEN
	db 7, WATER_GUN
	db 10, CONFUSION
	db 13, RAPID_SPIN
	db 16, SWIFT
	db 19, RECOVER
	db 22, PSYBEAM
	db 25, BUBBLEBEAM
	db 33, AURORA_BEAM
	db 38, PSYCHIC_M
	db 40, RECOVER
	db 45, BLIZZARD
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

MrMimeEvosAttacks:
	db 0 ; no more evolutions
	db 6, CONFUSION
	db 11, SUBSTITUTE
	db 14, MEDITATE
	db 18, DRAIN_KISS
	db 20, LIGHT_SCREEN
	db 20, REFLECT
	db 23, ENCORE
	db 25, PSYBEAM
	db 30, ZEN_HEADBUTT
	db 32, BARRIER
	db 35, BATON_PASS
	db 40, PSYCHIC_M
	db 45, MOON_BLAST
	db 50, CALM_MIND
	db 0 ; no more level-up moves

ScytherEvosAttacks:
	db EVOLVE_LEVEL, 30, SCIZOR
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, LEER
	db 6, FOCUS_ENERGY
	db 12, FEINT_ATTACK
	db 15, FALSE_SWIPE
	db 18, SLASH
	db 24, WING_ATTACK
    db 31, X_SCISSOR
    db 40, LEECH_LIFE
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

JynxEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, LICK
	db 9, LOVELY_KISS
	db 13, POWDER_SNOW
	db 18, BODY_SLAM
	db 22, ICE_PUNCH
	db 26, AURORA_BEAM
	db 30, MEAN_LOOK
	db 36, PSYCHIC_M
	db 40, ICE_BEAM
	db 45, PERISH_SONG
	db 50, BLIZZARD
	db 60, QUIVER_DANCE
	db 0 ; no more level-up moves

ElectabuzzEvosAttacks:
	db EVOLVE_LEVEL, 40, ELECTIVIRE
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, THUNDERSHOCK
	db 16, LIGHT_SCREEN
	db 20, THUNDER_WAVE
	db 24, THUNDERPUNCH
	db 28, SUBMISSION
	db 32, DISCHARGE
	db 36, THUNDERBOLT
	db 41, THUNDER
	db 50, VOLT_TACKLE
	db 0 ; no more level-up moves

MagmarEvosAttacks:
	db EVOLVE_LEVEL, 40, MAGMORTAR
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LEER
	db 1, POISON_GAS
	db 14, FLAME_WHEEL
	db 19, CONFUSE_RAY
	db 24, FIRE_PUNCH
	db 30, LOW_KICK
	db 36, SUNNY_DAY
	db 41, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

PinsirEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, COUNTER
	db 10, ROCK_THROW
	db 15, LEECH_LIFE
	db 20, SEISMIC_TOSS
	db 25, SLASH
	db 30, X_SCISSOR
	db 35, ROCK_SLIDE
	db 40, CLOSE_COMBAT
    db 45, MEGAHORN
	db 50, SWORDS_DANCE
	db 55, GUILLOTINE
	db 60, SHELL_SMASH
	db 0 ; no more level-up moves

TaurosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 4, TAIL_WHIP
	db 8, RAGE
	db 10, HORN_ATTACK
	db 16, FEINT_ATTACK
	db 22, HEADBUTT
	db 30, THRASH
	db 35, BODY_SLAM
	db 40, DOUBLE_EDGE
	db 0 ; no more level-up moves

MagikarpEvosAttacks:
	db EVOLVE_LEVEL, 20, GYARADOS
	db 0 ; no more evolutions
	db 1, SPLASH
	db 15, TACKLE
	db 30, FLAIL
	db 100, WATER_GUN
	db 0 ; no more level-up moves

GyaradosEvosAttacks:
	db 0 ; no more evolutions
	db 1, THRASH
	db 20, BITE
	db 25, DRAGON_RAGE
	db 30, THRASH
	db 35, CRUNCH
	db 40, WATERFALL
	db 45, DRAGON_DANCE
	db 50, OUTRAGE
	db 55, HURRICANE
	db 60, HYPER_BEAM
	db 0 ; no more level-up moves

LaprasEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 1, POWDER_SNOW
	db 1, SING
	db 15, BODY_SLAM
	db 22, CONFUSE_RAY
	db 28, RAIN_DANCE
	db 32, PERISH_SONG
	db 36, ICE_BEAM
	db 40, AVALANCHE
	db 45, WATERFALL
	db 50, DRAGON_DANCE
	db 55, HYDRO_PUMP
	db 0 ; no more level-up moves

DittoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TRANSFORM
	db 0 ; no more level-up moves

EeveeEvosAttacks:
	db EVOLVE_ITEM, THUNDERSTONE, JOLTEON
	db EVOLVE_ITEM, WATER_STONE, VAPOREON
	db EVOLVE_ITEM, FIRE_STONE, FLAREON
	db EVOLVE_ITEM, SUN_STONE, ESPEON
	db EVOLVE_ITEM, MOON_STONE, UMBREON
	db EVOLVE_HAPPINESS, TR_ANYTIME, SYLVEON
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, TAIL_WHIP
	db 8, FOCUS_ENERGY
	db 16, GROWL
	db 20, GROWTH
	db 23, QUICK_ATTACK
	db 30, BITE
	db 36, BATON_PASS
	db 42, TAKE_DOWN
	db 0 ; no more level-up moves

VaporeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, BATON_PASS
	db 8, FOCUS_ENERGY
	db 12, QUICK_ATTACK
	db 16, WATER_GUN
	db 20, BITE
	db 25, BUBBLEBEAM
	db 28, ACID_ARMOR
	db 32, AURORA_BEAM
	db 36, SCALD
	db 42, HAZE
	db 45, HYDRO_PUMP
	db 50, CALM_MIND
	db 0 ; no more level-up moves

JolteonEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, BATON_PASS
	db 8, FOCUS_ENERGY
	db 12, QUICK_ATTACK
	db 16, THUNDERSHOCK
	db 25, THUNDER_WAVE
	db 28, FLASH_CANNON
	db 30, DISCHARGE
	db 32, AGILITY
	db 36, THUNDERBOLT
	db 45, THUNDER
	db 0 ; no more level-up moves

FlareonEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, BATON_PASS
	db 8, FOCUS_ENERGY
	db 12, QUICK_ATTACK
	db 16, EMBER
	db 20, BITE
	db 25, FLAME_WHEEL
	db 28, CRUNCH
	db 32, FIRE_SPIN
	db 36, FLAMETHROWER
	db 45, FIRE_BLAST
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

PorygonEvosAttacks:
	db EVOLVE_LEVEL, 30, PORYGON2
	db 0 ; no more evolutions
	db 1, TACKLE
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, DEFENSE_CURL
	db 31, SWIFT
	db 33, FEINT_ATTACK
	db 36, LOCK_ON
	db 36, ZAP_CANNON
	db 41, TRI_ATTACK
	db 50, AGILITY
	db 0 ; no more level-up moves

RaltsEvosAttacks:
	db EVOLVE_LEVEL, 18, KIRLIA
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 9, HYPNOSIS
	db 12, TELEPORT
	db 19, DRAIN_KISS
	db 21, PSYBEAM
	db 24, ATTRACT
	db 30, DREAM_EATER
	db 36, PSYCHIC_M
	db 38, MOON_BLAST
	db 44, CALM_MIND
	db 0 ; no more level-up moves

KirliaEvosAttacks:
    db EVOLVE_ITEM, MOON_STONE, GARDEVOIR
    db EVOLVE_ITEM, SUN_STONE, GALLADE
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 9, HYPNOSIS
	db 12, TELEPORT
	db 18, DRAIN_KISS
	db 21, PSYBEAM
	db 24, ATTRACT
	db 30, DREAM_EATER
	db 36, PSYCHIC_M
	db 38, MOON_BLAST
	db 44, CALM_MIND
	db 0 ; no more level-up moves

GardevoirEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 1, CONFUSION
	db 9, HYPNOSIS
	db 12, TELEPORT
	db 16, DRAIN_KISS
	db 20, PSYBEAM
	db 24, ATTRACT
	db 30, DREAM_EATER
	db 36, PSYCHIC_M
	db 38, MOON_BLAST
	db 44, CALM_MIND
	db 0 ; no more level-up moves

GaladeEvosAttacks:
	db 0 ; no more evolutions
	db 1, FALSE_SWIPE
	db 1, CONFUSION
	db 9, HYPNOSIS
	db 12, TELEPORT
	db 16, DRAIN_KISS
	db 20, PSYBEAM
	db 25, KARATE_CHOP
	db 30, NIGHT_SLASH
	db 35, DRAIN_PUNCH
	db 40, PSYCHO_SLASH
	db 45, EXTREMESPEED
	db 50, CLOSE_COMBAT
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

AerodactylEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 8, AGILITY
	db 10, DRAGON_RAGE
	db 15, BITE
	db 22, SUPERSONIC
	db 27, SCARY_FACE
	db 30, ANCIENTPOWER
	db 33, CRUNCH
	db 35, ROCK_SLIDE
	db 40, DOUBLE_EDGE
	db 45, STONE_EDGE
	db 50, BRAVE_BIRD
	db 0 ; no more level-up moves

SnorlaxEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 15, DEFENSE_CURL
	db 25, ROLLOUT
	db 29, HEADBUTT
	db 33, BODY_SLAM
	db 35, REST
	db 38, AMNESIA
	db 40, CRUNCH
	db 45, DOUBLE_EDGE
	db 50, BELLY_DRUM
	db 0 ; no more level-up moves

ArticunoEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, POWDER_SNOW
	db 25, AGILITY
	db 37, MIND_READER
	db 40, AIR_SLASH
	db 45, ROOST
	db 50, ICE_BEAM
	db 55, HURRICANE
	db 60, BLIZZARD
	db 65, BRAVE_BIRD
	db 0 ; no more level-up moves

ZapdosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PECK
	db 1, THUNDERSHOCK
	db 13, THUNDER_WAVE
	db 25, DRILL_PECK
	db 30, AIR_SLASH
	db 35, DISCHARGE
	db 45, ROOST
	db 50, THUNDERBOLT
	db 55, HURRICANE
	db 60, THUNDER
	db 65, BRAVE_BIRD
	db 0 ; no more level-up moves

MoltresEvosAttacks:
	db 0 ; no more evolutions
	db 1, WING_ATTACK
	db 1, EMBER
	db 13, FIRE_SPIN
	db 25, AGILITY
	db 37, ENDURE
	db 45, AIR_SLASH
	db 48, ROOST
	db 50, FIRE_BLAST
	db 55, HURRICANE
	db 60, BRAVE_BIRD
	db 65, FLARE_BLITZ
	db 0 ; no more level-up moves

DratiniEvosAttacks:
	db EVOLVE_LEVEL, 30, DRAGONAIR
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 8, THUNDER_WAVE
	db 12, BUBBLEBEAM
	db 20, BODY_SLAM
	db 25, DRAGON_RAGE
	db 31, DRAGON_CLAW
	db 35, WATERFALL
	db 40, DRAGON_PULSE
	db 55, DRAGON_DANCE
	db 60, DRAGON_CLAW
	db 70, OUTRAGE
	db 75, DRACO_METEOR
	db 0 ; no more level-up moves

DragonairEvosAttacks:
	db EVOLVE_LEVEL, 50, DRAGONITE
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 20, BODY_SLAM
	db 25, DRAGON_RAGE
	db 30, DRAGON_CLAW
	db 35, WATERFALL
	db 40, DRAGON_PULSE
	db 55, DRAGON_DANCE
	db 60, DRAGON_CLAW
	db 70, OUTRAGE
	db 75, DRACO_METEOR
	db 0 ; no more level-up moves

DragoniteEvosAttacks:
	db 0 ; no more evolutions
	db 1, WRAP
	db 1, LEER
	db 1, THUNDER_WAVE
	db 20, BODY_SLAM
	db 25, DRAGON_RAGE
	db 30, DRAGON_CLAW
	db 35, WATERFALL
	db 40, DRAGON_PULSE
	db 50, HURRICANE
	db 50, ROOST
	db 55, DRAGON_DANCE
	db 60, DRAGON_CLAW
	db 70, OUTRAGE
	db 75, DRACO_METEOR
	db 0 ; no more level-up moves

DarkraiEvosAttacks:
	db 0 ; no more evolutions
	db 1, DISABLE
	db 12, QUICK_ATTACK
	db 20, HYPNOSIS
	db 30, NIGHT_SHADE
	db 40, DREAM_EATER
	db 50, DARK_PULSE
	db 60, DARK_VOID
	db 65, NASTY_PLOT
	db 0 ; no more level-up moves

MewEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 10, TRANSFORM
	db 20, MEGA_PUNCH
	db 30, RECOVER
	db 40, PSYCHO_SLASH
	db 45, SHADOW_PUNCH
	db 50, PSYCHIC_M
	db 60, BATON_PASS
	db 0 ; no more level-up moves

TreeckoEvosAttacks:
	db EVOLVE_LEVEL, 16, GROVYLE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 8, ABSORB
	db 12, QUICK_ATTACK
	db 14, FEINT_ATTACK
	db 17, RAZOR_LEAF
	db 20, MEGA_DRAIN
	db 25, SLASH
	db 32, X_SCISSOR
	db 35, GIGA_DRAIN
	db 40, LEAF_BLADE
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

GrovyleEvosAttacks:
	db EVOLVE_LEVEL, 36, SCEPTILE
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 8, ABSORB
	db 14, FEINT_ATTACK
	db 12, QUICK_ATTACK
	db 16, RAZOR_LEAF
	db 20, MEGA_DRAIN
	db 25, SLASH
	db 32, X_SCISSOR
	db 37, GIGA_DRAIN
	db 40, LEAF_BLADE
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

SceptileEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 8, ABSORB
	db 14, FEINT_ATTACK
	db 12, QUICK_ATTACK
	db 16, RAZOR_LEAF
	db 20, MEGA_DRAIN
	db 25, SLASH
	db 32, X_SCISSOR
	db 36, GIGA_DRAIN
	db 40, LEAF_BLADE
	db 45, SOLARBEAM
	db 0 ; no more level-up moves

ChimcharEvosAttacks:
	db EVOLVE_LEVEL, 16, MONFERNO
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 8, EMBER
	db 17, KARATE_CHOP
	db 20, MACH_PUNCH
	db 26, FLAME_WHEEL
	db 30, SUBMISSION
	db 35, FIRE_PUNCH
	db 40, FLAMETHROWER
	db 45, CLOSE_COMBAT
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

MonfernoEvosAttacks:
	db EVOLVE_LEVEL, 36, INFERNAPE
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 8, EMBER
	db 16, KARATE_CHOP
	db 20, MACH_PUNCH
	db 26, FLAME_WHEEL
	db 30, SUBMISSION
	db 33, FIRE_PUNCH
	db 37, AURA_SPHERE
	db 40, FLAMETHROWER
	db 45, CLOSE_COMBAT
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

InfernapeEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, LEER
	db 8, EMBER
	db 16, KARATE_CHOP
	db 20, MACH_PUNCH
	db 26, FLAME_WHEEL
	db 30, SUBMISSION
	db 33, FIRE_PUNCH
	db 36, AURA_SPHERE
	db 40, FLAMETHROWER
	db 45, CLOSE_COMBAT
	db 50, FLARE_BLITZ
	db 0 ; no more level-up moves

FroakieEvosAttacks:
	db EVOLVE_LEVEL, 16, FROGADIER
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SMOKESCREEN
	db 6, BUBBLE
	db 8, QUICK_ATTACK
	db 10, WATER_GUN
	db 12, LICK
	db 17, SWIFT
	db 20, NIGHT_SHADE
	db 25, BUBBLEBEAM
	db 30, PSYCHIC_M
	db 35, NIGHT_SLASH
	db 40, DARK_PULSE
	db 45, HYDRO_PUMP
	db 50, SUBSTITUTE
	db 0 ; no more level-up moves

FrogadierEvosAttacks:
	db EVOLVE_LEVEL, 36, GRENINJA
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SMOKESCREEN
	db 6, BUBBLE
	db 8, QUICK_ATTACK
	db 10, WATER_GUN
	db 12, LICK
	db 16, SWIFT
	db 20, NIGHT_SHADE
	db 25, BUBBLEBEAM
	db 30, PSYCHIC_M
	db 37, NIGHT_SLASH
	db 40, DARK_PULSE
	db 50, HYDRO_PUMP
	db 55, SUBSTITUTE
	db 0 ; no more level-up moves

GreninjaEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, SMOKESCREEN
	db 6, BUBBLE
	db 8, QUICK_ATTACK
	db 10, WATER_GUN
	db 12, LICK
	db 16, SWIFT
	db 20, NIGHT_SHADE
	db 25, BUBBLEBEAM
	db 30, PSYCHIC_M
	db 36, NIGHT_SLASH
	db 40, DARK_PULSE
	db 45, HYDRO_PUMP
	db 50, SUBSTITUTE
	db 0 ; no more level-up moves

RioluEvosAttacks:
	db EVOLVE_HAPPINESS, TR_ANYTIME, LUCARIO
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, ENDURE
	db 6, COUNTER
	db 8, BITE
	db 11, KARATE_CHOP
	db 15, FOCUS_ENERGY
	db 18, REVERSAL
	db 20, CRUNCH
    db 25, BULLET_PUNCH
	db 30, AURA_SPHERE
	db 33, DRAIN_PUNCH
	db 36, IRON_HEAD
	db 40, EXTREMESPEED
	db 45, BULK_UP
	db 50, CLOSE_COMBAT
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

LucarioEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, ENDURE
	db 6, COUNTER
	db 8, BITE
	db 11, KARATE_CHOP
	db 15, FOCUS_ENERGY
	db 18, REVERSAL
	db 20, CRUNCH
    db 25, BULLET_PUNCH
	db 30, AURA_SPHERE
	db 33, DRAIN_PUNCH
	db 36, IRON_HEAD
	db 40, EXTREMESPEED
	db 45, BULK_UP
	db 50, CLOSE_COMBAT
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

HoothootEvosAttacks:
	db EVOLVE_LEVEL, 20, NOCTOWL
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, PECK
	db 13, CONFUSION
	db 16, HYPNOSIS
	db 21, REFLECT
	db 26, ZEN_HEADBUTT
	db 30, PSYCHIC_M
	db 35, DREAM_EATER
	db 40, HURRICANE
	db 0 ; no more level-up moves

NoctowlEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GROWL
	db 9, PECK
	db 13, CONFUSION
	db 16, HYPNOSIS
	db 20, REFLECT
	db 26, ZEN_HEADBUTT
	db 30, PSYCHIC_M
	db 35, DREAM_EATER
	db 40, HURRICANE
	db 0 ; no more level-up moves

DrilburEvosAttacks:
	db EVOLVE_LEVEL, 31, EXCADRILL
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, RAPID_SPIN
	db 8, MAGNITUDE
	db 12, FURY_SWIPES
	db 15, METAL_CLAW
	db 19, DIG
	db 26, SLASH
	db 32, IRON_HEAD
	db 35, SANDSTORM
	db 40, EARTHQUAKE
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

ExcadrillEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 1, RAPID_SPIN
	db 8, MAGNITUDE
	db 12, FURY_SWIPES
	db 15, METAL_CLAW
	db 19, DIG
	db 26, SLASH
	db 31, IRON_HEAD
	db 35, SANDSTORM
	db 40, EARTHQUAKE
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

JoltikEvosAttacks:
	db EVOLVE_LEVEL, 30, GALVANTULA
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 1, THUNDERSHOCK
	db 8, ABSORB
	db 12, MEGA_DRAIN
	db 16, THUNDER_WAVE
	db 20, X_SCISSOR
	db 24, GIGA_DRAIN
	db 28, DISCHARGE
	db 31, BUG_BUZZ
	db 36, THUNDERBOLT
	db 45, THUNDER
	db 60, QUIVER_DANCE
	db 0 ; no more level-up moves

GalvantulaEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 1, THUNDERSHOCK
	db 8, ABSORB
	db 12, MEGA_DRAIN
	db 16, THUNDER_WAVE
	db 20, X_SCISSOR
	db 24, GIGA_DRAIN
	db 28, DISCHARGE
	db 30, BUG_BUZZ
	db 36, THUNDERBOLT
	db 45, THUNDER
	db 60, QUIVER_DANCE
	db 0 ; no more level-up moves

CrobatEvosAttacks:
	db 0 ; no more evolutions
	db 1, ACID
	db 1, LEECH_LIFE
	db 6, SUPERSONIC
	db 10, BITE
	db 13, HYPNOSIS
	db 17, CONFUSE_RAY
	db 20, SLUDGE
	db 22, WING_ATTACK
	db 30, AIR_SLASH
	db 35, CRUNCH
	db 40, SLUDGE_BOMB
	db 45, CROSS_POISON
	db 50, BRAVE_BIRD
	db 55, HAZE
	db 86, AFTER_IMAGE
	db 0 ; no more level-up moves

ChinchouEvosAttacks:
	db EVOLVE_LEVEL, 27, LANTURN
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 5, SUPERSONIC
	db 10, FLAIL
	db 14, THUNDERSHOCK
	db 18, BUBBLEBEAM
	db 21, RAIN_DANCE
	db 23, CONFUSE_RAY
	db 28, THUNDER_WAVE
	db 30, DISCHARGE
	db 33, SCALD
	db 36, THUNDERBOLT
	db 45, HYDRO_PUMP
	db 50, THUNDER
	db 0 ; no more level-up moves

LanturnEvosAttacks:
	db 0 ; no more evolutions
	db 1, WATER_GUN
	db 5, SUPERSONIC
	db 10, FLAIL
	db 14, THUNDERSHOCK
	db 18, BUBBLEBEAM
	db 21, RAIN_DANCE
	db 23, CONFUSE_RAY
	db 27, THUNDER_WAVE
	db 30, DISCHARGE
	db 33, SCALD
	db 36, THUNDERBOLT
	db 45, HYDRO_PUMP
	db 50, THUNDER
	db 0 ; no more level-up moves

LitwickEvosAttacks:
    db EVOLVE_LEVEL, 30, LAMPENT
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LICK
	db 12, CONFUSE_RAY
	db 18, FIRE_SPIN
	db 24, NIGHT_SHADE
	db 28, PAIN_SPLIT
	db 31, SHADOW_BALL
	db 36, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

LampentEvosAttacks:
    db EVOLVE_LEVEL, 40, CHANDELURE
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LICK
	db 12, CONFUSE_RAY
	db 18, FIRE_SPIN
	db 24, NIGHT_SHADE
	db 28, PAIN_SPLIT
	db 31, SHADOW_BALL
	db 36, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

ChandelureEvosAttacks:
	db 0 ; no more evolutions
	db 1, EMBER
	db 1, LICK
	db 12, CONFUSE_RAY
	db 18, FIRE_SPIN
	db 24, NIGHT_SHADE
	db 28, PAIN_SPLIT
	db 31, SHADOW_BALL
	db 36, FLAMETHROWER
	db 50, FIRE_BLAST
	db 0 ; no more level-up moves

TogepiEvosAttacks:
	db EVOLVE_LEVEL, 18, TOGETIC
	db 0 ; no more evolutions
	db 1, CHARM
	db 7, METRONOME
	db 12, ANCIENTPOWER
	db 19, DRAIN_KISS
	db 21, ENCORE
	db 25, BODY_SLAM
	db 28, SAFEGUARD
	db 30, EXTREMESPEED
	db 32, AURA_SPHERE
	db 35, SOFTBOILED
	db 40, AIR_SLASH
	db 44, MOON_BLAST
	db 0 ; no more level-up moves

TogeticEvosAttacks:
    db EVOLVE_HAPPINESS, TR_ANYTIME, TOGEKISS
	db 0 ; no more evolutions
	db 1, CHARM
	db 7, METRONOME
	db 12, ANCIENTPOWER
	db 18, DRAIN_KISS
	db 21, ENCORE
	db 25, BODY_SLAM
	db 28, SAFEGUARD
	db 30, EXTREMESPEED
	db 32, AURA_SPHERE
	db 35, SOFTBOILED
	db 40, AIR_SLASH
	db 42, PLAY_ROUGH
	db 45, MOON_BLAST
	db 0 ; no more level-up moves

TogekissEvosAttacks:
	db 0 ; no more evolutions
	db 1, CHARM
	db 7, METRONOME
	db 12, ANCIENTPOWER
	db 18, DRAIN_KISS
	db 21, ENCORE
	db 25, SAFEGUARD
	db 28, EXTREMESPEED
	db 30, BODY_SLAM
	db 32, AURA_SPHERE
	db 35, SOFTBOILED
	db 40, AIR_SLASH
	db 42, PLAY_ROUGH
	db 45, MOON_BLAST
	db 55, CALM_MIND
	db 0 ; no more level-up moves

SigilyphEvosAttacks:
	db 0 ; no more evolutions
	db 1, GUST
	db 1, CONFUSION
	db 1, NIGHT_SHADE
	db 10, HYPNOSIS
	db 20, PSYBEAM
	db 25, DREAM_EATER
	db 30, AIR_SLASH
	db 36, PSYCHIC_M
	db 40, RECOVER
	db 50, CALM_MIND
	db 0 ; no more level-up moves

MareepEvosAttacks:
	db EVOLVE_LEVEL, 15, FLAAFFY
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 16, THUNDER_WAVE
	db 25, THUNDERPUNCH
	db 31, DISCHARGE
	db 36, THUNDERBOLT
	db 45, THUNDER
	db 0 ; no more level-up moves

FlaaffyEvosAttacks:
	db EVOLVE_LEVEL, 30, AMPHAROS
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 15, THUNDER_WAVE
	db 25, THUNDERPUNCH
	db 31, DISCHARGE
	db 36, THUNDERBOLT
	db 45, THUNDER
	db 0 ; no more level-up moves

AmpharosEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, THUNDERSHOCK
	db 18, THUNDER_WAVE
	db 25, THUNDERPUNCH
	db 30, DISCHARGE
	db 36, THUNDERBOLT
	db 40, FLASH_CANNON
	db 45, THUNDER
	db 0 ; no more level-up moves

SylveonEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, BATON_PASS
	db 1, DRAIN_KISS
	db 1, REFLECT
	db 1, LIGHT_SCREEN
    db 25, ATTRACT
	db 30, DRAIN_KISS
	db 40, MOONLIGHT
	db 45, MOON_BLAST
	db 50, CALM_MIND
	db 0 ; no more level-up moves

MismagiusEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWL
	db 6, LICK
	db 10, CONFUSION
	db 12, CONFUSE_RAY
	db 15, MEAN_LOOK
	db 17, HYPNOSIS
	db 20, PSYBEAM
	db 25, PAIN_SPLIT
	db 30, SHADOW_BALL
	db 35, HYPNOSIS
	db 40, PERISH_SONG
	db 0 ; no more level-up moves

PorygonzEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, DEFENSE_CURL
	db 30, SWIFT
	db 33, FEINT_ATTACK
	db 36, LOCK_ON
	db 36, ZAP_CANNON
	db 40, TRI_ATTACK
	db 50, AGILITY
	db 60, HYPER_BEAM
	db 0 ; no more level-up moves

GenesectEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_LIFE
	db 14, METAL_CLAW
	db 20, TRI_ATTACK
	db 25, ANCIENTPOWER
	db 30, X_SCISSOR
	db 35, IRON_HEAD
	db 38, ZAP_CANNON
	db 42, FLASH_CANNON
	db 45, BUG_BUZZ
	db 50, AGILITY
	db 55, HYPER_BEAM
	db 0 ; no more level-up moves

PolitoedEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 1, HYPNOSIS
	db 7, HYPNOSIS
	db 10, WATER_GUN
	db 13, DOUBLESLAP
	db 20, BUBBLEBEAM
	db 25, RAIN_DANCE
	db 30, BODY_SLAM
	db 35, PERISH_SONG
	db 40, SCALD
	db 45, THUNDER
	db 50, HYDRO_PUMP
	db 0 ; no more level-up moves

TimburrEvosAttacks:
	db EVOLVE_LEVEL, 25, GURDURR
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 4, LOW_KICK
	db 8, ROCK_THROW
	db 12, MEGA_PUNCH
	db 18, KARATE_CHOP
	db 26, MACH_PUNCH
	db 32, SHADOW_PUNCH
	db 36, DRAIN_PUNCH
	db 41, BULK_UP
	db 0 ; no more level-up moves

GurdurrEvosAttacks:
	db EVOLVE_LEVEL, 40, CONKELDURR
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 4, LOW_KICK
	db 8, ROCK_THROW
	db 12, MEGA_PUNCH
	db 18, KARATE_CHOP
	db 25, MACH_PUNCH
	db 32, SHADOW_PUNCH
	db 36, DRAIN_PUNCH
	db 41, BULK_UP
	db 0 ; no more level-up moves

ConkeldurrEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 1, FOCUS_ENERGY
	db 4, LOW_KICK
	db 8, ROCK_THROW
	db 12, MEGA_PUNCH
	db 18, KARATE_CHOP
	db 24, MACH_PUNCH
	db 28, SHADOW_PUNCH
	db 32, DRAIN_PUNCH
	db 40, BULK_UP
	db 0 ; no more level-up moves

BeldumEvosAttacks:
	db EVOLVE_LEVEL, 20, METANG
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, METAL_CLAW
	db 1, TAKE_DOWN
	db 28, FEINT_ATTACK
	db 32, BULLET_PUNCH
	db 36, PSYCHIC_M
	db 40, ZEN_HEADBUTT
	db 40, IRON_HEAD
	db 44, AGILITY
	db 48, METEOR_MASH
	db 55, HYPER_BEAM
	db 60, EXPLOSION
	db 0 ; no more level-up moves

MetangEvosAttacks:
	db EVOLVE_LEVEL, 50, METAGROSS
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, METAL_CLAW
	db 1, TAKE_DOWN
	db 28, FEINT_ATTACK
	db 32, BULLET_PUNCH
	db 36, PSYCHIC_M
	db 40, ZEN_HEADBUTT
	db 43, IRON_HEAD
	db 46, AGILITY
	db 51, METEOR_MASH
	db 55, HYPER_BEAM
	db 60, EXPLOSION
	db 0 ; no more level-up moves

MetagrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, METAL_CLAW
	db 1, TAKE_DOWN
	db 28, FEINT_ATTACK
	db 32, BULLET_PUNCH
	db 36, PSYCHIC_M
	db 40, ZEN_HEADBUTT
	db 43, IRON_HEAD
	db 46, AGILITY
	db 50, METEOR_MASH
	db 55, HYPER_BEAM
	db 60, EXPLOSION
	db 0 ; no more level-up moves

YanmaEvosAttacks:
	db EVOLVE_LEVEL, 30, YANMEGA
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, GUST
	db 7, QUICK_ATTACK
	db 10, BITE
	db 14, LEECH_LIFE
	db 18, WING_ATTACK
	db 21, SUPERSONIC
	db 26, HYPNOSIS
	db 31, ANCIENTPOWER
	db 38, AIR_SLASH
	db 44, BUG_BUZZ
	db 0 ; no more level-up moves

MarshtompEvosAttacks:
	db EVOLVE_LEVEL, 36, SWAMPERT
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 11, ROCK_THROW
    db 16, MAGNITUDE
	db 20, BUBBLEBEAM
	db 25, ROCK_SLIDE
	db 30, BODY_SLAM
	db 37, WATERFALL
	db 40, AMNESIA
	db 45, SCALD
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

SwampertEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, WATER_GUN
	db 11, ROCK_THROW
    db 16, MAGNITUDE
	db 20, BUBBLEBEAM
	db 25, ROCK_SLIDE
	db 30, BODY_SLAM
	db 36, WATERFALL
	db 40, AMNESIA
	db 45, SCALD
	db 50, EARTHQUAKE
	db 0 ; no more level-up moves

EspeonEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, BATON_PASS
	db 8, FOCUS_ENERGY
	db 12, QUICK_ATTACK
	db 16, CONFUSION
	db 20, SWIFT
	db 25, PSYBEAM
	db 32, MORNING_SUN
	db 36, PSYCHIC_M
	db 41, CALM_MIND
	db 0 ; no more level-up moves

UmbreonEvosAttacks:
	db 0 ; no more evolutions
	db 1, GROWTH
	db 1, BATON_PASS
	db 8, FOCUS_ENERGY
	db 12, QUICK_ATTACK
	db 16, FEINT_ATTACK
	db 20, CONFUSE_RAY
	db 25, CRUNCH
	db 28, MEAN_LOOK
	db 32, MOONLIGHT
	db 36, DARK_PULSE
	db 41, CALM_MIND
	db 0 ; no more level-up moves

MurkrowEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, HONCHKROW
	db 0 ; no more evolutions
	db 1, PECK
	db 1, NIGHT_SHADE
	db 1, MEAN_LOOK
	db 1, FEINT_ATTACK
	db 16, CONFUSE_RAY
	db 21, WING_ATTACK
	db 30, AIR_SLASH
	db 33, NIGHT_SLASH
	db 36, DARK_PULSE
	db 41, SUCKER_PUNCH
	db 45, NASTY_PLOT
	db 50, BRAVE_BIRD
	db 0 ; no more level-up moves

SlowkingEvosAttacks:
	db 0 ; no more evolutions
	db 1, CURSE
	db 1, TACKLE
	db 6, GROWL
	db 12, WATER_GUN
	db 18, CONFUSION
	db 22, BUBBLEBEAM
	db 25, PSYBEAM
	db 28, ZEN_HEADBUTT
	db 32, RECOVER
	db 36, PSYCHIC_M
	db 41, CALM_MIND
	db 45, SCALD
	db 0 ; no more level-up moves

MisdreavusEvosAttacks:
    db EVOLVE_ITEM, MOON_STONE, MISMAGIUS
	db 0 ; no more evolutions
	db 1, GROWL
	db 6, LICK
	db 10, CONFUSION
	db 12, CONFUSE_RAY
	db 15, MEAN_LOOK
	db 20, PSYBEAM
	db 25, PAIN_SPLIT
	db 30, SHADOW_BALL
	db 35, HYPNOSIS
	db 40, PERISH_SONG
	db 0 ; no more level-up moves

UnownEvosAttacks:
	db 0 ; no more evolutions
	db 1, HIDDEN_POWER
	db 0 ; no more level-up moves

WobbuffetEvosAttacks:
	db 0 ; no more evolutions
    db 1, SAFEGUARD
	db 1, COUNTER
	db 1, MIRROR_COAT
	db 1, DESTINY_BOND
	db 0 ; no more level-up moves

BagonEvosAttacks:
	db EVOLVE_LEVEL, 30, SHELGON
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, RAGE
	db 16, HEADBUTT
	db 25, EMBER
	db 31, CRUNCH
	db 38, DRAGON_PULSE
	db 45, DRAGON_CLAW
	db 53, FIRE_BLAST
	db 55, DRAGON_DANCE
	db 60, OUTRAGE
	db 70, DRACO_METEOR
	db 0 ; no more level-up moves

ShelgonEvosAttacks:
	db EVOLVE_LEVEL, 50, SALAMENCE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, RAGE
	db 16, HEADBUTT
	db 25, EMBER
	db 30, CRUNCH
	db 38, DRAGON_PULSE
	db 45, DRAGON_CLAW
	db 53, FIRE_BLAST
	db 55, DRAGON_DANCE
	db 60, OUTRAGE
	db 70, DRACO_METEOR
	db 0 ; no more level-up moves

SalamenceEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 1, RAGE
	db 16, HEADBUTT
	db 25, EMBER
	db 30, CRUNCH
	db 38, DRAGON_PULSE
	db 45, DRAGON_CLAW
	db 50, FLY
	db 53, FIRE_BLAST
	db 55, DRAGON_DANCE
	db 60, OUTRAGE
	db 70, DRACO_METEOR
	db 0 ; no more level-up moves

DunsparceEvosAttacks:
	db 0 ; no more evolutions
	db 1, RAGE
	db 5, DEFENSE_CURL
	db 10, ROLLOUT
	db 12, GLARE
	db 20, ANCIENTPOWER
	db 25, CRUNCH
	db 30, ROOST
	db 40, DOUBLE_EDGE
	db 50, DRAGON_DANCE
	db 100, AFTER_IMAGE
	db 0 ; no more level-up moves

GligarEvosAttacks:
	db EVOLVE_LEVEL, 32, GLISCOR
	db 0 ; no more evolutions
	db 1, POISON_STING
	db 6, SAND_ATTACK
	db 9, HARDEN
	db 14, CUT
	db 18, MAGNITUDE
	db 24, NIGHT_SLASH
	db 28, SLASH
	db 30, CROSS_POISON
	db 33, SANDSTORM
	db 37, X_SCISSOR
	db 42, EARTHQUAKE
	db 50, SWORDS_DANCE
	db 55, GUILLOTINE
	db 0 ; no more level-up moves

SteelixEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 10, WRAP
	db 15, ROCK_THROW
	db 20, MAGNITUDE
	db 25, ROCK_SLIDE
	db 28, BODY_SLAM
	db 32, IRON_HEAD
	db 36, CRUNCH
	db 45, EARTHQUAKE
	db 50, DRAGON_DANCE
	db 0 ; no more level-up moves

GibleEvosAttacks:
	db EVOLVE_LEVEL, 24, GABITE
	db 0 ; no more evolutions
	db 1, BITE
	db 1, SAND_ATTACK
	db 10, MAGNITUDE
	db 14, CRUNCH
	db 18, SLASH
	db 25, DRAGON_RAGE
	db 30, DIG
	db 35, DRAGON_CLAW
	db 42, EARTHQUAKE
	db 49, OUTRAGE
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

GabiteEvosAttacks:
	db EVOLVE_LEVEL, 48, GARCHOMP
	db 0 ; no more evolutions
	db 1, BITE
	db 1, SAND_ATTACK
	db 10, MAGNITUDE
	db 14, CRUNCH
	db 18, SLASH
	db 24, DRAGON_RAGE
	db 30, DIG
	db 35, DRAGON_CLAW
	db 42, EARTHQUAKE
	db 49, OUTRAGE
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

GarchompEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, SAND_ATTACK
	db 10, MAGNITUDE
	db 14, CRUNCH
	db 18, SLASH
	db 24, DRAGON_RAGE
	db 30, DIG
	db 35, DRAGON_CLAW
	db 42, EARTHQUAKE
	db 48, OUTRAGE
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

ScizorEvosAttacks:
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, METAL_CLAW
	db 6, FOCUS_ENERGY
	db 12, FEINT_ATTACK
	db 18, FALSE_SWIPE
	db 24, AGILITY
	db 30, BULLET_PUNCH
	db 36, X_SCISSOR
	db 40, LEECH_LIFE
	db 50, SWORDS_DANCE
	db 0 ; no more level-up moves

ShayminEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, SEED_FLARE
	db 1, EARTH_POWER
	db 1, GROWTH
	db 25, SYNTHESIS
	db 35, LEECH_SEED
	db 40, AIR_SLASH
	db 50, SEED_FLARE
	db 55, GROWTH
	db 0 ; no more level-up moves

HeracrossEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 1, FOCUS_ENERGY
	db 6, HORN_ATTACK
	db 10, ENDURE
	db 14, LEECH_LIFE
	db 18, KARATE_CHOP
	db 22, COUNTER
	db 30, X_SCISSOR
	db 33, DRAIN_PUNCH
	db 36, REVERSAL
	db 40, NIGHT_SLASH
	db 45, CLOSE_COMBAT
	db 50, MEGAHORN
	db 55, SWORDS_DANCE
	db 0 ; no more level-up moves

SneaselEvosAttacks:
	db EVOLVE_ITEM, MOON_STONE, WEAVILE
	db 0 ; no more evolutions
	db 1, QUICK_ATTACK
	db 1, SCRATCH
	db 1, FOCUS_ENERGY
	db 12, POWDER_SNOW
	db 15, FEINT_ATTACK
	db 22, SLASH
	db 25, SCREECH
	db 30, ICE_PUNCH
	db 33, SUCKER_PUNCH
	db 36, DARK_PULSE
	db 41, NASTY_PLOT
	db 45, NIGHT_SLASH
	db 50, AVALANCHE
	db 0 ; no more level-up moves

TeddiursaEvosAttacks:
	db EVOLVE_LEVEL, 30, URSARING
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 8, LICK
	db 15, HEADBUTT
	db 22, REST
	db 26, CRUNCH
	db 31, SLASH
	db 32, PLAY_ROUGH
	db 35, BODY_SLAM
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

UrsaringEvosAttacks:
    db EVOLVE_ITEM, MOON_STONE, URSALUNA_B
    db EVOLVE_ITEM, SUN_STONE, URSALUNA
	db 0 ; no more evolutions
	db 1, SCRATCH
	db 8, LICK
	db 15, HEADBUTT
	db 22, REST
	db 26, CRUNCH
	db 30, SLASH
	db 32, PLAY_ROUGH
	db 35, BODY_SLAM
	db 50, DOUBLE_EDGE
	db 0 ; no more level-up moves

LatiasEvosAttacks:
	db 0 ; no more evolutions
	db 1, CONFUSION
	db 1, CHARM
	db 1, REFLECT
	db 30, PSYCHIC_M
	db 40, RECOVER
	db 50, DRAGON_PULSE
    db 60, CALM_MIND
	db 70, DRACO_METEOR
	db 0 ; no more level-up moves

DeoxysEvosAttacks:
	db 0 ; no more evolutions
	db 1, EXTREMESPEED
	db 1, RECOVER
	db 1, PSYCHIC_M
	db 1, ZEN_HEADBUTT
	db 60, CLOSE_COMBAT
	db 70, PSYCHO_BOOST
	db 80, NASTY_PLOT
	db 0 ; no more level-up moves

SwinubEvosAttacks:
	db EVOLVE_LEVEL, 30, PILOSWINE
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 16, MAGNITUDE
	db 20, ICY_WIND
	db 25, BODY_SLAM
	db 31, DIG
	db 37, AMNESIA
	db 43, EARTHQUAKE
	db 46, BLIZZARD
	db 50, AVALANCHE
	db 0 ; no more level-up moves

PiloswineEvosAttacks:
    db EVOLVE_LEVEL, 42, MAMOSWINE
	db 0 ; no more evolutions
	db 1, HORN_ATTACK
	db 1, POWDER_SNOW
	db 16, MAGNITUDE
	db 20, ICY_WIND
	db 25, BODY_SLAM
	db 30, DIG
    db 37, AMNESIA
	db 43, EARTHQUAKE
	db 46, BLIZZARD
	db 50, AVALANCHE
	db 0 ; no more level-up moves

SpiritombEvosAttacks:
	db 0 ; no more evolutions
	db 1, NIGHT_SHADE
	db 1, DESTINY_BOND
	db 1, HYPNOSIS
	db 1, DREAM_EATER
	db 32, SHADOW_BALL
	db 36, DARK_PULSE
	db 40, ACID_ARMOR
	db 43, SUCKER_PUNCH
	db 46, PAIN_SPLIT
	db 50, NASTY_PLOT
	db 0 ; no more level-up moves

LatiosEvosAttacks:
	db 0 ; no more evolutions
	db 1, PSYBEAM
	db 1, DRAGON_CLAW
	db 1, LIGHT_SCREEN
	db 30, PSYCHIC_M
	db 40, RECOVER
	db 50, DRAGON_PULSE
    db 60, CALM_MIND
	db 70, DRACO_METEOR
	db 0 ; no more level-up moves

PalkiaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE
	db 1, BUBBLEBEAM
	db 10, ANCIENTPOWER
	db 20, SLASH
	db 30, SURF
	db 40, AURA_SPHERE
	db 50, DRAGON_CLAW
	db 60, DRAGON_PULSE
	db 70, HYDRO_PUMP
	db 80, DRACO_METEOR
	db 0 ; no more level-up moves

KyogreEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE
	db 1, SURF
	db 1, ANCIENTPOWER
	db 20, WATERFALL
	db 30, BODY_SLAM
	db 40, REST
	db 50, DOUBLE_EDGE
	db 60, CALM_MIND
	db 70, ICE_BEAM
	db 80, HYDRO_PUMP
	db 0 ; no more level-up moves

GroudonEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE
	db 1, EARTH_POWER
	db 1, ANCIENTPOWER
	db 20, FIRE_PUNCH
	db 30, SOLARBEAM
	db 40, REST
	db 50, STONE_EDGE
	db 60, BULK_UP
	db 70, EARTHQUAKE
	db 80, FLARE_BLITZ
	db 0 ; no more level-up moves

SkarmoryEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, PECK
	db 13, SAND_ATTACK
	db 19, SWIFT
	db 24, SPIKES
	db 28, ROOST
	db 32, IRON_HEAD
	db 36, DRILL_PECK
	db 40, WHIRLWIND
	db 45, BRAVE_BIRD
	db 0 ; no more level-up moves

HoundourEvosAttacks:
	db EVOLVE_LEVEL, 24, HOUNDOOM
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 13, POISON_GAS
	db 20, BITE
	db 25, CRUNCH
	db 30, DARK_PULSE
	db 36, FLAMETHROWER
	db 45, NASTY_PLOT
	db 0 ; no more level-up moves

HoundoomEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEER
	db 1, EMBER
	db 7, ROAR
	db 13, POISON_GAS
	db 20, BITE
	db 24, CRUNCH
	db 30, DARK_PULSE
	db 36, FLAMETHROWER
	db 45, NASTY_PLOT
	db 0 ; no more level-up moves

KingdraEvosAttacks:
	db 0 ; no more evolutions
	db 1, BUBBLE
	db 8, SMOKESCREEN
	db 10, LEER
	db 13, WATER_GUN
	db 20, BUBBLEBEAM
	db 25, RAIN_DANCE
	db 33, WATERFALL
	db 40, DRAGON_PULSE
	db 45, DRAGON_CLAW
	db 50, HYDRO_PUMP
	db 55, DRAGON_DANCE
	db 60, OUTRAGE
	db 0 ; no more level-up moves

CottoneeEvosAttacks:
	db EVOLVE_ITEM, SUN_STONE, WHIMSICOTT
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWL
	db 12, MEGA_DRAIN
	db 15, LEECH_SEED
	db 18, DRAIN_KISS
	db 21, STUN_SPORE
	db 24, GIGA_DRAIN
	db 27, CONFUSE_RAY
	db 30, SUNNY_DAY
	db 36, MOON_BLAST
	db 40, SOLARBEAM
	db 0 ; no more level-up moves

WhimsicottEvosAttacks:
	db 0 ; no more evolutions
	db 1, ABSORB
	db 1, GROWL
	db 12, MEGA_DRAIN
	db 15, LEECH_SEED
	db 18, DRAIN_KISS
	db 21, STUN_SPORE
	db 24, GIGA_DRAIN
	db 27, CONFUSE_RAY
	db 30, SUNNY_DAY
	db 36, MOON_BLAST
	db 40, SOLARBEAM
	db 0 ; no more level-up moves

Porygon2EvosAttacks:
    db EVOLVE_LEVEL, 40, PORYGONZ
	db 0 ; no more evolutions
	db 1, TACKLE
	db 12, PSYBEAM
	db 20, RECOVER
	db 24, DEFENSE_CURL
	db 30, SWIFT
	db 33, FEINT_ATTACK
	db 36, LOCK_ON
	db 36, ZAP_CANNON
	db 41, TRI_ATTACK
	db 50, AGILITY
	db 0 ; no more level-up moves

RayquazaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE
	db 1, FLY
	db 1, ANCIENTPOWER
	db 1, CRUNCH
	db 20, DRAGON_PULSE
	db 30, REST
	db 35, EXTREMESPEED
	db 40, DRAGON_CLAW
	db 50, DRAGON_DANCE
	db 60, DRACO_ASCENT
	db 65, OUTRAGE
	db 70, DRACO_METEOR
	db 0 ; no more level-up moves

SmeargleEvosAttacks:
	db 0 ; no more evolutions
	db 1, SKETCH
	db 11, SKETCH
	db 21, SKETCH
	db 31, SKETCH
	db 41, SKETCH
	db 51, SKETCH
	db 61, SKETCH
	db 71, SKETCH
	db 81, SKETCH
	db 91, SKETCH
	db 0 ; no more level-up moves

DialgaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE
	db 1, METAL_CLAW
	db 10, ANCIENTPOWER
	db 20, SLASH
	db 30, FLASH_CANNON
	db 40, AURA_SPHERE
	db 50, DRAGON_PULSE
	db 60, DRAGON_CLAW
	db 70, OUTRAGE
	db 80, METEOR_MASH
	db 0 ; no more level-up moves

KlefkiEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, METRONOME
	db 12, SCREECH
	db 16, REFLECT
	db 18, LIGHT_SCREEN
	db 20, SPIKES
	db 20, DRAIN_KISS
	db 24, CONFUSE_RAY
	db 30, IRON_HEAD
	db 35, FLASH_CANNON
	db 40, MOON_BLAST
	db 0 ; no more level-up moves

XerneasEvosAttacks:
	db 0 ; no more evolutions
	db 1, DRAIN_KISS
	db 40, CLOSE_COMBAT
	db 50, MEGAHORN
	db 60, PLAY_ROUGH
	db 70, MOON_BLAST
	db 80, GEOMANCY
	db 0 ; no more level-up moves

YveltalEvosAttacks:
	db 0 ; no more evolutions
	db 1, AIR_SLASH
	db 1, SUCKER_PUNCH
	db 50, RECOVER
	db 60, DARK_PULSE
	db 70, OBLIVION
	db 75, HURRICANE
	db 80, NASTY_PLOT
	db 0 ; no more level-up moves

GiratinaEvosAttacks:
	db 0 ; no more evolutions
	db 1, SCARY_FACE
	db 1, SLASH
	db 1, NIGHT_SLASH
	db 1, ANCIENTPOWER
	db 40, DRAGON_CLAW
	db 50, SHADOW_PUNCH
	db 60, SHADOW_BALL
	db 70, RECOVER
	db 75, DRACO_METEOR
	db 80, SHADOW_FORCE
	db 0 ; no more level-up moves

MiltankEvosAttacks:
	db 0 ; no more evolutions
	db 1, TACKLE
	db 8, DEFENSE_CURL
	db 13, STOMP
	db 19, MILK_DRINK
	db 23, HEADBUTT
	db 26, ROLLOUT
	db 30, ZEN_HEADBUTT
	db 35, PLAY_ROUGH
	db 40, BODY_SLAM
	db 50, HEAL_BELL
	db 0 ; no more level-up moves

BlisseyEvosAttacks:
	db 0 ; no more evolutions
	db 1, POUND
	db 5, GROWL
	db 9, TAIL_WHIP
	db 13, SOFTBOILED
	db 17, DOUBLESLAP
	db 22, SING
	db 27, BODY_SLAM
    db 33, TRI_ATTACK
	db 36, LIGHT_SCREEN
	db 40, SOFTBOILED
	db 45, DOUBLE_EDGE
	db 50, HEAL_BELL
	db 0 ; no more level-up moves

RaikouEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, THUNDERSHOCK
	db 21, ROAR
	db 31, QUICK_ATTACK
	db 36, DISCHARGE
	db 41, THUNDERBOLT
	db 45, CRUNCH
	db 50, REFLECT
	db 55, THUNDER
	db 60, VOLT_TACKLE
	db 0 ; no more level-up moves

EnteiEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, EMBER
	db 21, ROAR
	db 31, FLAMETHROWER
	db 41, FIRE_BLAST
	db 45, EXTREMESPEED
	db 50, CLOSE_COMBAT
	db 55, FLARE_BLITZ
	db 60, SACRED_FIRE
	db 0 ; no more level-up moves

SuicuneEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 11, BUBBLEBEAM
	db 21, RAIN_DANCE
	db 31, GUST
	db 41, AURORA_BEAM
	db 45, MIRROR_COAT
	db 50, SCALD
	db 55, HYDRO_PUMP
	db 60, CALM_MIND
	db 0 ; no more level-up moves

LarvitarEvosAttacks:
	db EVOLVE_LEVEL, 30, PUPITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 8, SANDSTORM
	db 11, ROCK_THROW
	db 16, MAGNITUDE
	db 25, ROCK_SLIDE
	db 31, CRUNCH
	db 40, EARTHQUAKE
	db 51, STONE_EDGE
	db 55, DRAGON_DANCE
	db 0 ; no more level-up moves

PupitarEvosAttacks:
	db EVOLVE_LEVEL, 50, TYRANITAR
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 8, SANDSTORM
	db 16, MAGNITUDE
	db 25, ROCK_SLIDE
	db 30, CRUNCH
	db 40, EARTHQUAKE
	db 51, STONE_EDGE
	db 55, DRAGON_DANCE
	db 0 ; no more level-up moves

TyranitarEvosAttacks:
	db 0 ; no more evolutions
	db 1, BITE
	db 1, LEER
	db 8, SANDSTORM
	db 16, MAGNITUDE
	db 25, ROCK_SLIDE
	db 30, CRUNCH
	db 40, EARTHQUAKE
	db 50, STONE_EDGE
	db 55, DRAGON_DANCE
	db 0 ; no more level-up moves

LugiaEvosAttacks:
	db 0 ; no more evolutions
    db 1, ANCIENTPOWER
    db 1, PSYCHIC_M
    db 1, AEROBLAST
    db 1, RECOVER
    db 65, HURRICANE
    db 70, CALM_MIND
	db 0 ; no more level-up moves

HoOhEvosAttacks:
	db 0 ; no more evolutions
	db 1, ANCIENTPOWER
	db 1, FLY
	db 1, SACRED_FIRE
	db 1, RECOVER
	db 65, BRAVE_BIRD
	db 70, SWORDS_DANCE
	db 0 ; no more level-up moves

CelebiEvosAttacks:
	db 0 ; no more evolutions
	db 1, LEECH_SEED
	db 1, CONFUSION
	db 1, RECOVER
	db 1, HEAL_BELL
	db 20, ANCIENTPOWER
	db 30, BATON_PASS
	db 55, PSYCHO_SLASH
	db 60, LEAF_BLADE
	db 65, SYNTHESIS
	db 0 ; no more level-up moves

MewtwoEvosAttacks:
	db 0 ; no more evolutions
	db 1, TELEPORT
	db 1, PSYCHIC_M
	db 1, BARRIER
	db 1, BIG_RECOVER
	db 1, SERENITY
	db 1, PSYBLAST
	db 0 ; no more level-up moves

ArceusEvosAttacks:
	db 0 ; no more evolutions
	db 1, DIG
	db 1, TELEPORT
	db 1, EXTREMESPEED
	db 1, PERISH_SONG
	db 1, SWORDS_DANCE
	db 1, BIG_RECOVER
	db 1, HOLY_ARMOUR
	db 1, JUDGEMENT
	db 0 ; no more level-up moves

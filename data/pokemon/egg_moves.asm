INCLUDE "constants.asm"


SECTION "Egg Moves", ROMX

; All instances of Charm, Steel Wing, Sweet Scent, and Lovely Kiss were
; removed from egg move lists in Crystal.
; Sweet Scent and Steel Wing were redundant since they're TMs, and
; Charm and Lovely Kiss were unobtainable.

; Staryu's egg moves were removed in Crystal, because Staryu is genderless
; and can only breed with Ditto.

INCLUDE "data/pokemon/egg_move_pointers.asm"

BulbasaurEggMoves:
	db LIGHT_SCREEN
	db SAFEGUARD
	db -1 ; end

CharmanderEggMoves:
	db BELLY_DRUM
	db ANCIENTPOWER
	db CRUNCH
	db OUTRAGE
	db -1 ; end

SquirtleEggMoves:
	db MIRROR_COAT
	db HAZE
	db -1 ; end

StarlyEggMoves:
	db FEINT_ATTACK
	db NIGHT_SLASH
	db -1 ; end

RattataEggMoves:
	db SCREECH
	db FLAME_WHEEL
	db FURY_SWIPES
	db SHADOW_PUNCH
	db COUNTER
	db -1 ; end

BunearyEggMoves:
	db NIGHT_SLASH
	db FALSE_SWIPE
	db SCARY_FACE
	db QUICK_ATTACK
	db FINAL_FANG
	db -1 ; end

DeinoEggMoves:
	db FEINT_ATTACK
	db CRUNCH
	db -1 ; end

SandshrewEggMoves:
	db SAFEGUARD
	db COUNTER
	db RAPID_SPIN
	db METAL_CLAW
	db -1 ; end

NidoranFEggMoves:
	db DISABLE
	db TAKE_DOWN
	db FOCUS_ENERGY
	db CHARM
	db COUNTER
	db -1 ; end

NidoranMEggMoves:
	db DISABLE
	db TAKE_DOWN
	db CONFUSION
	db AMNESIA
	db COUNTER
	db -1 ; end

VulpixEggMoves:
	db NIGHT_SLASH
	db HYPNOSIS
	db DISABLE
	db -1 ; end

ZubatEggMoves:
	db QUICK_ATTACK
	db FEINT_ATTACK
	db NIGHT_SLASH
	db GUST
	db WHIRLWIND
	db -1 ; end

PawniardEggMoves:
    db EXTREMESPEED
    db SPIKES
	db -1 ; end

ZygardeEggMoves:
	db -1 ; end

LarvestaEggMoves:
	db MORNING_SUN
	db SOLARBEAM
	db -1 ; end

ArctozoltEggMoves:
    db BLIZZARD
	db -1 ; end

MeowthEggMoves:
	db CHARM
	db HYPNOSIS
	db AMNESIA
	db -1 ; end

SnoverEggMoves:
	db ICE_BEAM
	db LIGHT_SCREEN
	db -1 ; end

ShroomishEggMoves:
	db ROCK_SLIDE
	db MEDITATE
	db COUNTER
	db -1 ; end

GrowlitheEggMoves:
	db BODY_SLAM
	db SAFEGUARD
	db CRUNCH
	db THRASH
	db FIRE_SPIN
	db -1 ; end

PoliwagEggMoves:
	db SPLASH
	db BUBBLEBEAM
	db HAZE
	db MIND_READER
	db -1 ; end

AbraEggMoves:
	db LIGHT_SCREEN
	db ENCORE
	db BARRIER
	db -1 ; end

MachopEggMoves:
	db LIGHT_SCREEN
	db MEDITATE
	db DOUBLE_KICK
	db ENCORE
	db -1 ; end

BellsproutEggMoves:
	db SWORDS_DANCE
	db ENCORE
	db REFLECT
	db SYNTHESIS
	db LEECH_LIFE
	db -1 ; end

TentacoolEggMoves:
	db AURORA_BEAM
	db MIRROR_COAT
	db RAPID_SPIN
	db HAZE
	db SAFEGUARD
	db -1 ; end

GeodudeEggMoves:
	db MEGA_PUNCH
	db ROCK_SLIDE
	db -1 ; end

PonytaEggMoves:
	db FLAME_WHEEL
	db THRASH
	db DOUBLE_KICK
	db HYPNOSIS
	db CHARM
	db QUICK_ATTACK
	db -1 ; end

SlowpokeEggMoves:
	db SAFEGUARD
	db BELLY_DRUM
	db STOMP
	db -1 ; end

MamoswineEggMoves:
	db QUICK_ATTACK
	db -1 ; end

ElectivireEggMoves:
	db QUICK_ATTACK
	db HAZE
	db NIGHT_SLASH
	db -1 ; end

YanmegaEggMoves:
	db -1 ; end

FerroseedEggMoves:
	db SPIKES
	db ACID_ARMOR
	db -1 ; end

ShellderEggMoves:
	db BUBBLEBEAM
	db TAKE_DOWN
	db BARRIER
	db RAPID_SPIN
	db SCREECH
	db -1 ; end

GastlyEggMoves:
	db PERISH_SONG
	db HAZE
	db -1 ; end

OnixEggMoves:
	db ROCK_SLIDE
	db -1 ; end

UrsalunaEggMoves:
	db -1 ; end

FeebasEggMoves:
	db -1 ; end

ExeggcuteEggMoves:
	db SYNTHESIS
	db MOONLIGHT
	db REFLECT
	db MEGA_DRAIN
	db ANCIENTPOWER
	db -1 ; end

ReuniclusEggMoves:
	db BELLY_DRUM
	db MAGNITUDE
	db BODY_SLAM
	db -1 ; end

ZweilousEggMoves:
	db SCREECH
	db PSYBEAM
	db DESTINY_BOND
	db PAIN_SPLIT
	db -1 ; end

RhyhornEggMoves:
	db CRUNCH
	db ROCK_SLIDE
	db THRASH
	db FEINT_ATTACK
	db COUNTER
	db MAGNITUDE
	db -1 ; end

ChanseyEggMoves:
	db METRONOME
	db HEAL_BELL
	db -1 ; end

WeavileEggMoves:
	db CONFUSION
	db MEGA_DRAIN
	db REFLECT
	db AMNESIA
	db -1 ; end

RhyperiorEggMoves:
	db STOMP
	db FOCUS_ENERGY
	db SAFEGUARD
	db DISABLE
	db -1 ; end

HorseaEggMoves:
	db AURORA_BEAM
	db DRAGON_DANCE
	db DISABLE
	db SPLASH
	db DRAGON_RAGE
	db -1 ; end

MagmortarEggMoves:
	db PSYBEAM
	db HAZE
	db HYDRO_PUMP
	db -1 ; end

MrMimeEggMoves:
	db HYPNOSIS
	db MIMIC
	db -1 ; end

ScytherEggMoves:
	db COUNTER
	db SAFEGUARD
	db BATON_PASS
	db LIGHT_SCREEN
	db -1 ; end

PinsirEggMoves:
	db FURY_ATTACK
	db -1 ; end

LaprasEggMoves:
	db AURORA_BEAM
	db -1 ; end

EeveeEggMoves:
	db CHARM
	db -1 ; end

RaltsEggMoves:
	db CONFUSE_RAY
	db DESTINY_BOND
	db DISABLE
	db MEAN_LOOK
	db -1 ; end

GardevoirEggMoves:
	db BUBBLEBEAM
	db AURORA_BEAM
	db RAPID_SPIN
	db DIG
	db -1 ; end

AerodactylEggMoves:
	db WHIRLWIND
	db FEINT_ATTACK
	db -1 ; end

SnorlaxEggMoves:
	db LICK
	db -1 ; end

DratiniEggMoves:
	db LIGHT_SCREEN
	db HAZE
	db -1 ; end

TreeckoEggMoves:
	db VINE_WHIP
	db LEECH_SEED
	db COUNTER
	db ANCIENTPOWER
	db SWORDS_DANCE
	db -1 ; end

ChimcharEggMoves:
	db FLARE_BLITZ
	db QUICK_ATTACK
	db THRASH
	db SUBMISSION
	db -1 ; end

FroakieEggMoves:
	db CRUNCH
	db THRASH
	db HYDRO_PUMP
	db ANCIENTPOWER
	db ROCK_SLIDE
	db -1 ; end

RioluEggMoves:
	db NASTY_PLOT
	db SWORDS_DANCE
	db CLOSE_COMBAT
	db AURA_SPHERE
	db -1 ; end

HoothootEggMoves:
	db NIGHT_SLASH
	db WING_ATTACK
	db WHIRLWIND
	db -1 ; end

DrilburEggMoves:
	db SWORDS_DANCE
	db EARTHQUAKE
	db FISSURE
	db MAGNITUDE
	db BELLY_DRUM
	db -1 ; end

JoltikEggMoves:
	db PSYBEAM
	db DISABLE
	db SONICBOOM
	db BATON_PASS
	db FEINT_ATTACK
	db -1 ; end

FrigibaxEggMoves:
	db SCREECH
	db -1 ; end

LitwickEggMoves:
	db CALM_MIND
	db -1 ; end

TogepiEggMoves:
	db PECK
	db -1 ; end

TogekissEggMoves:
	db HAZE
	db DRILL_PECK
	db QUICK_ATTACK
	db NIGHT_SLASH
	db -1 ; end

MareepEggMoves:
	db THUNDERBOLT
	db TAKE_DOWN
	db BODY_SLAM
	db SAFEGUARD
	db SCREECH
	db REFLECT
	db -1 ; end

MarillEggMoves:
	db LIGHT_SCREEN
	db AMNESIA
	db BELLY_DRUM
	db PERISH_SONG
	db PLAY_ROUGH
	db -1 ; end

GenesectEggMoves:
	db SELFDESTRUCT
	db -1 ; end

TimburrEggMoves:
	db MACH_PUNCH
	db CLOSE_COMBAT
	db COUNTER
	db -1 ; end

YanmaEggMoves:
	db WHIRLWIND
	db LEECH_LIFE
	db -1 ; end

MarshtompEggMoves:
	db BODY_SLAM
	db ANCIENTPOWER
	db SAFEGUARD
	db -1 ; end

MurkrowEggMoves:
	db WHIRLWIND
	db DRILL_PECK
	db QUICK_ATTACK
	db WING_ATTACK
	db -1 ; end

MisdreavusEggMoves:
	db SCREECH
	db DESTINY_BOND
	db -1 ; end

BagonEggMoves:
	db DRAGON_DANCE
	db OUTRAGE
	db FLAMETHROWER
	db -1 ; end

HydreigonEggMoves:
	db ANCIENTPOWER
	db ROCK_SLIDE
	db BITE
	db -1 ; end

GligarEggMoves:
	db METAL_CLAW
	db WING_ATTACK
	db COUNTER
	db -1 ; end

GibleEggMoves:
	db OUTRAGE
	db SWORDS_DANCE
	db EARTHQUAKE
	db -1 ; end

ShayminEggMoves:
	db HARDEN
	db -1 ; end

HeracrossEggMoves:
	db HARDEN
	db -1 ; end


SneaselEggMoves:
	db COUNTER
	db REFLECT
	db BITE
	db -1 ; end

TeddiursaEggMoves:
	db CRUNCH
	db TAKE_DOWN
	db SEISMIC_TOSS
	db FOCUS_ENERGY
	db COUNTER
	db METAL_CLAW
	db -1 ; end

LatiasEggMoves:
	db ACID_ARMOR
	db -1 ; end

SwinubEggMoves:
	db TAKE_DOWN
	db BITE
	db BODY_SLAM
	db ROCK_SLIDE
	db ANCIENTPOWER
	db -1 ; end

SkarmoryEggMoves:
	db DRILL_PECK
	db FEINT_ATTACK
	db WHIRLWIND
	db -1 ; end

HoundourEggMoves:
	db FIRE_SPIN
	db FEINT_ATTACK
	db COUNTER
	db -1 ; end

CottoneeEggMoves:
	db FOCUS_ENERGY
	db BODY_SLAM
	db ANCIENTPOWER
	db -1 ; end

MiltankEggMoves:
	db SEISMIC_TOSS
	db -1 ; end

LarvitarEggMoves:
	db FEINT_ATTACK
	db STOMP
	db OUTRAGE
	db FOCUS_ENERGY
	db ANCIENTPOWER
	db -1 ; end

NoEggMoves:
	db -1 ; end

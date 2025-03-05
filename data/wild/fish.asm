time_group EQUS "0," ; use the nth TimeFishGroups entry

fishgroup: MACRO
; chance, old rod, good rod, super rod
	db \1
	dw \2, \3, \4
ENDM

FishGroups:
; entries correspond to FISHGROUP_* constants
	table_width FISHGROUP_DATA_LENGTH, FishGroups
	fishgroup 50 percent + 1, .Shore_Old,            .Shore_Good,            .Shore_Super
	fishgroup 50 percent + 1, .Ocean_Old,            .Ocean_Good,            .Ocean_Super
	fishgroup 50 percent + 1, .Lake_Old,             .Lake_Good,             .Lake_Super
	fishgroup 50 percent + 1, .Pond_Old,             .Pond_Good,             .Pond_Super
	fishgroup 50 percent + 1, .Dratini_Old,          .Dratini_Good,          .Dratini_Super
	fishgroup 50 percent + 1, .Garchomp_Swarm_Old,   .Garchomp_Swarm_Good,   .Garchomp_Swarm_Super
	fishgroup 50 percent + 1, .Latios_Swarm_Old,   .Latios_Swarm_Good,   .Latios_Swarm_Super
	fishgroup 50 percent + 1, .Gyarados_Old,         .Gyarados_Good,         .Gyarados_Super
	fishgroup 50 percent + 1, .Dratini_2_Old,        .Dratini_2_Good,        .Dratini_2_Super
	fishgroup 50 percent + 1, .WhirlIslands_Old,     .WhirlIslands_Good,     .WhirlIslands_Super
	fishgroup 50 percent + 1, .Garchomp_Old,         .Garchomp_Good,         .Garchomp_Super
	fishgroup 50 percent + 1, .Latios_Old,         .Latios_Good,         .Latios_Super
	fishgroup 50 percent + 1, .Garchomp_NoSwarm_Old, .Garchomp_NoSwarm_Good, .Garchomp_NoSwarm_Super
	assert_table_length NUM_FISHGROUPS

.Shore_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     FEEBAS,     15
.Shore_Good:
	db  35 percent,     FEEBAS,   20
	db  70 percent,     POLIWHIRL,     30
	db  90 percent + 1, SHELLDER,     30
	db 100 percent,     time_group 0
.Shore_Super:
	db  40 percent,     POLIWRATH,     50
	db  70 percent,     time_group 1
	db  90 percent + 1, CLOYSTER,     50
	db 100 percent,     GYARADOS,    60

.Ocean_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     TENTACOOL,  15
.Ocean_Good:
	db  35 percent,     TENTACOOL,   20
	db  70 percent,     STARYU,  30
	db  90 percent + 1, CHINCHOU,   30
	db 100 percent,     time_group 2
.Ocean_Super:
	db  40 percent,     TENTACRUEL,   50
	db  70 percent,     time_group 3
	db  90 percent + 1, LANTURN, 50
	db 100 percent,     STARMIE,    60

.Lake_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     FEEBAS,    15
.Lake_Good:
	db  35 percent,     FEEBAS,   20
	db  70 percent,     MUDKIP,    30
	db  90 percent + 1, GOLDUCK,    30
	db 100 percent,     time_group 4
.Lake_Super:
	db  40 percent,     GOLDUCK,    50
	db  70 percent,     time_group 5
	db  90 percent + 1, GYARADOS,   50
	db 100 percent,     MILOTIC,    60

.Pond_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     PSYDUCK,    15
.Pond_Good:
	db  35 percent,     DRATINI,   20
	db  70 percent,     POLIWHIRL,    30
	db  90 percent + 1, GOLDUCK,    30
	db 100 percent,     time_group 6
.Pond_Super:
	db  40 percent,     POLITOED,    50
	db  70 percent,     time_group 7
	db  90 percent + 1, POLIWRATH,   50
	db 100 percent,     DRAGONAIR,    60

.Dratini_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     DRATINI,   15
.Dratini_Good:
	db  35 percent,     DRATINI,   20
	db  70 percent,     DRATINI,   20
	db  90 percent + 1, DRAGONAIR,   30
	db 100 percent,     time_group 8
.Dratini_Super:
	db  40 percent,     DRAGONAIR,   40
	db  70 percent,     time_group 9
	db  90 percent + 1, DRAGONAIR,   50
	db 100 percent,     DRAGONITE,  60

.Garchomp_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     HORSEA,   15
.Garchomp_Swarm_Good:
	db  35 percent,     HORSEA,   20
	db  70 percent,     HORSEA,   20
	db  90 percent + 1, SEADRA,   30
	db 100 percent,     time_group 10
.Garchomp_Swarm_Super:
	db  40 percent,     SEADRA,   40
	db  70 percent,     time_group 11
	db  90 percent + 1, SEADRA,   50
	db 100 percent,     KINGDRA,   60

.Latios_Swarm_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, FEEBAS,   15
	db 100 percent,     FEEBAS,   15
.Latios_Swarm_Good:
	db  35 percent,     FEEBAS,   20
	db  70 percent,     FEEBAS,   20
	db  90 percent + 1, MILOTIC,   30
	db 100 percent,     time_group 12
.Latios_Swarm_Super:
	db  40 percent,     MILOTIC,   40
	db  70 percent,     time_group 13
	db  90 percent + 1, MILOTIC,   50
	db 100 percent,     MILOTIC,   60

.Gyarados_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     MAGIKARP,   15
.Gyarados_Good:
	db  35 percent,     MAGIKARP,   20
	db  70 percent,     MAGIKARP,   20
	db  90 percent + 1, GYARADOS,   30
	db 100 percent,     time_group 14
.Gyarados_Super:
	db  40 percent,     GYARADOS,   40
	db  70 percent,     time_group 15
	db  90 percent + 1, GYARADOS,   50
	db 100 percent,     GYARADOS,   60

.Dratini_2_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     DRATINI,   15
.Dratini_2_Good:
	db  35 percent,     DRATINI,   20
	db  70 percent,     DRATINI,   20
	db  90 percent + 1, DRAGONAIR,   30
	db 100 percent,     time_group 16
.Dratini_2_Super:
	db  40 percent,     DRAGONAIR,   40
	db  70 percent,     time_group 17
	db  90 percent + 1, DRAGONAIR,   50
	db 100 percent,     DRAGONITE,  60

.WhirlIslands_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, SLOWPOKE,   15
	db 100 percent,     DRATINI,     15
.WhirlIslands_Good:
	db  35 percent,     SLOWPOKE,   30
	db  70 percent,     GYARADOS,     30
	db  90 percent + 1, DRAGONAIR,     30
	db 100 percent,     time_group 18
.WhirlIslands_Super:
	db  40 percent,     SLOWKING,     60
	db  70 percent,     time_group 19
	db  90 percent + 1, KINGDRA,    60
	db 100 percent,     DRAGONITE,     60

.Garchomp_NoSwarm_Old:
.Garchomp_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     FEEBAS,  15
.Garchomp_NoSwarm_Good:
.Garchomp_Good:
	db  35 percent,     SQUIRTLE,   20
	db  70 percent,     WARTORTLE,  30
	db  90 percent + 1, WARTORTLE,  30
	db 100 percent,     time_group 20
.Garchomp_NoSwarm_Super:
.Garchomp_Super:
	db  40 percent,     BLASTOISE,  50
	db  70 percent,     time_group 21
	db  90 percent + 1, BLASTOISE,   50
	db 100 percent,     BLASTOISE,   60

.Latios_Old:
	db  70 percent + 1, MAGIKARP,   15
	db  85 percent + 1, MAGIKARP,   15
	db 100 percent,     FEEBAS,    15
.Latios_Good:
	db  35 percent,     FROAKIE,   20
	db  70 percent,     FROGADIER,    30
	db  90 percent + 1, FROGADIER,    30
	db 100 percent,     time_group 6
.Latios_Super:
	db  40 percent,     GRENINJA,    50
	db  70 percent,     time_group 7
	db  90 percent + 1, GRENINJA,   50
	db 100 percent,     GRENINJA,   60

TimeFishGroups:
	;  day              nite
	db STARYU,    20,  STARYU,     20 ; 0
	db STARMIE,    40,  STARMIE,     40 ; 1
	db SHELLDER,   20,  SHELLDER,   20 ; 2
	db CLOYSTER,   40,  CLOYSTER,   40 ; 3
	db MAGIKARP,    20,  MAGIKARP,    20 ; 4
	db GYARADOS,    40,  GYARADOS,    40 ; 5
	db POLIWAG,    20,  POLIWAG,    20 ; 6
	db POLIWHIRL,    40,  POLIWHIRL,    40 ; 7
	db DRATINI,    20,  DRATINI,    20 ; 8
	db DRAGONAIR,    40,  DRAGONAIR,    40 ; 9
	db HORSEA,   20,  HORSEA,   20 ; 10
	db SEADRA,   40,  SEADRA,   40 ; 11
	db FEEBAS,   20,  FEEBAS,   20 ; 12
	db MILOTIC,   40,  MILOTIC,   40 ; 13
	db SLOWPOKE,   20,  SLOWPOKE,   20 ; 14
	db SLOWKING,   40,  SLOWKING,   40 ; 15
	db CHINCHOU,    20,  CHINCHOU,    20 ; 16
	db LANTURN,    40,  LANTURN,    40 ; 17
	db KINGDRA,     60,  KINGDRA,     60 ; 18
	db DRAGONITE,     60,  DRAGONITE,     60 ; 19
	db TENTACOOL,  20,  TENTACOOL,  20 ; 20
	db TENTACRUEL,  40,  TENTACRUEL,  40 ; 21

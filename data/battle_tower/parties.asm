MACRO bt_mon
	db \1 ; species
	db \2 ; item
	db \3, \4, \5, \6 ; moves
ENDM

MACRO assert_bt_pool
	assert (\2 - \1) % BATTLETOWER_MON_STRUCT_LENGTH == 0, "\1 length must use compact BT mon records"
	assert (\2 - \1) / BATTLETOWER_MON_STRUCT_LENGTH <= $ff, "\1 must fit in a one-byte compact BT pool count"
ENDM

; Legacy label retained for older references; new selection uses BattleTowerChallengePools.
BattleTowerMons:

; Seed data pending final Battle Tower roster curation.
BattleTowerPool_EarlyEvolved:
	bt_mon AERODACTYL, GOLD_BERRY, DRAGON_RAGE, EARTHQUAKE, ROCK_SLIDE, ROOST
	bt_mon GYARADOS, GOLD_BERRY, DRAGON_RAGE, WATERFALL, FLIP_TURN, FLY
	bt_mon DRATINI, EVIOLITE, DRAGON_RAGE, THUNDER_WAVE, THUNDERBOLT, ICE_BEAM
	bt_mon GIBLE, EVIOLITE, DRAGON_RAGE, EARTHQUAKE, ROCK_SLIDE, SLASH
	bt_mon AZUMARILL, CHOICE_BAND, PLAY_ROUGH, AQUA_JET, DRAIN_PUNCH, FLIP_TURN
	bt_mon NIDOKING, ASSAULT_VEST, EARTHQUAKE, THRASH, ROCK_SLIDE, FIRE_PUNCH
	bt_mon NIDOQUEEN, ASSAULT_VEST, EARTH_POWER, SLUDGE_BOMB, THUNDERBOLT, ICE_BEAM
	bt_mon MAWILE, CHOICE_BAND, IRON_HEAD, BULLET_PUNCH, DRAIN_PUNCH, BITE
	bt_mon ARCANINE, GOLD_BERRY, FIRE_BLAST, DIG, AI_RETURN, FLAME_WHEEL
	bt_mon SCYTHER, EVIOLITE, WING_ATTACK, X_SCISSOR, ROCK_SMASH, ROOST
	bt_mon STARMIE, LIFE_ORB, PSYCHIC_M, SURF, THUNDER, BLIZZARD
	bt_mon HOUNDOOM, CHOICE_SPECS, FIRE_BLAST, DARK_PULSE, SLUDGE_BOMB, AURA_SPHERE
BattleTowerPool_EarlyEvolvedEnd:
	assert_bt_pool BattleTowerPool_EarlyEvolved, BattleTowerPool_EarlyEvolvedEnd

BattleTowerPool_Evolved:
	bt_mon SNORLAX, LEFTOVERS, AI_RETURN, CRUNCH, REST, CURSE
	bt_mon VENUSAUR, LEFTOVERS, GIGA_DRAIN, EARTH_POWER, LEECH_SEED, TOXIC_SPIKES
	bt_mon CHARIZARD, CHARCOAL, FIRE_BLAST, AIR_SLASH, SOLARBEAM, ROOST
	bt_mon SCEPTILE, LIFE_ORB, LEAF_BLADE, EARTHQUAKE, ROCK_SLIDE, U_TURN
	bt_mon INFERNAPE, CHARCOAL, FLAMETHROWER, DRAIN_PUNCH, THUNDERPUNCH, DIG
	bt_mon GRENINJA, EXPERT_BELT, SURF, DARK_PULSE, BLIZZARD, THUNDERPUNCH
	bt_mon BLASTOISE, GOLD_BERRY, SURF, ICE_BEAM, EARTHQUAKE, BODY_SLAM
	bt_mon SKARMORY, LEFTOVERS, FLY, STEALTH_ROCK, SWORDS_DANCE, ROOST
	bt_mon ELECTIVIRE, EXPERT_BELT, THUNDERBOLT, EARTHQUAKE, ICE_PUNCH, DRAIN_PUNCH
	bt_mon MAGMORTAR, EXPERT_BELT, FIRE_BLAST, THUNDERBOLT, EARTHQUAKE, GIGA_DRAIN
	bt_mon CONKELDURR, FLAME_ORB, BULK_UP, DRAIN_PUNCH, ICE_PUNCH, THUNDERPUNCH
	bt_mon AEGISLASH, LEFTOVERS, KINGS_SHIELD, BULLET_PUNCH, SHADOW_PUNCH, IRON_HEAD
BattleTowerPool_EvolvedEnd:
	assert_bt_pool BattleTowerPool_Evolved, BattleTowerPool_EvolvedEnd

BattleTowerPool_PseudoLegendary:
	bt_mon GARCHOMP, GOLD_BERRY, SWORDS_DANCE, DRAGON_CLAW, EARTHQUAKE, STEALTH_ROCK
	bt_mon METAGROSS, GOLD_BERRY, METEOR_MASH, EARTHQUAKE, ICE_PUNCH, EXPLOSION
	bt_mon SALAMENCE, FOCUS_SASH, DRAGON_DANCE, OUTRAGE, EARTHQUAKE, IRON_HEAD
	bt_mon TYRANITAR, LEFTOVERS, DRAGON_DANCE, STONE_EDGE, CRUNCH, EARTHQUAKE
	bt_mon DRAGONITE, LEFTOVERS, DRAGON_DANCE, DRAGON_CLAW, FIRE_PUNCH, ROOST
	bt_mon BAXCALIBUR, LEFTOVERS, AVALANCHE, DRAIN_PUNCH, SWORDS_DANCE, DRAGON_DANCE
	bt_mon HYDREIGON, EXPERT_BELT, DRACO_METEOR, FIRE_BLAST, THUNDER, BLIZZARD
BattleTowerPool_PseudoLegendaryEnd:
	assert_bt_pool BattleTowerPool_PseudoLegendary, BattleTowerPool_PseudoLegendaryEnd

BattleTowerPool_Legendary:
	bt_mon ARTICUNO, LEFTOVERS, BLIZZARD, FREEZE_DRY, CALM_MIND, ROOST
	bt_mon ZAPDOS, LEFTOVERS, THUNDERBOLT, AURORA_BEAM, BRAVE_BIRD, ROOST
	bt_mon MOLTRES, LIFE_ORB, FIRE_BLAST, BRAVE_BIRD, FLARE_BLITZ, ROOST
	bt_mon RAIKOU, MAGNET, THUNDERBOLT, DARK_PULSE, AURA_SPHERE, CALM_MIND
	bt_mon ENTEI, LIFE_ORB, CLOSE_COMBAT, SACRED_FIRE, EARTHQUAKE, EXTREMESPEED
	bt_mon SUICUNE, LEFTOVERS, SCALD, FREEZE_DRY, CALM_MIND, REST
	bt_mon LATIAS, LEFTOVERS, DRACO_METEOR, CALM_MIND, THUNDER_WAVE, RECOVER
	bt_mon LATIOS, CHOICE_SPECS, DRACO_METEOR, SURF, ICE_BEAM, THUNDERBOLT
	bt_mon CELEBI, LEFTOVERS, GIGA_DRAIN, PSYCHIC_M, NASTY_PLOT, RECOVER
BattleTowerPool_LegendaryEnd:
	assert_bt_pool BattleTowerPool_Legendary, BattleTowerPool_LegendaryEnd

BattleTowerPool_Uber:
	bt_mon MEWTWO, BERSERK_GENE, PSYBLAST, SERENITY, BARRIER, BIG_RECOVER
	bt_mon HO_OH, LEFTOVERS, SACRED_FIRE, FLY, EARTHQUAKE, SWORDS_DANCE
	bt_mon LUGIA, LEFTOVERS, AEROBLAST, EARTH_POWER, CALM_MIND, RECOVER
	bt_mon KYOGRE, LEFTOVERS, SURF, FREEZE_DRY, CALM_MIND, REST
	bt_mon GROUDON, LEFTOVERS, FLARE_BLITZ, EARTHQUAKE, STONE_EDGE, SWORDS_DANCE
	bt_mon RAYQUAZA, FOCUS_SASH, DRACO_ASCENT, EARTHQUAKE, DRAGON_DANCE, SWORDS_DANCE
	bt_mon PALKIA, LEFTOVERS, DRACO_METEOR, HYDRO_PUMP, THUNDERBOLT, CALM_MIND
	bt_mon DIALGA, LEFTOVERS, METEOR_MASH, EARTHQUAKE, THUNDER_WAVE, BULK_UP
	bt_mon GIRATINA, LEFTOVERS, SHADOW_FORCE, DRACO_METEOR, CALM_MIND, RECOVER
	bt_mon DARKRAI, LEFTOVERS, DARK_VOID, DARK_PULSE, AURA_SPHERE, ICE_BEAM
	bt_mon MEW, LEFTOVERS, PSYBLAST, WILL_O_WISP, CALM_MIND, RECOVER
BattleTowerPool_UberEnd:
	assert_bt_pool BattleTowerPool_Uber, BattleTowerPool_UberEnd

BattleTowerChallengePools:
; Novice
	db 1
	dba BattleTowerPool_EarlyEvolved
	db (BattleTowerPool_EarlyEvolvedEnd - BattleTowerPool_EarlyEvolved) / BATTLETOWER_MON_STRUCT_LENGTH

; Leader
	db 2
	dba BattleTowerPool_EarlyEvolved
	db (BattleTowerPool_EarlyEvolvedEnd - BattleTowerPool_EarlyEvolved) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_Evolved
	db (BattleTowerPool_EvolvedEnd - BattleTowerPool_Evolved) / BATTLETOWER_MON_STRUCT_LENGTH

; Elite
	db 3
	dba BattleTowerPool_EarlyEvolved
	db (BattleTowerPool_EarlyEvolvedEnd - BattleTowerPool_EarlyEvolved) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_Evolved
	db (BattleTowerPool_EvolvedEnd - BattleTowerPool_Evolved) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_PseudoLegendary
	db (BattleTowerPool_PseudoLegendaryEnd - BattleTowerPool_PseudoLegendary) / BATTLETOWER_MON_STRUCT_LENGTH

; Champ
	db 4
	dba BattleTowerPool_EarlyEvolved
	db (BattleTowerPool_EarlyEvolvedEnd - BattleTowerPool_EarlyEvolved) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_Evolved
	db (BattleTowerPool_EvolvedEnd - BattleTowerPool_Evolved) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_PseudoLegendary
	db (BattleTowerPool_PseudoLegendaryEnd - BattleTowerPool_PseudoLegendary) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_Legendary
	db (BattleTowerPool_LegendaryEnd - BattleTowerPool_Legendary) / BATTLETOWER_MON_STRUCT_LENGTH

; Master
	db 5
	dba BattleTowerPool_EarlyEvolved
	db (BattleTowerPool_EarlyEvolvedEnd - BattleTowerPool_EarlyEvolved) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_Evolved
	db (BattleTowerPool_EvolvedEnd - BattleTowerPool_Evolved) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_PseudoLegendary
	db (BattleTowerPool_PseudoLegendaryEnd - BattleTowerPool_PseudoLegendary) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_Legendary
	db (BattleTowerPool_LegendaryEnd - BattleTowerPool_Legendary) / BATTLETOWER_MON_STRUCT_LENGTH
	dba BattleTowerPool_Uber
	db (BattleTowerPool_UberEnd - BattleTowerPool_Uber) / BATTLETOWER_MON_STRUCT_LENGTH
BattleTowerChallengePoolsEnd:

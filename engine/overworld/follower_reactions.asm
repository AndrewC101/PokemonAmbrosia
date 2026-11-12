SECTION "Follower Reactions", ROMX

PrepareFollowerReaction::
    xor a
    ld [wScriptVar], a
    newfarcall GetPokemonFollowerObject
    ret nc
    newfarcall SelectPartyFollower
    ret nc
    ld a, [wFollowerPartyIndex]
    ld hl, wFollowerCandidateIndex
    cp [hl]
    ret nz
    ld a, TRUE
    ld [wScriptVar], a
    ret

DEF wFollowerReactionCondition EQUS "wStringBuffer3"
DEF wFollowerReactionTypes EQUS "(wStringBuffer3 + 1)"
DEF wFollowerReactionGotItem EQUS "(wStringBuffer3 + 3)"

DEF FOLLOWER_ITEM_CHANCE EQU 25 percent

DEF FOLLOWER_COND_ENV EQU $10
    const_def $20
    const FOLLOWER_COND_ICY_CAVE
    const FOLLOWER_COND_DARK_CAVE
    const FOLLOWER_COND_WOODS
    const FOLLOWER_COND_TOWER
    const FOLLOWER_COND_RUINS
    const FOLLOWER_COND_SEA
    const FOLLOWER_COND_POKECENTER
    const FOLLOWER_COND_GAME_CORNER
DEF FOLLOWER_COND_TIME EQU $30

MACRO follower_line
    dw \1
ENDM

MACRO follower_text_mon
    text_ram wStringBuffer1
    text \1
ENDM

PrintFollowerReaction::
    ld a, [wCurSpecies]
    push af
    ld a, [wFollowerPartyIndex]
    ld hl, wPartyMon1
    call GetPartyLocation
    push hl
    ld a, [hl]
    ld [wCurSpecies], a
    call GetBaseData
    ld a, [wBaseType1]
    ld [wFollowerReactionTypes], a
    ld a, [wBaseType2]
    ld [wFollowerReactionTypes + 1], a
    xor a
    ld [wFollowerReactionCondition], a
    ld [wFollowerReactionGotItem], a
    pop hl
    call FollowerDailyHappiness
    push hl
    call FollowerTryFindItem
    pop de
    jr c, .got_line
    ld h, d
    ld l, e
    call FollowerPickLine
.got_line
    ld a, [hli]
    ld h, [hl]
    ld l, a
    push hl
    ld a, [wFollowerPartyIndex]
    ld hl, wPartyMonNicknames
    call GetNickname
    pop hl
    pop af
    ld [wCurSpecies], a
    ld a, [wFollowerReactionGotItem]
    push af
    ld b, BANK(@)
    call MapTextbox
    pop af
    ld [wScriptVar], a
    ret

FollowerDailyHappiness:
    push hl
    ld hl, wSwarmFlags
    bit SWARMFLAGS_FOLLOWER_TALKED_F, [hl]
    jr nz, .done
    set SWARMFLAGS_FOLLOWER_TALKED_F, [hl]
    pop hl
    push hl
    ld bc, MON_HAPPINESS
    add hl, bc
    ld a, [hl]
    cp 255
    jr z, .done
    inc [hl]
.done
    pop hl
    ret

FollowerTryFindItem:
    ld hl, wSwarmFlags
    bit SWARMFLAGS_FOLLOWER_ITEM_F, [hl]
    jr nz, .none
    call Random
    cp FOLLOWER_ITEM_CHANCE
    jr nc, .none
    call Random
    ld hl, FollowerItems_Common
    cp 70 percent
    jr c, .pick
    ld hl, FollowerItems_Uncommon
    cp 95 percent
    jr c, .pick
    ld hl, FollowerItems_Rare
.pick
    ld a, [hli]
    call RandomRange
    ld c, a
    ld b, 0
    add hl, bc
    ld a, [hl]
    ld [wCurItem], a
    ld a, 1
    ld [wItemQuantityChange], a
    ld hl, wNumItems
    call ReceiveItem
    ld hl, FollowerLine_PackFull
    jr nc, .found
    ld hl, wSwarmFlags
    set SWARMFLAGS_FOLLOWER_ITEM_F, [hl]
    ld a, TRUE
    ld [wFollowerReactionGotItem], a
    ld a, [wCurItem]
    ld [wNamedObjectIndex], a
    call GetItemName
    ld hl, wStringBuffer4
    ld de, wStringBuffer1
    call CopyName2
    ld hl, FollowerLine_HoldingItem
.found
    scf
    ret
.none
    and a
    ret

FollowerItems_Common:
    db 8
    db BERRY, PSNCUREBERRY, PRZCUREBERRY, MINT_BERRY
    db BURNT_BERRY, ICE_BERRY, POTION, POKE_BALL

FollowerItems_Uncommon:
    db 9
    db GOLD_BERRY, MYSTERYBERRY, MIRACLEBERRY, SUPER_POTION, GREAT_BALL
    db ETHER, TINYMUSHROOM, PEARL, STARDUST

FollowerItems_Rare:
    db 5
    db NUGGET, STAR_PIECE, BIG_PEARL, RARE_CANDY, PP_MAX

FollowerLine_HoldingItem: follower_line FollowerText_HoldingItem
FollowerLine_PackFull: follower_line FollowerText_PackFull

FollowerText_HoldingItem:
    follower_text_mon " is"
    line "holding something!"
    prompt

FollowerText_PackFull:
    follower_text_mon " wanted"
    line "to give you an"
    cont "item, but your"
    cont "Pack is full."
    done

FollowerPickLine:
    ld d, h
    ld e, l
    ld hl, MON_STATUS
    add hl, de
    ld b, [hl]
    ld hl, FollowerLine_Sleep
    ld a, b
    and SLP
    ret nz
    ld hl, FollowerLine_Poison
    bit PSN, b
    ret nz
    ld hl, FollowerLine_Burn
    bit BRN, b
    ret nz
    ld hl, FollowerLine_Freeze
    bit FRZ, b
    ret nz
    ld hl, FollowerLine_Paralysis
    bit PAR, b
    ret nz

    ld hl, MON_HP
    add hl, de
    ld a, [hli]
    ld b, a
    ld a, [hli]
    ld c, a
    ld a, [hli]
    ld l, [hl]
    ld h, a
    sla c
    rl b
    jr c, .weather
    push bc
    sla c
    rl b
    jr c, .quarter_overflow
    ld a, c
    sub l
    ld a, b
    sbc h
    pop bc
    jr nc, .half
    ld hl, FollowerLine_Exhausted
    ret
.quarter_overflow
    pop bc
.half
    ld a, c
    sub l
    ld a, b
    sbc h
    jr nc, .weather
    call Random
    rrca
    jr nc, .weather
    ld hl, FollowerLine_WornOut
    ret

.weather
    ld a, [wFieldWeather]
    ld b, a
    ld hl, FollowerWeatherGroups
.weather_loop
    ld a, [hli]
    cp -1
    jr z, .roll
    cp b
    jr z, .weather_found
    inc hl
    inc hl
    jr .weather_loop
.weather_found
    ld a, b
    cp WEATHER_SUN
    jr nz, .weather_roll
    ld a, [wEnvironment]
    cp TOWN
    jr z, .weather_roll
    cp ROUTE
    jr nz, .roll
.weather_roll
    call Random
    rrca
    jr nc, .roll
    ld a, b
    ld [wFollowerReactionCondition], a
    ld a, [hli]
    ld h, [hl]
    ld l, a
    jp .GotGroup

.roll
    ld a, 3
    call RandomRange
    and a
    jr z, .place
    dec a
    jp z, .time
.happiness
    ld hl, MON_HAPPINESS
    add hl, de
    ld a, [hl]
    ld hl, FollowerLines_Happiness200
    cp 200
    jp nc, FollowerPickFromGroup
    ld hl, FollowerLines_Happiness150
    cp 150
    jp nc, FollowerPickFromGroup
    ld hl, FollowerLines_Happiness100
    cp 100
    jp nc, FollowerPickFromGroup
    ld hl, FollowerLines_Happiness50
    cp 50
    jp nc, FollowerPickFromGroup
    ld hl, FollowerLines_Happiness0
    jp FollowerPickFromGroup

.place
    ld a, [wEnvironment]
    dec a
    cp NUM_ENVIRONMENTS
    jr nc, .happiness
    ld a, [wEnvironment]
    cp INDOOR
    jr z, .theme
    cp ENVIRONMENT_5
    jr z, .theme
    cp GATE
    jr z, .theme
    call FollowerFindLandmarkGroup
    jr nc, .theme
    call .TwoInThree
    jp nz, FollowerPickFromGroup
.theme
    call FollowerFindThemeGroup
    jr nc, .env
    call .TwoInThree
    jr nz, .GotGroup
.env
    ld a, [wEnvironment]
    ld b, a
    dec a
    ld c, a
    ld a, b
    add FOLLOWER_COND_ENV
    ld [wFollowerReactionCondition], a
    ld a, c
    ld hl, FollowerPlaceGroups
    jr .PickFromGroupTable

.TwoInThree:
    ld a, 3
    call RandomRange
    and a
    ret

.time
    ld hl, FollowerTimeGroupsIndoors
    ld a, [wFieldWeather]
    and a
    jr nz, .got_time_table
    ld a, [wEnvironment]
    cp TOWN
    jr z, .outdoors
    cp ROUTE
    jr nz, .got_time_table
.outdoors
    ld hl, FollowerTimeGroupsOutdoors
.got_time_table
    ld a, [wTimeOfDay]
    cp NUM_DAYTIMES
    jp nc, .happiness
    ld b, a
    add FOLLOWER_COND_TIME
    ld [wFollowerReactionCondition], a
    ld a, b
.PickFromGroupTable:
    add a
    ld c, a
    ld b, 0
    add hl, bc
    ld a, [hli]
    ld h, [hl]
    ld l, a
    or h
    jp z, .happiness
.GotGroup:
    call Random
    rrca
    jr nc, FollowerPickFromGroup
    push hl
    call FollowerFindTypeLine
    pop de
    ret c
    ld h, d
    ld l, e

FollowerPickFromGroup:
    ld a, [hli]
    call RandomRange
    ld c, a
    ld b, 0
    add hl, bc
    add hl, bc
    ret

FollowerFindLandmarkGroup:
    ld a, [wMapGroup]
    ld b, a
    ld a, [wMapNumber]
    ld c, a
    call GetWorldMapLocation
    ld b, a
    ld hl, FollowerLandmarkGroups
.loop
    ld a, [hli]
    cp -1
    ret z
    cp b
    jr z, .found
    inc hl
    inc hl
    jr .loop

.found
    ld a, [hli]
    ld h, [hl]
    ld l, a
    scf
    ret

FollowerFindThemeGroup:
    ld a, [wMapTileset]
    ld b, a
    ld a, [wEnvironment]
    ld c, a
    ld hl, FollowerThemes
.loop
    ld a, [hli]
    cp -1
    jp z, FollowerFindCoastalGroup
    cp b
    jr nz, .next
    ld a, [hl]
    cp c
    jr z, .found
.next
    inc hl
    inc hl
    inc hl
    inc hl
    jr .loop

.found
    inc hl
    ld a, [hli]
    ld c, a
    ld a, [hli]
    ld b, a
    ld a, [hl]
    ld [wFollowerReactionCondition], a
    ld h, b
    ld l, c
    scf
    ret

FollowerFindTypeLine:
    ld a, [wFollowerReactionCondition]
    and a
    ret z
    ld b, a
    ld hl, FollowerTypeLines
.loop
    ld a, [hli]
    cp -1
    ret z
    cp b
    jr nz, .next
    ld a, [wFollowerReactionTypes]
    cp [hl]
    jr z, .found
    ld a, [wFollowerReactionTypes + 1]
    cp [hl]
    jr z, .found
.next
    inc hl
    inc hl
    inc hl
    jr .loop

.found
    inc hl
    scf
    ret

FollowerFindCoastalGroup:
    ld a, [wEnvironment]
    cp TOWN
    jr z, .outdoors
    cp ROUTE
    jr z, .outdoors
    and a
    ret
.outdoors
    ld a, [wMapGroup]
    ld b, a
    ld a, [wMapNumber]
    ld c, a
    call GetWorldMapLocation
    ld b, a
    ld hl, FollowerCoastalLandmarks
.loop
    ld a, [hli]
    cp -1
    ret z
    cp b
    jr nz, .loop
    ld a, FOLLOWER_COND_SEA
    ld [wFollowerReactionCondition], a
    ld hl, FollowerLines_Sea
    scf
    ret

FollowerCoastalLandmarks:
    db LANDMARK_CHERRYGROVE_BAY
    db LANDMARK_CAPE_STORM
    db LANDMARK_ROUTE_19, LANDMARK_ROUTE_20, LANDMARK_ROUTE_21
    db LANDMARK_ROUTE_40, LANDMARK_ROUTE_41
    db -1

FollowerLine_Poison:     follower_line FollowerText_Poison
FollowerLine_Burn:       follower_line FollowerText_Burn
FollowerLine_Paralysis:  follower_line FollowerText_Paralysis
FollowerLine_Sleep:      follower_line FollowerText_Sleep
FollowerLine_Freeze:     follower_line FollowerText_Freeze
FollowerLine_Exhausted:  follower_line FollowerText_Exhausted
FollowerLine_WornOut:    follower_line FollowerText_WornOut
FollowerWeatherGroups:
    dbw WEATHER_RAIN, FollowerLines_Rain
    dbw WEATHER_SUN, FollowerLines_Sun
    dbw WEATHER_SANDSTORM, FollowerLines_Sandstorm
    dbw WEATHER_HAIL, FollowerLines_Snow
    db -1

FollowerPlaceGroups:

    dw FollowerLines_Town
    dw FollowerLines_Route
    dw FollowerLines_Indoor
    dw FollowerLines_Cave
    dw FollowerLines_Indoor
    dw FollowerLines_Gate
    dw FollowerLines_Dungeon
    assert (@ - FollowerPlaceGroups) / 2 == NUM_ENVIRONMENTS

FollowerTimeGroupsOutdoors:

    dw FollowerLines_MorningOutdoors
    dw FollowerLines_Day
    dw FollowerLines_NightOutdoors
    dw FollowerLines_Evening

FollowerTimeGroupsIndoors:
    dw FollowerLines_Morning
    dw 0
    dw FollowerLines_Night
    dw 0

FollowerLines_Rain:
    db 2
    follower_line FollowerText_Rain1
    follower_line FollowerText_Rain2

FollowerLines_Snow:
    db 2
    follower_line FollowerText_Snow1
    follower_line FollowerText_Snow2

FollowerLines_Sandstorm:
    db 2
    follower_line FollowerText_Sandstorm1
    follower_line FollowerText_Sandstorm2

FollowerLines_Town:
    db 3
    follower_line FollowerText_Town1
    follower_line FollowerText_Town2
    follower_line FollowerText_Town3

FollowerLines_Route:
    db 3
    follower_line FollowerText_Route1
    follower_line FollowerText_Route2
    follower_line FollowerText_Route3

FollowerLines_Cave:
    db 3
    follower_line FollowerText_Cave1
    follower_line FollowerText_Cave2
    follower_line FollowerText_Cave3

FollowerLines_Indoor:
    db 2
    follower_line FollowerText_Indoor1
    follower_line FollowerText_Indoor2

FollowerLines_Gate:
    db 1
    follower_line FollowerText_Gate

FollowerLines_Dungeon:
    db 2
    follower_line FollowerText_Dungeon1
    follower_line FollowerText_Dungeon2

FollowerLines_Morning:
    db 1
    follower_line FollowerText_Morning1

FollowerLines_MorningOutdoors:
    db 2
    follower_line FollowerText_Morning1
    follower_line FollowerText_Morning2

FollowerLines_Day:
    db 1
    follower_line FollowerText_Day

FollowerLines_Evening:
    db 1
    follower_line FollowerText_Evening

FollowerLines_Night:
    db 1
    follower_line FollowerText_Night2

FollowerLines_NightOutdoors:
    db 2
    follower_line FollowerText_Night1
    follower_line FollowerText_Night2

FollowerLines_Happiness200:
    db 3
    follower_line FollowerText_Happiness200_1
    follower_line FollowerText_Happiness200_2
    follower_line FollowerText_Happiness200_3

FollowerLines_Happiness150:
    db 3
    follower_line FollowerText_Happiness150_1
    follower_line FollowerText_Happiness150_2
    follower_line FollowerText_Happiness150_3

FollowerLines_Happiness100:
    db 2
    follower_line FollowerText_Happiness100_1
    follower_line FollowerText_Happiness100_2

FollowerLines_Happiness50:
    db 2
    follower_line FollowerText_Happiness50_1
    follower_line FollowerText_Happiness50_2

FollowerLines_Happiness0:
    db 2
    follower_line FollowerText_Happiness0_1
    follower_line FollowerText_Happiness0_2

FollowerLandmarkGroups:

    dbw LANDMARK_LAKE_OF_RAGE, FollowerLines_LakeOfRage
    dbw LANDMARK_TIN_TOWER, FollowerLines_TinTower
    dbw LANDMARK_BURNED_TOWER, FollowerLines_BurnedTower
    dbw LANDMARK_SLOWPOKE_WELL, FollowerLines_SlowpokeWell
    dbw LANDMARK_DRAGONS_DEN, FollowerLines_DragonsDen
    dbw LANDMARK_WHIRL_ISLANDS, FollowerLines_WhirlIslands
    dbw LANDMARK_MT_MOON, FollowerLines_MtMoon
    dbw LANDMARK_SILVER_CAVE, FollowerLines_SilverCave
    dbw LANDMARK_NATIONAL_PARK, FollowerLines_NationalPark
    db -1

FollowerThemes:
    db TILESET_RUINS_OF_ALPH, INDOOR
    dw FollowerLines_Ruins
    db FOLLOWER_COND_RUINS
    db TILESET_TOWER, CAVE
    dw FollowerLines_Tower
    db FOLLOWER_COND_TOWER
    db TILESET_ICE_PATH, DUNGEON
    dw FollowerLines_IcyCave
    db FOLLOWER_COND_ICY_CAVE

    db TILESET_ICE_PATH, CAVE
    dw FollowerLines_IcyCave
    db FOLLOWER_COND_ICY_CAVE
    db TILESET_DARK_CAVE, CAVE
    dw FollowerLines_DarkCave
    db FOLLOWER_COND_DARK_CAVE
    db TILESET_FOREST, CAVE
    dw FollowerLines_Woods
    db FOLLOWER_COND_WOODS
    db TILESET_TOWER, DUNGEON
    dw FollowerLines_Tower
    db FOLLOWER_COND_TOWER
    db TILESET_RUINS_OF_ALPH, DUNGEON
    dw FollowerLines_Ruins
    db FOLLOWER_COND_RUINS
    db TILESET_POKECENTER, INDOOR
    dw FollowerLines_Pokecenter
    db FOLLOWER_COND_POKECENTER
    db TILESET_GAME_CORNER, INDOOR
    dw FollowerLines_GameCorner
    db FOLLOWER_COND_GAME_CORNER
    db -1

FollowerTypeLines:
    db WEATHER_SUN, FIRE
    follower_line FollowerText_DayFire
    db WEATHER_SUN, GRASS
    follower_line FollowerText_DayGrass

    db WEATHER_RAIN, FIRE
    follower_line FollowerText_RainFire
    db WEATHER_RAIN, WATER
    follower_line FollowerText_RainWater
    db WEATHER_RAIN, GRASS
    follower_line FollowerText_RainGrass
    db WEATHER_RAIN, ELECTRIC
    follower_line FollowerText_RainElectric
    db WEATHER_RAIN, STEEL
    follower_line FollowerText_RainSteel
    db WEATHER_HAIL, ICE
    follower_line FollowerText_SnowIce
    db WEATHER_HAIL, FIRE
    follower_line FollowerText_SnowFire
    db WEATHER_HAIL, GRASS
    follower_line FollowerText_SnowGrass
    db WEATHER_SANDSTORM, GROUND
    follower_line FollowerText_SandTough
    db WEATHER_SANDSTORM, ROCK
    follower_line FollowerText_SandTough
    db WEATHER_SANDSTORM, STEEL
    follower_line FollowerText_SandTough
    db WEATHER_SANDSTORM, WATER
    follower_line FollowerText_SandWater
    db FOLLOWER_COND_TIME + DAY_F, GRASS
    follower_line FollowerText_DayGrass
    db FOLLOWER_COND_TIME + DAY_F, FIRE
    follower_line FollowerText_DayFire
    db FOLLOWER_COND_TIME + NITE_F, GHOST
    follower_line FollowerText_NightGhost
    db FOLLOWER_COND_TIME + NITE_F, DARK
    follower_line FollowerText_NightDark
    db FOLLOWER_COND_TIME + NITE_F, FAIRY
    follower_line FollowerText_NightFairy
    db FOLLOWER_COND_TIME + NITE_F, BUG
    follower_line FollowerText_NightBug
    db FOLLOWER_COND_ENV + ROUTE, FLYING
    follower_line FollowerText_RouteFlying
    db FOLLOWER_COND_ENV + ROUTE, FIGHTING
    follower_line FollowerText_RouteFighting
    db FOLLOWER_COND_ENV + ROUTE, NORMAL
    follower_line FollowerText_RouteNormal
    db FOLLOWER_COND_ENV + ROUTE, DRAGON
    follower_line FollowerText_RouteDragon
    db FOLLOWER_COND_ENV + CAVE, ROCK
    follower_line FollowerText_CaveRock
    db FOLLOWER_COND_ENV + CAVE, GROUND
    follower_line FollowerText_CaveGround
    db FOLLOWER_COND_ENV + CAVE, FLYING
    follower_line FollowerText_CaveFlying
    db FOLLOWER_COND_ENV + CAVE, POISON
    follower_line FollowerText_CavePoison
    db FOLLOWER_COND_WOODS, BUG
    follower_line FollowerText_WoodsBug
    db FOLLOWER_COND_WOODS, GRASS
    follower_line FollowerText_WoodsGrass
    db FOLLOWER_COND_ICY_CAVE, ICE
    follower_line FollowerText_IcyIce
    db FOLLOWER_COND_ICY_CAVE, FIRE
    follower_line FollowerText_IcyFire
    db FOLLOWER_COND_SEA, WATER
    follower_line FollowerText_SeaWater
    db FOLLOWER_COND_TOWER, GHOST
    follower_line FollowerText_TowerGhost
    db FOLLOWER_COND_RUINS, PSYCHIC_TYPE
    follower_line FollowerText_RuinsPsychic
    db -1

FollowerLines_IcyCave:
    db 3
    follower_line FollowerText_IcyCave1
    follower_line FollowerText_IcyCave2
    follower_line FollowerText_IcyCave3

FollowerLines_DarkCave:
    db 2
    follower_line FollowerText_DarkCave1
    follower_line FollowerText_DarkCave2

FollowerLines_Woods:
    db 3
    follower_line FollowerText_Woods1
    follower_line FollowerText_Woods2
    follower_line FollowerText_Woods3

FollowerLines_Tower:
    db 2
    follower_line FollowerText_Tower1
    follower_line FollowerText_Tower2

FollowerLines_Ruins:
    db 2
    follower_line FollowerText_Ruins1
    follower_line FollowerText_Ruins2

FollowerLines_Sea:
    db 2
    follower_line FollowerText_Sea1
    follower_line FollowerText_Sea2

FollowerLines_Pokecenter:
    db 2
    follower_line FollowerText_Pokecenter1
    follower_line FollowerText_Pokecenter2

FollowerLines_GameCorner:
    db 2
    follower_line FollowerText_GameCorner1
    follower_line FollowerText_GameCorner2

FollowerLines_LakeOfRage:
    db 2
    follower_line FollowerText_LakeOfRage1
    follower_line FollowerText_LakeOfRage2

FollowerLines_TinTower:
    db 1
    follower_line FollowerText_TinTower1

FollowerLines_BurnedTower:
    db 2
    follower_line FollowerText_BurnedTower1
    follower_line FollowerText_BurnedTower2

FollowerLines_SlowpokeWell:
    db 1
    follower_line FollowerText_SlowpokeWell1

FollowerLines_DragonsDen:
    db 1
    follower_line FollowerText_DragonsDen1

FollowerLines_WhirlIslands:
    db 1
    follower_line FollowerText_WhirlIslands1

FollowerLines_MtMoon:
    db 2
    follower_line FollowerText_MtMoon1
    follower_line FollowerText_MtMoon2

FollowerLines_SilverCave:
    db 1
    follower_line FollowerText_SilverCave1

FollowerLines_NationalPark:
    db 1
    follower_line FollowerText_NationalPark1

FollowerText_Poison:
    follower_text_mon " is"
    line "shivering…"
    cont "It looks poisoned."
    done

FollowerText_Burn:
    follower_text_mon " is"
    line "wincing from its"
    cont "burn."
    done

FollowerText_Paralysis:
    follower_text_mon "'s body"
    line "is twitching. It's"
    cont "paralyzed!"
    done

FollowerText_Sleep:
    follower_text_mon " is"
    line "dozing off on its"
    cont "feet. Zzz…"
    done

FollowerText_Freeze:
    follower_text_mon " is"
    line "frozen stiff!"
    done

FollowerText_Exhausted:
    follower_text_mon " is"
    line "exhausted. It can"
    cont "barely stand…"
    done

FollowerText_WornOut:
    follower_text_mon " looks"
    line "a little worn out."
    done

FollowerText_Rain1:
    follower_text_mon " is"
    line "splashing in the"
    cont "puddles!"
    done

FollowerText_Rain2:
    follower_text_mon " shakes"
    line "the rain off its"
    cont "body."
    done

FollowerText_Snow1:
    follower_text_mon " is"
    line "trying to catch"
    cont "snowflakes!"
    done

FollowerText_Snow2:
    follower_text_mon " is"
    line "shivering in the"
    cont "cold."
    done

FollowerText_Sandstorm1:
    follower_text_mon " is"
    line "squinting through"
    cont "the sandstorm."
    done

FollowerText_Sandstorm2:
    text "Achoo! @"
    text_ram wStringBuffer1
    text_start
    line "sneezed from the"
    cont "sand!"
    done

FollowerText_Town1:
    follower_text_mon " is"
    line "looking at the"
    cont "houses."
    done

FollowerText_Town2:
    follower_text_mon " is"
    line "watching people"
    cont "go by."
    done

FollowerText_Town3:
    follower_text_mon " seems"
    line "to like this town."
    done

FollowerText_Route1:
    follower_text_mon " is"
    line "sniffing the"
    cont "grass."
    done

FollowerText_Route2:
    follower_text_mon " wants"
    line "to run around!"
    done

FollowerText_Route3:
    follower_text_mon " is"
    line "enjoying the fresh"
    cont "air."
    done

FollowerText_Cave1:
    follower_text_mon " is"
    line "peering into the"
    cont "darkness."
    done

FollowerText_Cave2:
    follower_text_mon " is"
    line "listening to the"
    cont "echoes."
    done

FollowerText_Cave3:
    follower_text_mon " jumped"
    line "at a falling drop"
    cont "of water!"
    done

FollowerText_Indoor1:
    follower_text_mon " is"
    line "looking around the"
    cont "room."
    done

FollowerText_Indoor2:
    follower_text_mon " seems"
    line "relaxed indoors."
    done

FollowerText_Gate:
    follower_text_mon " is"
    line "waiting patiently."
    done

FollowerText_Dungeon1:
    follower_text_mon " is"
    line "on its guard."
    done

FollowerText_Dungeon2:
    follower_text_mon " senses"
    line "something nearby…"
    done

FollowerText_Morning1:
    follower_text_mon " yawns."
    line "It's still early!"
    done

FollowerText_Morning2:
    follower_text_mon " is"
    line "stretching in the"
    cont "morning sun."
    done

FollowerText_Day:
    follower_text_mon " is"
    line "basking in the"
    cont "sunshine."
    done

FollowerText_Evening:
    follower_text_mon " is"
    line "watching the"
    cont "sunset."
    done

FollowerText_Night1:
    follower_text_mon " is"
    line "looking up at the"
    cont "stars."
    done

FollowerText_Night2:
    follower_text_mon " is"
    line "getting sleepy…"
    done

FollowerText_Happiness200_1:
    follower_text_mon " is"
    line "snuggling up to"
    cont "you!"
    done

FollowerText_Happiness200_2:
    follower_text_mon " gives"
    line "you a big smile!"
    done

FollowerText_Happiness200_3:
    follower_text_mon " is"
    line "happy to be with"
    cont "you!"
    done

FollowerText_Happiness150_1:
    follower_text_mon " is in"
    line "a good mood."
    done

FollowerText_Happiness150_2:
    follower_text_mon " is"
    line "humming happily."
    done

FollowerText_Happiness150_3:
    follower_text_mon " looks"
    line "at you cheerfully."
    done

FollowerText_Happiness100_1:
    follower_text_mon " is"
    line "looking at you."
    done

FollowerText_Happiness100_2:
    follower_text_mon " is"
    line "walking along with"
    cont "you."
    done

FollowerText_Happiness50_1:
    follower_text_mon " seems"
    line "a little distant…"
    done

FollowerText_Happiness50_2:
    follower_text_mon " looks"
    line "away from you."
    done

FollowerText_Happiness0_1:
    follower_text_mon " won't"
    line "look at you."
    done

FollowerText_Happiness0_2:
    follower_text_mon " is"
    line "ignoring you…"
    done

FollowerText_RainFire:
    follower_text_mon " is"
    line "hiding from the"
    cont "rain…"
    done

FollowerText_RainWater:
    follower_text_mon " is"
    line "dancing in the"
    cont "rain!"
    done

FollowerText_RainGrass:
    follower_text_mon " is"
    line "drinking in the"
    cont "rain."
    done

FollowerText_RainElectric:
    follower_text_mon "'s body"
    line "is crackling with"
    cont "static!"
    done

FollowerText_RainSteel:
    follower_text_mon " looks"
    line "worried about"
    cont "rusting…"
    done

FollowerText_SnowIce:
    follower_text_mon " is"
    line "loving the snow!"
    done

FollowerText_SnowFire:
    follower_text_mon " is"
    line "melting the"
    cont "snowflakes!"
    done

FollowerText_SnowGrass:
    follower_text_mon " is"
    line "wilting in the"
    cont "cold…"
    done

FollowerText_SandTough:
    follower_text_mon " isn't"
    line "bothered by the"
    cont "sand at all."
    done

FollowerText_SandWater:
    follower_text_mon " is"
    line "parched by the"
    cont "dry sand…"
    done

FollowerText_DayGrass:
    follower_text_mon " is"
    line "soaking up the"
    cont "sunlight!"
    done

FollowerText_DayFire:
    follower_text_mon " is"
    line "glowing in the"
    cont "warm sun!"
    done

FollowerText_NightGhost:
    follower_text_mon " is"
    line "grinning in the"
    cont "dark…"
    done

FollowerText_NightDark:
    follower_text_mon "'s eyes"
    line "are glinting in"
    cont "the dark."
    done

FollowerText_NightFairy:
    follower_text_mon " is"
    line "twinkling softly."
    done

FollowerText_NightBug:
    follower_text_mon " is"
    line "drawn to a nearby"
    cont "light."
    done

FollowerText_RouteFlying:
    follower_text_mon " wants"
    line "to fly up into the"
    cont "sky!"
    done

FollowerText_RouteFighting:
    follower_text_mon " is"
    line "practicing its"
    cont "punches!"
    done

FollowerText_RouteNormal:
    follower_text_mon " is"
    line "sniffing around"
    cont "curiously."
    done

FollowerText_RouteDragon:
    follower_text_mon " is"
    line "gazing proudly at"
    cont "the horizon."
    done

FollowerText_CaveRock:
    follower_text_mon " is"
    line "nibbling on a"
    cont "rock…"
    done

FollowerText_CaveGround:
    follower_text_mon " is"
    line "digging at the"
    cont "ground."
    done

FollowerText_CaveFlying:
    follower_text_mon " is"
    line "uneasy under the"
    cont "low ceiling."
    done

FollowerText_CavePoison:
    follower_text_mon " seems"
    line "to like the damp"
    cont "air."
    done

FollowerText_WoodsBug:
    follower_text_mon " is"
    line "buzzing around the"
    cont "leaves!"
    done

FollowerText_WoodsGrass:
    follower_text_mon " seems"
    line "at home among the"
    cont "trees."
    done

FollowerText_IcyIce:
    follower_text_mon " is"
    line "sliding happily on"
    cont "the ice!"
    done

FollowerText_IcyFire:
    follower_text_mon " is"
    line "warming up the"
    cont "chilly air."
    done

FollowerText_SeaWater:
    follower_text_mon " wants"
    line "to go for a swim!"
    done

FollowerText_TowerGhost:
    follower_text_mon " seems"
    line "to know this"
    cont "place…"
    done

FollowerText_RuinsPsychic:
    follower_text_mon " is"
    line "staring at the"
    cont "ancient walls…"
    done

FollowerText_IcyCave1:
    follower_text_mon " is"
    line "slipping on the"
    cont "ice!"
    done

FollowerText_IcyCave2:
    follower_text_mon " is"
    line "puffing little"
    cont "clouds of breath."
    done

FollowerText_IcyCave3:
    follower_text_mon " is"
    line "shivering in the"
    cont "chilly air."
    done

FollowerText_DarkCave1:
    follower_text_mon " is"
    line "staying close to"
    cont "you."
    done

FollowerText_DarkCave2:
    follower_text_mon " is"
    line "squinting in the"
    cont "darkness."
    done

FollowerText_Woods1:
    follower_text_mon " is"
    line "listening to the"
    cont "rustling leaves."
    done

FollowerText_Woods2:
    follower_text_mon " is"
    line "sniffing a"
    cont "mushroom."
    done

FollowerText_Woods3:
    follower_text_mon " is"
    line "watching the light"
    cont "through the trees."
    done

FollowerText_Tower1:
    follower_text_mon " is"
    line "looking up at the"
    cont "tall pillars."
    done

FollowerText_Tower2:
    follower_text_mon " is"
    line "tiptoeing on the"
    cont "creaky floor."
    done

FollowerText_Ruins1:
    follower_text_mon " is"
    line "staring at the"
    cont "strange carvings."
    done

FollowerText_Ruins2:
    follower_text_mon " is"
    line "listening to an"
    cont "echo… or a voice?"
    done

FollowerText_Sea1:
    follower_text_mon " is"
    line "enjoying the sea"
    cont "breeze."
    done

FollowerText_Sea2:
    follower_text_mon " is"
    line "watching the"
    cont "waves roll in."
    done

FollowerText_Pokecenter1:
    follower_text_mon " looks"
    line "relieved to be"
    cont "here."
    done

FollowerText_Pokecenter2:
    follower_text_mon " is"
    line "watching the"
    cont "healing machine."
    done

FollowerText_GameCorner1:
    follower_text_mon " is"
    line "dazzled by the"
    cont "flashing lights!"
    done

FollowerText_GameCorner2:
    follower_text_mon " is"
    line "covering its ears"
    cont "from the noise."
    done

FollowerText_LakeOfRage1:
    follower_text_mon " is"
    line "gazing at the"
    cont "huge lake."
    done

FollowerText_LakeOfRage2:
    follower_text_mon " senses"
    line "ripples moving"
    cont "across the water."
    done

FollowerText_TinTower1:
    follower_text_mon " is"
    line "looking up toward"
    cont "the rooftop."
    done

FollowerText_BurnedTower1:
    follower_text_mon " is"
    line "sniffing the old"
    cont "ashes."
    done

FollowerText_BurnedTower2:
    follower_text_mon " senses"
    line "the cool air"
    cont "rising from below."
    done

FollowerText_SlowpokeWell1:
    follower_text_mon " is"
    line "yawning, just like"
    cont "a Slowpoke."
    done

FollowerText_DragonsDen1:
    follower_text_mon " feels"
    line "a mighty power"
    cont "here."
    done

FollowerText_WhirlIslands1:
    follower_text_mon " is"
    line "listening to the"
    cont "roaring currents."
    done

FollowerText_MtMoon1:
    follower_text_mon " is"
    line "admiring the"
    cont "sparkling rocks."
    done

FollowerText_MtMoon2:
    follower_text_mon " heard"
    line "an echo from"
    cont "farther ahead."
    done

FollowerText_SilverCave1:
    follower_text_mon " feels"
    line "the cold air"
    cont "from deep inside."
    done

FollowerText_NationalPark1:
    follower_text_mon " is"
    line "rolling in the"
    cont "soft grass!"
    done

FollowerLines_Sun:
    db 2
    follower_line FollowerText_Sun1
    follower_line FollowerText_Sun2

FollowerText_Sun1:
    follower_text_mon " is"
    line "basking in the"
    cont "warm sunshine."
    done

FollowerText_Sun2:
    follower_text_mon " is"
    line "looking for a"
    cont "shady spot."
    done

ShowLinkBattleParticipants:
; If we're not in a communications room,
; we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	farcall _ShowLinkBattleParticipants
	ld c, 150
	call DelayFrames
	call ClearTilemap
	call ClearSprites
	ret

FindFirstAliveMonAndStartBattle:
; DevNote - Battle Palette decided here
	ld a, [wOtherTrainerID]
	cp FIELD_MON
	jr z, .skipRPG
    ld a, [wOtherTrainerClass]
    cp ROLE_PLAYER_NORMAL
    jr z, .daypal
    cp ROLE_PLAYER_SHINY
    jr z, .daypal
.skipRPG
    ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
    call GetWorldMapLocation
	cp LANDMARK_HALL_OF_ORIGIN
    jr z, .daypal
    cp LANDMARK_ANCIENT_RUIN
    jr nz, .checkEnv
    call GetMapEnvironment
    cp ROUTE
    jr z, .daypal

.checkEnv
    call GetMapEnvironment
    cp CAVE
    jr z, .nightpal
    cp INDOOR
    jr z, .daypal
    cp DUNGEON
    jr z, .daypal
    ld a, [wTimeOfDay]
	cp NITE_F
    jr z, .nightpal
.daypal
    ld a, 0
	ld [wBattleTimeOfDay], a
    jr .timeofdaypalset
.nightpal
    ld a, 1
	ld [wBattleTimeOfDay], a
.timeofdaypalset

	xor a
	ldh [hMapAnims], a
	call DelayFrame

	predef DoBattleTransition
	farcall _LoadBattleFontsHPBar
	ld a, 1
	ldh [hBGMapMode], a
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	ldh [hWY], a
	ldh [rWY], a
	ldh [hMapAnims], a
	ret

; DevNote - battle music stuff here
PlayBattleMusic:
	push hl
	push de
	push bc

; some maps have thier music play even during wild battles (map override)
; is the trainer class 0, if so check for map override
	ld a, [wOtherTrainerClass]
	and a
	jr z, .checkLocation

; trainer class is not 0, is trainer id a field mon, if not then skip map override
	ld a, [wOtherTrainerID]
	cp FIELD_MON
	jr nz, .fade

.checkLocation
    ld a, [wMapGroup]
	ld b, a
	ld a, [wMapNumber]
	ld c, a
    call GetWorldMapLocation
	cp LANDMARK_HALL_OF_ORIGIN
	jp z, .skip
	cp LANDMARK_SILVER_CAVE
	jp z, .skip
	cp LANDMARK_ANCIENT_RUIN
	jp z, .skip
	cp LANDMARK_MUSEUM
	jp z, .skip
	cp LANDMARK_ABYSS
	jp z, .skip

.fade
    ; fade out current music
	xor a
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	; Are we fighting a trainer? - this includes field mon
	ld a, [wOtherTrainerClass]
	and a
	jp nz, .trainermusic

; music for ubers
	ld a, [wTempWildMonSpecies]
	cp ARCEUS
	jr z, .arceus
	cp MEWTWO
	jr z, .mewtwo
	cp LUGIA
	jr z, .lugia
	cp HO_OH
	jr z, .hooh
	cp ZYGARDE
	jr z, .lugia
	cp KYOGRE
	jr z, .hoen
	cp GROUDON
	jr z, .hoen
	cp RAYQUAZA
	jr z, .hoen
	cp GIRATINA
	jr z, .mega
	cp PALKIA
	jr z, .creation
	cp DIALGA
	jr z, .creation
	cp XERNEAS
	jr z, .life
	cp YVELTAL
	jr z, .life
	cp REGIGIGAS
	jr z, .life
    jr .notUber

.arceus
    ld de, MUSIC_EPIC_TETRIS
    jp .done

.mewtwo
    ld de, MUSIC_FINAL_BATTLE
    jp .done

.lugia
    ld de, MUSIC_LUGIA_SONG
    jp .done

.hooh
    ld de, MUSIC_HO_OH_BATTLE
    jp .done

.hoen
    ld de, MUSIC_HOEN_CHAMPION
    jp .done

.creation
    ld de, MUSIC_ZINNIA_BATTLE
    jp .done

.mega
    ld de, MUSIC_MEGALOVANIA
    jp .done

.life
    ld de, MUSIC_ELITE_FOUR_PRISM
    jp .done

.notUber
    ; is this suicune battle
	ld a, [wBattleType]
	cp BATTLETYPE_SUICUNE
	ld de, MUSIC_SUICUNE_BATTLE
	jp z, .done

    ; is this kanto
	farcall RegionCheck
	ld a, e
	and a
	jr nz, .kantowild

    ; play johto music, depending on time of day
	ld de, MUSIC_JOHTO_WILD_BATTLE
	ld a, [wTimeOfDay]
	cp NITE_F
	jp c, .done
	ld de, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	jp .done

; play kanto music
.kantowild
	ld de, MUSIC_KANTO_WILD_BATTLE
	jp .done

.trainermusic
	; aggressive wild mon
	ld de, MUSIC_RIVAL_BATTLE
	ld a, [wOtherTrainerID]
	cp FIELD_MON
	jp z, .done

	ld a, [wBattleMusicOverride]
	and a
	jr nz, .useOverride
	ld a, [wBattleMusicOverride + 1]
	and a
	jr nz, .useOverride
	jr .noOverride
.useOverride
	ld a, [wBattleMusicOverride + 1]
	ld d, a
	ld a, [wBattleMusicOverride]
	ld e, a
	jp .done

.noOverride
; set BattleTower Music
    ld a, [wInBattleTowerBattle]
    and a
    jr z, .notBT
    ld a, [wNrOfBeatenBattleTowerTrainers]
    cp BATTLETOWER_STREAK_LENGTH - 1
    jr z, .lastTrainer
    ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
    jp .done
.lastTrainer
    ld de, MUSIC_XVZ
    jp .done
.notBT

; set music based on enemy trainer class
    ld a, [wOtherTrainerClass]

    ld de, MUSIC_EPIC_TETRIS
    cp LORD_OAK
    jp z, .done
    cp ADAM
    jp z, .done
    cp JONATHAN
    jp z, .done

    ; champion music
	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION
	jp z, .done

	ld de, MUSIC_CHAMPION_DPPT
	cp CYNTHIA
	jp z, .done

	ld de, MUSIC_ZINNIA_BATTLE
	cp RED
	jp z, .done
	cp LEON
	jp z, .done

	ld de, MUSIC_HOEN_CHAMPION
	cp WALLACE
	jp z, .done
	cp STEVEN
	jp z, .done

	ld de, MUSIC_FINAL_BATTLE
	cp BLUE
	jp z, .done
	cp LEAF
	jp z, .done
	cp POKEMON_PROF
	jp z, .done

	; They should have included EXECUTIVEM, EXECUTIVEF, and SCIENTIST too...
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jp z, .done
	cp GRUNTF
	jp z, .done
	cp SCIENTIST
	jp z, .done

	ld de, MUSIC_XVZ
	cp INVADER
	jp z, .done
	cp CAL
	jp z, .done
	cp CAL_F
	jp z, .done

	ld de, MUSIC_HOEN_GRUNT
	cp SOLDIER
	jp z, .done
	cp EXECUTIVEM
	jp z, .done
	cp EXECUTIVEF
	jp z, .done

	ld de, MUSIC_GUILE_THEME
	cp CHUCK
	jp z, .done
	cp LT_SURGE
	jr z, .done
	cp DAD
	jr z, .done

	ld de, MUSIC_ELITE_FOUR_PRISM
	cp SABRINA
	jr z, .done
	cp BRUNO
	jr z, .done
	cp KAREN
	jr z, .done

	ld de, MUSIC_MEGALOVANIA
	cp GIOVANNI
	jr z, .done
	cp ASH
	jr z, .done

	ld de, MUSIC_SUICUNE_BATTLE
	cp MYSTICALMAN
	jr z, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	farcall IsKantoGymLeader
	jr c, .done

	; IsGymLeader also counts CHAMPION, RED, and the Kanto gym leaders
	; but they have been taken care of before this
	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	farcall IsGymLeader
	jr c, .done

	ld de, MUSIC_RIVAL_BATTLE
	ld a, [wOtherTrainerClass]
	cp RIVAL1
	jr z, .done
	cp RIVAL2
	jr nz, .checkCrystal

	ld a, [wOtherTrainerID]
	cp RIVAL2_SILVER_CAVE ; Rival in Silver Cave
	jr c, .done
	ld de, MUSIC_HO_OH_BATTLE
	jr .done

.checkCrystal
	cp CRYSTAL
	jr nz, .othertrainer
	ld a, [wOtherTrainerID]
	cp CRYSTAL_7
	jr c, .done
	ld de, MUSIC_CHAMPION_DPPT
	jr .done

.othertrainer
	ld a, [wLinkMode]
	and a
	jr nz, .johtotrainer

	farcall RegionCheck
	ld a, e
	and a
	jr nz, .kantotrainer

.johtotrainer
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	jr .done

.kantotrainer
	ld de, MUSIC_KANTO_TRAINER_BATTLE

.done
    xor a
    ld [wBattleMusicOverride], a
    ld [wBattleMusicOverride + 1], a
	call PlayMusic

.skip
	pop bc
	pop de
	pop hl
	ret

ClearBattleRAM:
	xor a
	ld [wBattlePlayerAction], a
	ld [wBattleResult], a

	ld hl, wPartyMenuCursor
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a

	ld [wMenuScrollPosition], a
	ld [wCriticalHit], a
	ld [wBattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [wCurBattleMon], a
	ld [wForcedSwitch], a
	ld [wTimeOfDayPal], a
	ld [wPlayerTurnsTaken], a
	ld [wEnemyTurnsTaken], a
	ld [wEvolvableFlags], a

	ld hl, wPlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, wBattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	callfar ResetEnemyStatLevels

	call ClearWindowData

	ld hl, hBGMapAddress
	xor a ; LOW(vBGMap0)
	ld [hli], a
	ld [hl], HIGH(vBGMap0)
	ret

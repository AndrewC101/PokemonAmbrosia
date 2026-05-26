String_current_area_text:
	db "Current    @"

String_current_grass_text:
	db " Walking @"

String_current_surf_text:
	db " Surfing @"

String_current_area_none_text:
	db " Nothing @"

String_lv_text:
	db "Lv@"

Pokedex_DetailedArea_current:
; Page 0 shows the first available encounter method, and page 1 shows surf
; only if both grass and surf are present on the current map.
	call DexCurrentArea_GetSectionFlags
	ld b, a
	ld a, [wPokedexEntryPageNum]
	and a
	jr nz, .page_two

	bit 0, b
	jr z, .surf_only
	push bc
	call DexCurrentArea_PrintGrassPage
	pop bc
	bit 1, b
	jr z, .done
	call DexEntry_IncPageNum
	ret

.surf_only
	bit 1, b
	jr z, .no_sections
	call DexCurrentArea_PrintSurfPage
	jr .done

.page_two
	bit 0, b
	jr z, .no_sections
	bit 1, b
	jr z, .no_sections
	call DexCurrentArea_PrintSurfPage
	jr .done

.no_sections
	ld de, String_current_area_text
	ld hl, String_current_area_none_text
	call Print_Category_text

.done
	call DexCurrentArea_AdvanceToSpeciesAreas
	xor a
	ret

DexCurrentArea_GetSectionFlags:
; bit 0 = grass, bit 1 = surf
	xor a
	push af
	call DexCurrentArea_GetGrassPointer
	pop bc
	ld a, b
	jr nc, .no_grass
	or 1
.no_grass
	push af
	call DexCurrentArea_GetSurfPointer
	pop bc
	ld a, b
	jr nc, .no_surf
	or 2
.no_surf
	ret

DexCurrentArea_AdvanceToSpeciesAreas:
; After the current-area page, resume the normal species-area rotation.
	call Dex_FindFirstList
	call DexEntry_NextCategory
	ret

DexCurrentArea_PrintGrassPage:
	ld de, String_current_area_text
	ld hl, String_current_grass_text
	call Print_Category_text
	call DexCurrentArea_GetGrassPointer
	jr c, .got_pointer
	ld de, String_current_area_text
	ld hl, String_current_area_none_text
	call Print_Category_text
	ret

.got_pointer
	ld bc, 5
	add hl, bc
	call DexCurrentArea_GetGrassTimeOfDayIndex
	and a
	jr z, .time_offset_done
	cp 1
	ld bc, NUM_GRASSMON * AREA_ENTRY_SIZE_BYTES
	jr z, .apply_time_offset
	ld bc, NUM_GRASSMON * AREA_ENTRY_SIZE_BYTES * 2
.apply_time_offset
	add hl, bc

.time_offset_done
	ld b, NUM_GRASSMON
	ld c, 0
.loop
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld d, a
	inc hl
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte
	ld e, a
	inc hl
	push hl
	push bc
	call DexCurrentArea_PrintEncounterRow
	pop bc
	pop hl
	inc c
	dec b
	jr nz, .loop
	ret

DexCurrentArea_PrintSurfPage:
	ld de, String_current_area_text
	ld hl, String_current_surf_text
	call Print_Category_text
	call DexCurrentArea_GetSurfPointer
	jr c, .got_pointer
	ld de, String_current_area_text
	ld hl, String_current_area_none_text
	call Print_Category_text
	ret

.got_pointer
	ld bc, 3
	add hl, bc
	ld b, NUM_WATERMON
	ld c, 0
.loop
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte
	ld d, a
	inc hl
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte
	ld e, a
	inc hl
	push hl
	push bc
	call DexCurrentArea_PrintEncounterRow
	pop bc
	pop hl
	inc c
	dec b
	jr nz, .loop
	ret

DexCurrentArea_PrintEncounterRow:
; d = level, e = species, c = row offset
	push bc
	push de

	ld a, e
	ld [wNamedObjectIndex], a
	call GetPokemonName
	hlcoord 2, 9
	call DexEntry_adjusthlcoord
	ld de, wStringBuffer1
	call PlaceString

	hlcoord 14, 9
	call DexEntry_adjusthlcoord
	ld de, String_lv_text
	call PlaceString

	ld a, d
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	hlcoord 17, 9
	call DexEntry_adjusthlcoord
	lb bc, 1, 3
	call PrintNum

	pop de
	pop bc
	ret

DexCurrentArea_GetGrassTimeOfDayIndex:
	ld a, [wTimeOfDay]
	cp EVE_F
	ret nz
	ld a, DAY_F
	ret

DexCurrentArea_GetGrassPointer:
; Match the live encounter precedence: active swarm first, then Johto/Kanto.
	call DexCurrentArea_CheckGrassSwarm
	ret c

	call IsInJohto
	and a
	ld hl, KantoGrassWildMons
	jr nz, .table_ready
	ld hl, JohtoGrassWildMons

.table_ready
	call DexCurrentArea_CopyCurrMapDE
	jp DexCurrentArea_LookUpGrassWildmonsForMapDE

DexCurrentArea_GetSurfPointer:
	call DexCurrentArea_CheckWaterSwarm
	ret c

	call IsInJohto
	and a
	ld hl, KantoWaterWildMons
	jr nz, .table_ready
	ld hl, JohtoWaterWildMons

.table_ready
	call DexCurrentArea_CopyCurrMapDE
	jp DexCurrentArea_LookUpWaterWildmonsForMapDE

DexCurrentArea_CheckGrassSwarm:
	ld hl, SwarmGrassWildMons
	call DexCurrentArea_CopyCurrMapDE
	push hl
	ld hl, wSwarmFlags
	bit SWARMFLAGS_DUNSPARCE_SWARM_F, [hl]
	pop hl
	jr z, .check_yanma
	ld a, [wDunsparceMapGroup]
	cp d
	jr nz, .check_yanma
	ld a, [wDunsparceMapNumber]
	cp e
	jr nz, .check_yanma
	jp DexCurrentArea_LookUpGrassWildmonsForMapDE

.check_yanma
	push hl
	ld hl, wSwarmFlags
	bit SWARMFLAGS_YANMA_SWARM_F, [hl]
	pop hl
	jr z, .not_found
	ld a, [wYanmaMapGroup]
	cp d
	jr nz, .not_found
	ld a, [wYanmaMapNumber]
	cp e
	jr nz, .not_found
	jp DexCurrentArea_LookUpGrassWildmonsForMapDE

.not_found
	and a
	ret

DexCurrentArea_CheckWaterSwarm:
	ld hl, SwarmWaterWildMons
	call DexCurrentArea_CopyCurrMapDE
	push hl
	ld hl, wSwarmFlags
	bit SWARMFLAGS_DUNSPARCE_SWARM_F, [hl]
	pop hl
	jr z, .check_yanma
	ld a, [wDunsparceMapGroup]
	cp d
	jr nz, .check_yanma
	ld a, [wDunsparceMapNumber]
	cp e
	jr nz, .check_yanma
	jp DexCurrentArea_LookUpWaterWildmonsForMapDE

.check_yanma
	push hl
	ld hl, wSwarmFlags
	bit SWARMFLAGS_YANMA_SWARM_F, [hl]
	pop hl
	jr z, .not_found
	ld a, [wYanmaMapGroup]
	cp d
	jr nz, .not_found
	ld a, [wYanmaMapNumber]
	cp e
	jr nz, .not_found
	jp DexCurrentArea_LookUpWaterWildmonsForMapDE

.not_found
	and a
	ret

DexCurrentArea_CopyCurrMapDE:
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a
	ret

DexCurrentArea_LookUpGrassWildmonsForMapDE:
	ld bc, GRASS_WILDDATA_LENGTH

.loop
	push hl
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte ; map group
	inc a
	jr z, .no_match
	dec a
	cp d
	jr nz, .next
	inc hl
	ld a, BANK(JohtoGrassWildMons)
	call GetFarByte ; map number
	cp e
	jr z, .found
	jr .next

.next
	pop hl
	add hl, bc
	jr .loop

.no_match
	pop hl
	and a
	ret

.found
	pop hl
	scf
	ret

DexCurrentArea_LookUpWaterWildmonsForMapDE:
	ld bc, WATER_WILDDATA_LENGTH

.loop
	push hl
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte ; map group
	inc a
	jr z, .no_match
	dec a
	cp d
	jr nz, .next
	inc hl
	ld a, BANK(JohtoWaterWildMons)
	call GetFarByte ; map number
	cp e
	jr z, .found

.next
	pop hl
	add hl, bc
	jr .loop

.no_match
	pop hl
	and a
	ret

.found
	pop hl
	scf
	ret

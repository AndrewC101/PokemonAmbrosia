; Phase 1 graphics backend. No party selection or follow-pair ownership here.
SECTION "Follower graphics", ROMX, BANK[$79]

ResetFollowerState::
; Transient only: New Game/Continue must not inherit an old fixture or request.
if !DEF(FOLLOWER_TEST)
    call ResetFollowerLifecycle
endc
    ld hl, wFollowerState
    ld bc, wFollowerStateEnd - wFollowerState
    xor a
    call ByteFill
    jp InvalidateFollowerCache

PrepareFollowerGraphics::
; a = native species. Carry = valid species prepared. No turn-time decompression.
    and a
    ret z
    cp NUM_POKEMON + 1
    ret nc
    ld [wFollowerSpecies], a
    push af
    ld hl, wFollowerFlags
    res FOLLOWER_READY_F, [hl]
    call InvalidateFollowerCache
    pop af
    dec a
    ld l, a
    ld h, 0
    add hl, hl
    add hl, hl
    ld de, FollowerSpritePointers
    add hl, de
    ld a, [hli]
    ld b, a
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ldh a, [rWBK]
    push af
    ld a, BANK(wFollowerFrames)
    ldh [rWBK], a
    ld a, b
    ld bc, FOLLOWER_GFX_SIZE
    ld de, wFollowerFrames
    call FarCopyBytes
    pop af
    ldh [rWBK], a
    ld hl, wFollowerFlags
    set FOLLOWER_READY_F, [hl]
    scf
    ret

InvalidateFollowerCache::
; A graphics reload/menu may have overwritten the cache. Keep prepared art.
    xor a
    ld [wFollowerPending], a
    dec a
    ld [wFollowerCachedPair], a
    ld [wFollowerOAMStart], a
    ret

BeginFollowerOAMFrame::
; Called with hOAMUpdate locked. Only this complete shadow-OAM frame may publish.
    xor a
    ld [wFollowerPending], a
    dec a
    ld [wFollowerOAMStart], a
    ret

LoadFollowerOverworldPalette::
; LoadMapPals hook; do not undo unlit-cave colors or global map fades.
    ld a, [wFollowerFlags]
    and (1 << FOLLOWER_ENABLED_F) | (1 << FOLLOWER_READY_F)
    cp (1 << FOLLOWER_ENABLED_F) | (1 << FOLLOWER_READY_F)
    ret nz
    call GetMapTimeOfDay
    bit IN_DARKNESS_F, a
    jr z, .copy
    ld a, [wStatusFlags]
    bit STATUSFLAGS_FLASH_F, a
    ret z
.copy
    ld hl, wFollowerMiddleColors
    ld de, wOBPals1 palette PAL_OW_FOLLOWER color 1
    ld bc, 2 colors
    ld a, BANK(wOBPals1)
    jp FarCopyWRAM

PrepareFollowerColors::
; wFollowerSpecies/DVs/custom pair -> four unbanked middle-color bytes.
    ld a, [wFollowerCustomPair]
    ld l, a
    ld a, [wFollowerSpecies]
    ld bc, wFollowerDVs
    ld de, wFollowerMiddleColors
    newfarcall CopyMonNormalShinyOrCustomMiddleColors
    ; Temporary follower-wide ordering: swap the two 16-bit colors, keeping
    ; each color's low/high bytes intact. Rebuild from the source on every call
    ; so repeated refreshes never toggle the order. A shared species policy for
    ; follower/menu-icon artwork will replace this blanket swap after review.
    ld hl, wFollowerMiddleColors
    ld a, [hli]
    ld b, [hl]
    inc hl
    ld c, [hl]
    ld [hli], a
    ld a, [hl]
    ld [hl], b
    ld hl, wFollowerMiddleColors
    ld [hl], c
    inc hl
    ld [hl], a
    jp LoadFollowerOverworldPalette

RenderFollowerObject::
; bc = ordinary object struct. Dedicated addressing, no ordinary $80 step offset.
    call FollowerObjectPixels
    ld hl, OBJECT_FACING
    add hl, bc
    ld a, [hl]
    jp RenderFollowerAtPixels

FollowerObjectPixels:
    ld hl, OBJECT_FLAGS2
    add hl, bc
    ld a, [hl]
    and OBJ_FLAGS2_7 | USE_OBP1 | OVERHEAD
    ld [wFollowerBaseFlags], a
    ld hl, OBJECT_SPRITE_X
    add hl, bc
    ld a, [hl]
    ld hl, OBJECT_SPRITE_X_OFFSET
    add hl, bc
    add [hl]
    add 8
    ld d, a
    ld a, [wPlayerBGMapOffsetX]
    add d
    ld [wFollowerRenderX], a
    ld hl, OBJECT_SPRITE_Y
    add hl, bc
    ld a, [hl]
    ld hl, OBJECT_SPRITE_Y_OFFSET
    add hl, bc
    add [hl]
    add 12
    ld d, a
    ld a, [wPlayerBGMapOffsetY]
    add d
    ld [wFollowerRenderY], a
    ret

RenderFollowerAtPixels::
; a = facing 0..15, coordinates in wFollowerRenderX/Y, hOAMUpdate must be locked.
    cp FACING_FISH_DOWN
    ret nc
    ld [wFollowerWantedFacing], a
    ld a, [wFollowerFlags]
    and (1 << FOLLOWER_ENABLED_F) | (1 << FOLLOWER_READY_F) | (1 << FOLLOWER_NO_CAPACITY_F)
    cp (1 << FOLLOWER_ENABLED_F) | (1 << FOLLOWER_READY_F)
    ret nz
    ldh a, [hUsedSpriteIndex]
    cp OAM_SIZE - 4 * OBJ_SIZE + 1
    ret nc
    ld [wFollowerOAMStart], a
    ld c, a
    ld b, HIGH(wShadowOAM)
    add 4 * OBJ_SIZE
    ldh [hUsedSpriteIndex], a

    ld a, [wFollowerWantedFacing]
    call FollowerFacingPair
    ld d, a
    ld a, [wFollowerCachedPair]
    cp d
    jr z, .resident
    ld a, d
    ld [wFollowerPendingPair], a
    ; Until the atomic upload/patch completes, retain a coherent old facing.
    ld a, [wFollowerShownFacing]
    call .draw
    ; Prepare the replacement outside VBlank. Publish only when all 16 bytes exist.
    ldh a, [rWBK]
    push af
    ld a, BANK(wFollowerNextOAM)
    ldh [rWBK], a
    ld bc, wFollowerNextOAM
    ld a, [wFollowerWantedFacing]
    call FollowerFacingTiles
    call .pieces
    pop af
    ldh [rWBK], a
    ld a, 1
    ld [wFollowerPending], a
    ret
.resident
    ld a, [wFollowerWantedFacing]
    ld [wFollowerShownFacing], a
.draw
    call FollowerFacingTiles
    ld a, [wFollowerRenderY]
    push af
    ld a, [wFollowerCachedPair]
    cp 3
    jr c, .valid_cache
    ld a, OAM_YCOORD_HIDDEN
    ld [wFollowerRenderY], a
.valid_cache
    call .pieces
    pop af
    ld [wFollowerRenderY], a
    ret
.pieces
    ld a, [wFollowerRenderY]
    ld [bc], a
    inc c
    ld a, [wFollowerRenderX]
    ld [bc], a
    inc c
    ld e, 0
    call .top_tiles
    ld a, [wFollowerRenderY]
    ld [bc], a
    inc c
    ld a, [wFollowerRenderX]
    add 8
    ld [bc], a
    inc c
    ld e, 0
    call .top_tiles
    ld a, [wFollowerRenderY]
    add 8
    ld [bc], a
    inc c
    ld a, [wFollowerRenderX]
    ld [bc], a
    inc c
    call .bottom_tiles
    ld a, [wFollowerRenderY]
    add 8
    ld [bc], a
    inc c
    ld a, [wFollowerRenderX]
    add 8
    ld [bc], a
    inc c
    call .bottom_tiles
    ret
.top_tiles
    ; Piece order is top-left, top-right, bottom-left, bottom-right.
    ld a, [wFollowerRenderFlags]
    and OAM_XFLIP
    jr z, .normal
    ld a, [wFollowerRenderTile]
    xor 1
    jr .tile
.normal
    ld a, [wFollowerRenderTile]
.tile
    ld [bc], a
    inc c
    ld a, [wFollowerRenderFlags]
    or e
    ld [bc], a
    inc c
    ld hl, wFollowerRenderTile
    inc [hl]
    ret
.bottom_tiles
    ld e, 0
    ld a, [wFollowerBaseFlags]
    bit OVERHEAD_F, a
    jr z, .top_tiles
    ld e, OAM_PRIO
    jr .top_tiles

FollowerFacingPair:
    srl a
    srl a
    cp 3
    ret nz
    dec a ; left/right share one pair
    ret

FollowerFacingTiles:
; a = shown/wanted facing. Preserve bc. Build tile and OAM-attribute bytes.
    ld e, a
    and 1
    add a
    add a
    add FOLLOWER_CACHE_TILE
    ld [wFollowerRenderTile], a
    ld a, e
    and $c
    cp $c
    jr z, .flip
    cp $8
    jr z, .normal
    ld a, e
    and 3
    cp 3
    jr z, .flip ; Crystal's alternate down/up step mirrors the same frame
.normal
    ld a, OAM_BANK1 | PAL_OW_FOLLOWER
    jr .done
.flip
    ld a, OAM_BANK1 | OAM_XFLIP | PAL_OW_FOLLOWER
.done
    ld d, a
    ld a, [wFollowerBaseFlags]
    and OAM_PRIO | OAM_PAL1
    or d
    ld [wFollowerRenderFlags], a
    ret

ServeFollowerGraphics::
; VBlank-only entry, called through a ROM0 bank switch (not reentrant farcall).
; Never wait for a frame or overwrite another subsystem's queued DMA registers.
    ld a, [wFollowerPending]
    and a
    ret z
    ldh a, [hOAMUpdate]
    and a
    ret nz
    ldh a, [hDMATransfer]
    and a
    jp nz, .defer
    ; Existing graphics work keeps its original deadline and priority.
    ldh a, [hBGMapUpdate]
    and a
    jp nz, .defer
    ld a, [wRequested2bppSize]
    and a
    jp nz, .defer
    ld a, [wRequested1bppSize]
    and a
    jp nz, .defer
    ldh a, [rLY]
    cp LY_VBLANK
    jp c, .defer
    ; Leave six complete scanlines, even if the current scanline is almost over.
    cp LY_VBLANK + 4
    jp nc, .defer
    ldh a, [hCGB]
    and a
    ret z
    ldh a, [rVBK]
    push af
    ldh a, [rWBK]
    push af
    ld a, BANK(wFollowerFrames)
    ldh [rWBK], a
    ld a, BANK(vTiles3)
    ldh [rVBK], a
    ld a, [wFollowerPendingPair]
    ld h, HIGH(wFollowerFrames)
    and a
    jr z, .first
    dec a
    ld a, $80
    jr z, .source
    inc h
.first
    xor a
.source
    ldh [rVDMA_SRC_LOW], a
    ld a, h
    ldh [rVDMA_SRC_HIGH], a
    ld a, HIGH(vTiles0 tile FOLLOWER_CACHE_TILE)
    ldh [rVDMA_DEST_HIGH], a
    ld a, LOW(vTiles0 tile FOLLOWER_CACHE_TILE)
    ldh [rVDMA_DEST_LOW], a
    ld a, FOLLOWER_DIRECTION_TILES - 1
    ldh [rVDMA_LEN], a
    ; Copy the prebuilt image while its bank is still selected. No rendering here.
    ld a, [wFollowerOAMStart]
    cp OAM_SIZE - 4 * OBJ_SIZE + 1
    jr nc, .restore_banks
    ld c, a
    ld b, HIGH(wShadowOAM)
    ld hl, wFollowerNextOAM
    rept 4 * OBJ_SIZE
        ld a, [hli]
        ld [bc], a
        inc c
    endr
.restore_banks
    pop af
    ldh [rWBK], a
    pop af
    ldh [rVBK], a
    ld a, [wFollowerPendingPair]
    ld [wFollowerCachedPair], a
    ld a, [wFollowerWantedFacing]
    ld [wFollowerShownFacing], a
    xor a
    ld [wFollowerPending], a
    ld hl, wFollowerUploadCount
    inc [hl]
    ret
.defer
    ld hl, wFollowerDeferredCount
    inc [hl]
    ret

INCLUDE "data/sprites/followers.asm"

INCLUDE "engine/overworld/follower_allocation.asm"
INCLUDE "engine/overworld/follower.asm"
INCLUDE "engine/overworld/follower_selection.asm"
INCLUDE "engine/overworld/follower_scripts.asm"
if DEF(FOLLOWER_TEST)
INCLUDE "engine/overworld/follower_test.asm"
endc

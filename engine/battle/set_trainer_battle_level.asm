SetTrainerBattleLevel:
	ld a, 255
	ld [wCurPartyLevel], a

	ld a, [wInBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	; bc indexes the three-byte bank-and-address entry for this trainer class.
	ld a, [wOtherTrainerClass]
	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
	add hl, bc
	add hl, bc
	add hl, bc
	ld a, BANK(TrainerGroups)
	call GetFarByte
	ld [wTrainerGroupBank], a
	inc hl
	ld a, BANK(TrainerGroups)
	call GetFarWord

	ld a, [wOtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.skip_party
	call .next_party_byte
	cp $ff
	jr nz, .skip_party
	jr .skip_trainer
.got_trainer

.skip_name
	call .next_party_byte
	cp "@"
	jr nz, .skip_name

	call .next_party_byte ; trainer type
	call .next_party_byte ; first party member's level
	ld [wCurPartyLevel], a
	ret

.next_party_byte
	; hl is the cursor within the bank recorded in wTrainerGroupBank.
	ld a, [wTrainerGroupBank]
	call GetFarByte
	inc hl
	ret

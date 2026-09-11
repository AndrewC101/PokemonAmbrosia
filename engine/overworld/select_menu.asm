SelectMenu::
	farcall SelectRegisteredItem
	jr nc, .UseRegisteredItem
	ld a, [wScriptVar]
	and a
	ret nz

.NotRegistered:
	call OpenText
	ld b, BANK(MayRegisterItemText)
	ld hl, MayRegisterItemText
	call MapTextbox
	call WaitButton
	jp CloseText

.UseRegisteredItem:
	jp UseRegisteredItem

MayRegisterItemText:
	text_far _MayRegisterItemText
	text_end

CheckRegisteredItem:
	farcall ValidateRegisteredItems
	ret

UseRegisteredItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	ld hl, .SwitchTo
	rst JumpTable
	ret

.SwitchTo:
; entries correspond to ITEMMENU_* constants
	dw .CantUse
	dw .NoFunction
	dw .NoFunction
	dw .NoFunction
	dw .Current
	dw .Party
	dw .Overworld

.NoFunction:
	call OpenText
	call CantUseItem
	call CloseText
	and a
	ret

.Current:
	call OpenText
	call DoItemEffect
	call CloseText
	and a
	ret

.Party:
	call ReanchorMap
	call FadeToMenu
	call DoItemEffect
	call CloseSubmenu
	call CloseText
	and a
	ret

.Overworld:
	call ReanchorMap
	ld a, 1
	ld [wUsingItemWithSelect], a
	call DoItemEffect
	xor a
	ld [wUsingItemWithSelect], a
	ld a, [wItemEffectSucceeded]
	cp 1
	jr nz, ._cantuse
	scf
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret

.CantUse:
	call ReanchorMap

._cantuse
	call CantUseItem
	call CloseText
	and a
	ret

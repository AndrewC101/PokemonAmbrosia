MoveRelearner:
	; Loads and prints the "MoveReminderIntroText" text.
	; Then prompts the player to select "YES" or "NO".
	; Relative jump to the ".cancel" local jump
	; if the player selected "NO" and continue
	; if the player selected "YES".
	;ld hl, MoveReminderIntroText
	;call PrintText
	;call YesNoBox
	;jr c, .cancel

	; Loads and prints the "MoveReminderWhichMonText" text.
	ld hl, MoveReminderWhichMonText
	call PrintText

	; Loads the party menu to select a Pokémon. Relative jump
	; to the ".cancel" local jump if the player leaves
	; the party menu without selecting anything.
	farcall SelectMonFromParty
	jr c, .cancel

	; Checks if the current selection is an egg. Relative jump to
	; the ".is_an_egg" local jump if so and continue if not.
	ld a, [wCurPartySpecies]
	cp EGG
	jr z, .is_an_egg

	; Checks if the current selection is not a Pokémon. Relative jump to
	; the ".not_a_pokemon" local jump if so and continue if not.
	; Prevents continuing if glitched Pokémon are selected.
	call IsAPokemon
	jr c, .not_a_pokemon

	; Checks for any moves that can be learned. Relative
	; jump to the ".no_moves_to_learn" local jump if
	; there are none and continue if there are.
	call GetRemindableMoves
	jr z, .no_moves_to_learn

	; Loads and prints the "MoveReminderWhichMoveText" text.
	ld hl, MoveReminderWhichMoveText
	call PrintText

	; Generates the Move Reminder's menu. Relative jump to the
	; ".exit_menu" local jump if the player leaves
	; the menu and continue if they do not.
	call ChooseMoveToLearn
	jr c, .exit_menu

	; If the player selects a move, load the move's name and copy
	; it for later. This is used for displaying the move's
	; name in some of the text boxes while learning a move.
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyName1

; Begins the process of learning a move.

	; The "LearnMove" label sets the value of the "b" register to "1"
	; when a move is successfully learned and sets it to "0" if
	; cancelled at any point in the move learning process.
	predef LearnMove

	; Relative jump to the ".move_learned" local jump if
	; a move has been learned and continue if not.
	ld a, b
	dec a
	jr z, .move_learned
; This code falls through into the ".exit_menu" local jump.

; Exits the menu and goes back to the
; map with a speech text box open.
.exit_menu
	call ReturnToMapWithSpeechTextbox
; This code falls through into the ".cancel" local jump.

; Loads and prints the "MoveReminderCancelText" text.
; This ends the dialogue.
.cancel
	ld hl, MoveReminderCancelText
	jp PrintText

; Loads and prints the "MoveReminderEggText" text.
; This ends the dialogue.
.is_an_egg
	ld hl, MoveReminderEggText
	jp PrintText

; Loads and prints the "MoveReminderNotaMonText" text.
; This ends the dialogue.
.not_a_pokemon
	ld hl, MoveReminderNotaMonText
	jp PrintText

; Loads and prints the "MoveReminderNoMovesText" text.
; This ends the dialogue.
.no_moves_to_learn
	ld hl, MoveReminderNoMovesText
	jp PrintText

; Exits the menu and goes back to the map with a
; speech text box open and then loads and prints
; the "MoveReminderMoveLearnedText" text.
; This ends the dialogue.
.move_learned
	call ReturnToMapWithSpeechTextbox
	ld hl, MoveReminderMoveLearnedText
	jp PrintText

; Checks for moves that can be learned and returns
; a zero flag if there are none.
GetRemindableMoves:

	; The "wd002" wram label is being used to store
	; the moves for placement in the move list.
	ld hl, wd002
	xor a
	ld [hli], a
	ld [hl], $ff

	; Retrieves and stores the species of
	; the currently selected Pokémon.
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartySpecies], a

	; Retrieves and stores the level of the
	; currently selected Pokémon.
	push af
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [wCurPartyLevel], a

	; The "b" register will contain the number of
	; moves in the move list and "wd002 + 1"
	; is where the move list begins.
	ld b, 0
	ld de, wd002 + 1

	; Retrieves the currently selected Pokémon's evolution
	; and attack address from the "EvosAttacksPointers"
	; table that is located in another bank. This is the
	; list of evolutions and learnset of every Pokémon.
	ld a, [wCurPartySpecies]
	dec a
	push bc
	ld c, a
	ld hl, EvosAttacksPointers
	add hl, bc
	add hl, bc
	ld a, BANK(EvosAttacksPointers)
	call GetFarWord

; Skips the evolution data to start at the learnset for the
; currently selected Pokémon in the "EvosAttacksPointers"
; table. This is "db 0 ; no more evolutions".
.skip_evos
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr nz, .skip_evos

; Loops through the move list until it reaches
; the end of the "EvosAttacksPointers" table
; for the currently selected Pokémon. This is
; "db 0 ; no more level-up moves".

; It then compares the currently selected Pokémon's
; level with the level the move is learned at and
; if the Pokémon's level is higher, it will
; attempt to add the move to the move list.
.loop_moves
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	and a
	jr z, .done
	ld c, a
	ld a, [wCurPartyLevel]
	cp c
	ld a, BANK("Evolutions and Attacks")
	call GetFarByte
	inc hl
	jr c, .loop_moves

	; Checks if the move is already in the
	; move list or already learned by the
	; Pokémon. If both are false, then the
	; move will be added to the move list.
	ld c, a
	call CheckAlreadyInList
	jr c, .loop_moves
	call CheckPokemonAlreadyKnowsMove
	jr c, .loop_moves
	ld a, c
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop bc
	inc b
	push bc
	jr .loop_moves

; Adds all the possible moves the currently
; selected Pokémon can learn into "wd002".
; Which is the move list.
.done
	pop bc
	pop af
	ld [wCurPartySpecies], a
	ld a, b
	ld [wd002], a
	and a
	ret

; Checks if there is a move already placed
; in the move list. This prevents
; duplicate entries in the move list.
CheckAlreadyInList:
	push hl
	ld hl, wd002 + 1
.loop
	ld a, [hli]
	inc a
	jr z, .nope
	dec a
	cp c
	jr nz, .loop
	pop hl
	scf
	ret
.nope
	pop hl
	and a
	ret

; Checks if a Pokémon already knows a move. This
; prevents the player teaching the currently
; selected Pokémon a move it already knows.
CheckPokemonAlreadyKnowsMove:
	push hl
	push bc
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld b, 4
.loop
	ld a, [hli]
	cp c
	jr z, .yes
	dec b
	jr nz, .loop
	pop bc
	pop hl
	and a
	ret
.yes
	pop bc
	pop hl
	scf
	ret

; Creates a scrolling menu and sets up the menu gui.
; The number of items is stored in "wd002"
; The list of items is stored in "wd002 + 1"
ChooseMoveToLearn:
	farcall FadeOutPalettes
	farcall BlankScreen
	ld hl, .MenuHeader
	call CopyMenuHeader
	xor a
	ld [wMenuCursorPosition], a
	ld [wMenuScrollPosition], a

	; This creates a border around the move list.
	; "hlcoord" configures the position.
	; "lb bc" configures the size.
	hlcoord 0,  0
	lb bc, 9, 18
	call TextboxBorder

	; This replaces the tile using the identifier
	; of "$6e" with the fourteenth tile of the
	; "FontBattleExtra gfx" font. Also, only 1
	; tile will be loaded as loading the entire
	; "FontBattleExtra gfx" font will overwrite
	; the "UP" arrow in the menu.
	ld de, FontBattleExtra + 14 tiles
	ld hl, vTiles2 tile $6e
	lb bc, BANK(FontBattleExtra), 1
	call Get2bppViaHDMA

	; This is used for displaying the symbol that
	; appears before the Pokémon's level. Without
	; it, an incorrect symbol will appear.
	farcall LoadStatsScreenPageTilesGFX

	; This displays the Pokémon's species
	; name (not nickname) at the
	; coordinates defined at "hlcoord".
	; In this case that is the
	; top left of the screen.
	xor a
	ld [wMonType], a
	ld a, [wCurPartySpecies]
	ld [wNamedObjectIndex], a
	call GetPokemonName
	hlcoord  5, 0
	call PlaceString

	; This displays the Pokémon's level
	; right after the Pokémon's name.
	push bc
	farcall CopyMonToTempMon
	pop hl
	call PrintLevel

	; Creates the menu, sets the "B_BUTTON"
	; to cancel and sets up each entry
	; to behave like a tm/hm.
	call ScrollingMenu
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .carry
	ld a, [wMenuSelection]
	ld [wPutativeTMHMMove], a
	and a
	ret

; Sets the carry flag and returns from
; this subroutine. Setting the carry
; flag being set will cause the
; menu to exit after returning.
.carry
	scf
	ret

; The menu header defines the menu's position and
; what will be included. The last two values
; of "menu_coords" will determine where the
; vertical scroll arrows will be located.
.MenuHeader:
	db MENU_BACKUP_TILES
	menu_coords 1, 1, SCREEN_WIDTH - 2, 9
	dw .MenuData
	db 1

; This sets up the menu's contents, including the amount
; of entries displayed before scrolling is required.

; Vertical scroll arrows and the move's
; details will be displayed.

; This menu is populated with an item and three functions.
; The item is "wd002".
; Function 1 is the ".print_move_name" local jump.
; Function 2 is the ".print_pp" local jump.
; Function 3 is the ".print_move_details" local jump.
.MenuData:
	db SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_FUNCTION3
	db 4, SCREEN_WIDTH + 2
	db SCROLLINGMENU_ITEMS_NORMAL
	dba  wd002
	dba .print_move_name
	dba .print_pp
	dba .print_move_details

; This prints the move's name in the menu.
; This is purely visual as the actual
; entry is stored in "wd002".
.print_move_name
	push de
	ld a, [wMenuSelection]
	ld [wNamedObjectIndex], a
	call GetMoveName
	pop hl
	jp PlaceString

; This prints the move's pp offset by one
; line with some spacing from the left.
.print_pp
	ld hl, wStringBuffer1
	ld bc, wStringBuffer2 - wStringBuffer1
	ld a, " "
	call ByteFill
	ld a, [wMenuSelection]
	inc a
	ret z
	dec a
	push de

	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_PP) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	ld [wBuffer1], a
	ld hl, wStringBuffer1 + 9
	ld de, wBuffer1
	lb bc, 1, 2
	call PrintNum
	ld hl, wStringBuffer1 + 11
	ld [hl], "/"
	ld hl, wStringBuffer1 + 12
	call PrintNum
	
	ld hl, wStringBuffer1 + 14
	ld [hl], "@"

	pop hl
	ld de, wStringBuffer1
	call PlaceString

	; This prints the pp gfx before the move's pp.
	ld bc, 6
	add hl, bc
	ld a, $3e
	ld [hli], a
	ld [hl], a
	ret

; This adds a text box border line to the description
; box that replaces a leftover piece of the notch
; that remains when the cancel option is highlighted.
.cancel_border_fix
	hlcoord 0, 9
	ld [hl], "│"
	inc hl
	ret

; This begins the printing of all of the move's details,
; including the border around the description.
.print_move_details

	; This creates a border around the description.
	hlcoord 0, 10
	lb bc, 6, 18
	call TextboxBorder

	; This code will relative jump to the
	; ".cancel_border_fix" local jump if
	; the cancel entry is highlighted.
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel_border_fix
; This code falls through into the ".print_move_desc" local jump.

; This prints the moves description.
.print_move_desc
	push de
	ld a, [wMenuSelection]
	inc a
	pop de
	ret z
	dec a
	ld [wCurSpecies], a
	hlcoord 1, 15
	predef PrintMoveDescription
; This code falls through into the ".print_move_type" local jump.

; This prints the move's type.
.print_move_type
	ld a, [wCurSpecies]
	ld b, a
	hlcoord 10, 11
	predef PrintMoveType
; This code falls through into the ".print_move_stat_strings" local jump.

; This prints the notch in the description text box border
; and the "TYPE/", "ATK/", "EFF/" and "ACC/" strings.
.print_move_stat_strings
	hlcoord 0, 9
	ld de, MoveTypeTopString
	call PlaceString
	hlcoord 0, 10
	ld de, MoveTypeString
	call PlaceString
	hlcoord 1, 10
	ld de, MoveAttackString
	call PlaceString

; chance and accuracy
    hlcoord  1, 12
	ld de, MoveChanceString
	call PlaceString
	hlcoord 1, 11
	ld de, MoveAccuracyString
	call PlaceString

; This code falls through into the ".print_move_category" local jump.

; This prints the move's category ("PHYSICAL",
; "SPECIAL" or "STATUS").
.print_move_category
	ld a, [wCurSpecies]
	ld b, a
	farcall GetMoveCategoryName
	hlcoord 11, 12
	ld de, wStringBuffer1
	call PlaceString
	hlcoord 10, 12
	ld [hl], "/"
	inc hl

; This code falls through into the ".print_move_chance" local jump.
; This prints the move's status effect chance number.
.print_move_chance
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_CHANCE) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp 1
	jr c, .print_move_null_chance
	Call ConvertPercentagesRelearner
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord  5, 12
	call PrintNum
	jr .print_move_accuracy

; This prints "---" if the move has a status effect chance of "0".
; This means one of three things:
; It does not inflict a status effect.
; It is always successful in inflicting a status
; effect unless something blocks it.
; Causes a weather effect.
.print_move_null_chance
	ld de, MoveNullValueString
	ld bc, 3
	hlcoord  5, 12
	call PlaceString
; This code falls through into the ".print_move_accuracy" local jump.

; This prints the move's accuracy number.
.print_move_accuracy
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_ACC) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	Call ConvertPercentagesRelearner
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 5, 11
	call PrintNum

; This code falls through into the ".print_move_attack" local jump.

; This prints the move's attack number.
.print_move_attack
	ld a, [wMenuSelection]
	ld bc, MOVE_LENGTH
	ld hl, (Moves + MOVE_POWER) - MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	cp 2
	jr c, .print_move_null_attack
	ld [wBuffer1], a
	ld de, wBuffer1
	lb bc, 1, 3
	hlcoord 5, 10
	jp PrintNum

; This prints "---" if the move has an attack of "0".
; This means that the move does not initially cause
; damage or is a one hit knockout move.
.print_move_null_attack
	hlcoord 5, 10
	ld de, MoveNullValueString
	ld bc, 3
	jp PlaceString

; This converts values out of 256 into a value
; out of 100. It achieves this by multiplying
; the value by 100 and dividing it by 256.
ConvertPercentagesRelearner:
	; Overwrite the "hl" register.
	ld l, a
	ld h, 0
	push af

	; Multiplies the value of the "hl" register by 3.
	add hl, hl
	add a, l
	ld l, a
	adc h
	sub l
	ld h, a

	; Multiplies the value of the "hl" register
	; by 8. The value of the "hl" register
	; is now 24 times its original value.
	add hl, hl
	add hl, hl
	add hl, hl

	; Add the original value of the "hl" value to itself,
	; making it 25 times its original value.
	pop af
	add a, l
	ld l, a
	adc h
	sbc l
	ld h, a

	; Multiply the value of the "hl" register by
	; 4, making it 100 times its original value.
	add hl, hl
	add hl, hl

	; Set the "l" register to 0.5, otherwise the rounded
	; value may be lower than expected. Round the
	; high byte to nearest and drop the low byte.
	ld l, 0.5
	sla l
	sbc a
	and 1
	add a, h

	; add 1?
	ld a, 1
	add a, h
	ret

; This is a notch that will be placed on
; the top left of the description box.
MoveTypeTopString:
	db "┌────────┐@"

; This is the string that displays
; above the move's type.
MoveTypeString:
	db "│        └@"

; This is the string that precedes
; the move's attack number.
MoveAttackString:
	db "ATK/@"

; This displays when a move has
; a metric with a null value.
MoveNullValueString:
	db "---@"

; This is the string that precedes
; the move's accuracy number.
MoveAccuracyString:
	db "ACC/@"

; This is the string that precedes the
; move's status effect chance number.
MoveChanceString:
	db "EFF/@"

; This is the text that displays when the player
; first talks to the move reminder.
MoveReminderIntroText:
	text "Hi, I'm the Move"
	line "Reminder!"

	para "I can make #mon"
	line "remember moves."

	para "Are you"
	line "interested?"
	done

; This is the text that displays just
; before the party menu opens.
MoveReminderWhichMonText:
	text "Which #mon"
	line "should remember"
	cont "a move?"
	prompt

; This is the text that displays after
; a Pokémon has been selected.
MoveReminderWhichMoveText:
	text "Which move should"
	line "be remembered?"
	prompt

; This is the text that displays just before
; the player ends the dialogue
; with the move reminder.
MoveReminderCancelText:
	text "Move recalled!"
	done

; This is the text that displays if the player
; selects an egg in the party menu.
MoveReminderEggText:
	text "An EGG can't learn"
	line "any moves!"
	done

; This is the text that displays if the player
; selects an entry in the party menu that
; is neither a Pokémon or an egg.
MoveReminderNotaMonText:
	text "What is that!?"

	para "I'm sorry, but I"
	line "can only teach"
	cont "moves to #mon!"
	done

; This is the text that displays if the player
; selects a Pokémon in the party menu that
; has no moves that can be learned.
MoveReminderNoMovesText:
	text "There are no moves"
	line "for this #mon"
	cont "to learn."
	done

; This is the text that displays after a
; Pokémon successfully learns a move.
MoveReminderMoveLearnedText:
	text "Move recalled."
	prompt

	object_const_def
	const FUCHSIAMART_CLERK
	const FUCHSIAMART_FISHER
	const FUCHSIAMART_COOLTRAINER_F

FuchsiaMart_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FUCHSIA
	closetext
	end

FuchsiaMartFisherScript:
    checkevent EVENT_BEAT_WALLACE
    iftrue .saved
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer FuchsiaMartFisherText_Invaded
.normal
	jumptextfaceplayer FuchsiaMartFisherText
.saved
    jumptextfaceplayer FuchsiaMartFisherText_Saved

FuchsiaMartCooltrainerFScript:
    checkevent EVENT_BEAT_WALLACE
    iftrue .saved
    checkevent EVENT_HOEN_INVASION_UNDERWAY
    iffalse .normal
    jumptextfaceplayer FuchsiaMartCooltrainerFText_Invaded
.normal
	jumptextfaceplayer FuchsiaMartCooltrainerFText
.saved
    jumptextfaceplayer FuchsiaMartCooltrainerFText_Saved

FuchsiaMartFisherText:
	text "Aw cool, I can"
	line "buy MAX REVIVE"
	cont "here!"

	para "It's very rare"
	line "and powerful."
	done

FuchsiaMartFisherText_Invaded:
	text "Clerk!"

	para "I need all the"
	line "MAX REVIVE you"
	cont "got in stock."

	para "I'm getting out"
	line "of here."
	done

FuchsiaMartFisherText_Saved:
	text "It's you!"

	para "The saviour of"
	line "us all."

	para "Please allow me"
	line "to buy you some"
	cont "MAX REVIVE!"
	done

FuchsiaMartCooltrainerFText:
	text "I wanted to be"
	line "a Gym trainer"
	cont "but I would"
	cont "need to dress up"
	cont "as Janine."

	para "Such vanity!"
	done

FuchsiaMartCooltrainerFText_Invaded:
	text "I saw it!"

	para "A GROUDON!"

	para "I thought it was"
	line "going to eat me."

	para "My heart is"
	line "racing!"
	done

FuchsiaMartCooltrainerFText_Saved:
	text "You saved me!"

	para "I'm not going to"
	line "end up as a"
	cont "GROUDON snack."

	para "I don't know how"
	line "I can thank you!"
	done

FuchsiaMart_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, FUCHSIA_CITY, 1
	warp_event  3,  7, FUCHSIA_CITY, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaMartClerkScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaMartFisherScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaMartCooltrainerFScript, -1

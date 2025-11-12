	object_const_def
	const OLIVINELIGHTHOUSE1F_SAILOR
	const OLIVINELIGHTHOUSE1F_POKEFAN_F
	const OLIVINELIGHTHOUSE1F_POKE_BALL

OlivineLighthouse1F_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineLighthouse1FSailorScript:
	jumptextfaceplayer OlivineLighthouse1FSailorText

OlivineLighthouse1FPokefanFScript:
	jumptextfaceplayer OlivineLighthouse1FPokefanFText

OlivineLighthouse1FSailorText:
	text "There are lots"
	line "of trainers in"
	cont "this lighthouse."

	para "You have to"
	line "fight your"
	cont "way up."

	para "I'm going to"
	line "the top!"
	done

OlivineLighthouse1FPokefanFText:
	text "150 years ago"
	line "the Champion of"
	cont "JOHTO was from"
	cont "OLIVINE."

	para "She trained at"
	line "this lighthouse."

	para "Now it is"
	line "tradition for"
	cont "trainers to"
	cont "train here."
	done

LightHouseThunderStone:
    itemball THUNDERSTONE

OlivineLighthouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 10, 17, OLIVINE_CITY, 9
	warp_event 11, 17, OLIVINE_CITY, 9
	warp_event  3, 11, OLIVINE_LIGHTHOUSE_2F, 1
	warp_event 16, 13, OLIVINE_LIGHTHOUSE_2F, 3
	warp_event 17, 13, OLIVINE_LIGHTHOUSE_2F, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  8,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FSailorScript, -1
	object_event 16,  9, SPRITE_POKEFAN_F, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivineLighthouse1FPokefanFScript, -1
	object_event 15,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LightHouseThunderStone, EVENT_LIGHTHOUSE_THUNDER_STONE

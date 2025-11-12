	object_const_def
	const ELMSHOUSE_ELMS_WIFE
	const ELMSHOUSE_ELMS_SON

ElmsHouse_MapScripts:
	def_scene_scripts

	def_callbacks

ElmsWife:
	jumptextfaceplayer ElmsWifeText

ElmsSon:
	jumptextfaceplayer ElmsSonText

ElmsHousePC:
    checkevent EVENT_BEAT_WALLACE
    iffalse .preWallace
    jumptext ElmsHousePCPostWallaceText
.preWallace
	jumptext ElmsHousePCText

ElmsHouseBookshelf:
	jumpstd DifficultBookshelfScript

ElmsWifeText:
	text "Hello <PLAYER>!"
	para "Elm is at the lab"
	line "like he always is."

	para "He doesn't believe"
	line "in four day weeks,"
	cont "or even five day"
	cont "weeks for that"
	cont "matter."
	done

ElmsSonText:
	text "When I grow up I'm"
	line "going to find the"
	cont "strongest #mon"
	cont "and capture it!"
	para "I'm going to beat"
	line "the ELITE FOUR and"
	cont "take out an evil"
	cont "organisation along"
	cont "the way."
	done

ElmsHousePCPostWallaceText:
    text "EMPEROR WALLACE"
    line "has abdicated"
    cont "and his location"
    cont "is unknown."

    para "Champion Steven"
    line "lives and has"
    cont "assumed command"
    cont "of the Hoenn army."

    para "The war is over."

    para "All thanks to an"
    line "unknown young"
    cont "trainer."

    para "The new Champion"
    line "of Johto."

    para "Champion <PLAYER>!"

    para "Long live"
    line "Champion <PLAYER>."
    done

ElmsHousePCText:
	text "Secret info from"
	line "the #mon"
	cont "LEAGUE."

	para "Our spies report"
	line "most disturbing"
	cont "news."

	para "It is believed"
	line "EMPEROR WALLACE"
	cont "may now be in"
	cont "command of the"
	cont "Hoenn LEGENDARY"
	cont "#mon."

	para "If he controls the"
	line "three forces of"
	cont "nature."

	para "There is little"
	line "hope of stopping"
	cont "him even if all"
	cont "region CHAMPIONS"
	cont "are permitted to"
	cont "fight."
	done

ElmsEevee:
    opentext
    writetext ElmsEeveeText
    cry EEVEE
    waitbutton
    closetext
    end

ElmsEeveeText:
    text "Eevee!"
    done

ElmsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 4
	warp_event  3,  7, NEW_BARK_TOWN, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, ElmsHousePC
	bg_event  6,  1, BGEVENT_READ, ElmsHouseBookshelf
	bg_event  7,  1, BGEVENT_READ, ElmsHouseBookshelf

	def_object_events
	object_event  1,  5, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ElmsWife, -1
	object_event  5,  4, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ElmsSon, -1
	object_event  2,  3, SPRITE_EEVEE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, ElmsEevee, -1


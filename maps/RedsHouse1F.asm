	object_const_def
	const REDSHOUSE1F_REDS_MOM

RedsHouse1F_MapScripts:
	def_scene_scripts
	scene_script .DummyScene

	def_callbacks

.DummyScene:
	end

RedsMom:
	faceplayer
	opentext
	checkevent EVENT_MET_REDS_MOM
	iftrue .MetAlready
	writetext RedsMomText1
	waitbutton
	verbosegiveitem LUCKY_EGG
	iffalse .NoRoom
	setevent EVENT_MET_REDS_MOM
.MetAlready:
	writetext RedsMomText2
	waitbutton
	closetext
	end
.NoRoom:
    writetext RedsMumNoRoomText
    waitbutton
    closetext
    end

RedsMumNoRoomText:
	text "Oh you don't have"
	line "room for this."
	para "You should"
	line "organise your"
	cont "stuff better."
	done

RedsHouse1FTV:
	jumptext RedsHouse1FTVText

RedsHouse1FBookshelf:
	jumpstd PictureBookshelfScript

RedsMomText1:
	text "Hello there."

	para "You are a"
	line "#mon trainer."

	para "My son is also"
	line "a trainer."

	para "He started his"
	line "journey about"
	cont "7 years ago."

	para "He visits very"
	line "rarely."

	para "It's been months"
	line "since I last saw"
	cont "him."

	para "I never have any"
	line "idea where he is"
	cont "but I know he is"
	cont "safe."

	para "He gave me this"
	line "a while ago."

	para "Said he didn't"
	line "need it anymore."

	para "Here, you can have"
	line "it. It might be"
	cont "of use to you."
	done

RedsMomText2:
	text "I miss my son"
	line "very much."

	para "But I am proud"
	line "of him and know"
	cont "he's living his"
	cont "life the way he"
	cont "wants."

	para "And I know nobody"
	line "can hurt him."

	para "I'm sure your Mum"
	line "misses you."

	para "Visit her when"
	line "you can."

	para "If you ever see"
	line "my son RED."

	para "Tell him I'm"
	line "thinking of him."
	done

RedsHouse1FTVText:
	text "They have programs"
	line "that aren't shown"
	cont "in JOHTO…"
	done

RedsHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, PALLET_TOWN, 1
	warp_event  3,  7, PALLET_TOWN, 1
	warp_event  7,  0, REDS_HOUSE_2F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  1,  1, BGEVENT_READ, RedsHouse1FBookshelf
	bg_event  2,  1, BGEVENT_READ, RedsHouse1FTV

	def_object_events
	object_event  5,  3, SPRITE_REDS_MOM, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RedsMom, -1

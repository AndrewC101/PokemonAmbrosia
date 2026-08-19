object_const_def
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

DEF NUM_ECRUTEAK_LEGENDARY_HINTS EQU 28

EcruteakLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	faceplayer
	opentext
	callasm EcruteakSelectLegendaryHint
	callasm EcruteakPrintLegendaryHint
	waitbutton
	closetext
	end

EcruteakLugiaSpeechHouseYoungsterScript:
	faceplayer
	opentext
	callasm EcruteakSelectTMHint
	callasm EcruteakPrintTMHint
	waitbutton
	closetext
	end

LugiaSpeechHouseRadio:
	jumpstd Radio2Script

EcruteakSelectLegendaryHint:
	ld hl, EcruteakLegendaryHintFlags
	ld c, NUM_ECRUTEAK_LEGENDARY_HINTS
	call EcruteakSelectMissingEventFlagHint
	ret

EcruteakSelectTMHint:
	ld hl, wTMsHMs
	call EcruteakCountMissingTMs
	and a
	jr z, .none
	call RandomRange
	ld d, a ; d = selected missing TM ordinal, zero-based
	ld e, 1 ; e = TM hint index written back to wScriptVar
	ld hl, wTMsHMs

.find_tm
	ld a, [hli]
	and a
	jr nz, .next_tm
	ld a, d
	and a
	jr z, EcruteakStoreHintIndex
	dec d

.next_tm
	inc e
	jr .find_tm

.none
	xor a
	ld [wScriptVar], a
	ret

EcruteakCountMissingTMs:
	ld b, 0
	ld c, NUM_TMS

.loop
	ld a, [hli]
	and a
	jr nz, .next
	inc b

.next
	dec c
	jr nz, .loop
	ld a, b
	ret

EcruteakSelectMissingEventFlagHint:
	push hl
	call EcruteakCountMissingEventFlags
	pop hl
	and a
	jr z, .none
	call RandomRange
	ld d, a ; d = selected missing event ordinal, zero-based
	ld e, 1 ; e = legendary hint index written back to wScriptVar

.find_flag
	ld a, [hli]
	ld c, a
	ld a, [hli]
	push hl
	push de
	ld d, a
	ld e, c
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	pop de
	pop hl
	and a
	jr nz, .next_flag
	ld a, d
	and a
	jr z, EcruteakStoreHintIndex
	dec d

.next_flag
	inc e
	jr .find_flag

.none
	xor a
	ld [wScriptVar], a
	ret

EcruteakCountMissingEventFlags:
	ld b, 0

.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	push bc
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	pop bc
	pop hl
	and a
	jr nz, .next
	inc b

.next
	dec c
	jr nz, .loop
	ld a, b
	ret

EcruteakStoreHintIndex:
	ld a, e
	ld [wScriptVar], a
	ret

EcruteakPrintLegendaryHint:
	ld hl, EcruteakLegendaryHintTextPointers
	ld b, BANK(EcruteakLegendaryHintTextPointers)
	jr EcruteakPrintSelectedHint

EcruteakPrintTMHint:
	ld hl, EcruteakTMHintTextPointers
	ld b, BANK(EcruteakTMHintTextPointers)

EcruteakPrintSelectedHint:
	ld a, [wScriptVar]
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call MapTextbox
	ret

EcruteakLegendaryHintFlags:
	table_width 2, EcruteakLegendaryHintFlags
	dw EVENT_CAUGHT_ARTICUNO
	dw EVENT_CAUGHT_ZAPDOS
	dw EVENT_CAUGHT_MOLTRES
	dw EVENT_CAUGHT_RAIKOU
	dw EVENT_CAUGHT_ENTEI
	dw EVENT_CAUGHT_SUICUNE
	dw EVENT_CAUGHT_MEW
	dw EVENT_CAUGHT_CELEBI
	dw EVENT_CAUGHT_LATIAS
	dw EVENT_CAUGHT_LATIOS
	dw EVENT_CAUGHT_DEOXYS
	dw EVENT_CAUGHT_DARKRAI
	dw EVENT_CAUGHT_SHAYMIN
	dw EVENT_CAUGHT_GENESECT
	dw EVENT_FOUGHT_LUGIA ; fought/completed flags, matching location metadata
	dw EVENT_FOUGHT_HO_OH ; fought/completed flags, matching location metadata
	dw EVENT_CAUGHT_GROUDON
	dw EVENT_CAUGHT_KYOGRE
	dw EVENT_CAUGHT_RAYQUAZA
	dw EVENT_CAUGHT_DIALGA
	dw EVENT_CAUGHT_PALKIA
	dw EVENT_CAUGHT_GIRATINA
	dw EVENT_CAUGHT_REGIGIGAS
	dw EVENT_CAUGHT_XERNEAS
	dw EVENT_CAUGHT_YVELTAL
	dw EVENT_CAUGHT_ZYGARDE
	dw EVENT_CAUGHT_MEWTWO
	dw EVENT_CAUGHT_ARCEUS
	assert_table_length NUM_ECRUTEAK_LEGENDARY_HINTS

EcruteakLegendaryHintTextPointers:
	table_width 2, EcruteakLegendaryHintTextPointers
	dw EcruteakLegendaryCompleteText
	dw EcruteakLegendaryArticunoHintText
	dw EcruteakLegendaryZapdosHintText
	dw EcruteakLegendaryMoltresHintText
	dw EcruteakLegendaryRaikouHintText
	dw EcruteakLegendaryEnteiHintText
	dw EcruteakLegendarySuicuneHintText
	dw EcruteakLegendaryMewHintText
	dw EcruteakLegendaryCelebiHintText
	dw EcruteakLegendaryLatiasHintText
	dw EcruteakLegendaryLatiosHintText
	dw EcruteakLegendaryDeoxysHintText
	dw EcruteakLegendaryDarkraiHintText
	dw EcruteakLegendaryShayminHintText
	dw EcruteakLegendaryGenesectHintText
	dw EcruteakLegendaryLugiaHintText
	dw EcruteakLegendaryHoOhHintText
	dw EcruteakLegendaryGroudonHintText
	dw EcruteakLegendaryKyogreHintText
	dw EcruteakLegendaryRayquazaHintText
	dw EcruteakLegendaryDialgaHintText
	dw EcruteakLegendaryPalkiaHintText
	dw EcruteakLegendaryGiratinaHintText
	dw EcruteakLegendaryRegigigasHintText
	dw EcruteakLegendaryXerneasHintText
	dw EcruteakLegendaryYveltalHintText
	dw EcruteakLegendaryZygardeHintText
	dw EcruteakLegendaryMewtwoHintText
	dw EcruteakLegendaryArceusHintText
	assert_table_length NUM_ECRUTEAK_LEGENDARY_HINTS + 1

EcruteakTMHintTextPointers:
	table_width 2, EcruteakTMHintTextPointers
	dw EcruteakTMCompleteText
	dw EcruteakTM01HintText
	dw EcruteakTM02HintText
	dw EcruteakTM03HintText
	dw EcruteakTM04HintText
	dw EcruteakTM05HintText
	dw EcruteakTM06HintText
	dw EcruteakTM07HintText
	dw EcruteakTM08HintText
	dw EcruteakTM09HintText
	dw EcruteakTM10HintText
	dw EcruteakTM11HintText
	dw EcruteakTM12HintText
	dw EcruteakTM13HintText
	dw EcruteakTM14HintText
	dw EcruteakTM15HintText
	dw EcruteakTM16HintText
	dw EcruteakTM17HintText
	dw EcruteakTM18HintText
	dw EcruteakTM19HintText
	dw EcruteakTM20HintText
	dw EcruteakTM21HintText
	dw EcruteakTM22HintText
	dw EcruteakTM23HintText
	dw EcruteakTM24HintText
	dw EcruteakTM25HintText
	dw EcruteakTM26HintText
	dw EcruteakTM27HintText
	dw EcruteakTM28HintText
	dw EcruteakTM29HintText
	dw EcruteakTM30HintText
	dw EcruteakTM31HintText
	dw EcruteakTM32HintText
	dw EcruteakTM33HintText
	dw EcruteakTM34HintText
	dw EcruteakTM35HintText
	dw EcruteakTM36HintText
	dw EcruteakTM37HintText
	dw EcruteakTM38HintText
	dw EcruteakTM39HintText
	dw EcruteakTM40HintText
	dw EcruteakTM41HintText
	dw EcruteakTM42HintText
	dw EcruteakTM43HintText
	dw EcruteakTM44HintText
	dw EcruteakTM45HintText
	dw EcruteakTM46HintText
	dw EcruteakTM47HintText
	dw EcruteakTM48HintText
	dw EcruteakTM49HintText
	dw EcruteakTM50HintText
	assert_table_length NUM_TMS + 1

EcruteakLegendaryCompleteText:
	text "You have caught"
	line "every legendary"
	cont "#mon!"
	para "You are a true"
	line "#mon master."
	done

EcruteakLegendaryArticunoHintText:
	text "Articuno has been"
	line "seen around the"
	cont "icy halls of"
	cont "Seafoam Cave."
	done

EcruteakLegendaryZapdosHintText:
	text "Zapdos is said to"
	line "perch atop an"
	cont "abandoned"
	cont "lighthouse"
	cont "somewhere between"
	cont "Johto and Kanto."
	done

EcruteakLegendaryMoltresHintText:
	text "Moltres rules over"
	line "a lake of fire"
	cont "deep within Rock"
	cont "Tunnel."
	done

EcruteakLegendaryRaikouHintText:
	text "Raikou stops to"
	line "reflect at the end"
	cont "of Route 45."
	done

EcruteakLegendaryEnteiHintText:
	text "Entei might be"
	line "called to the"
	cont "Ruins of Alph by"
	cont "the power of the"
	cont "Unown."
	done

EcruteakLegendarySuicuneHintText:
	text "Suicune returns to"
	line "its saviour at the"
	cont "Tin Tower."
	done

EcruteakLegendaryMewHintText:
	text "Mew was worshiped"
	line "by the ancients"
	cont "who built the"
	cont "trials west of"
	cont "Cherrygrove."
	done

EcruteakLegendaryCelebiHintText:
	text "Celebi guards Ilex"
	line "Forest."
	para "It seeks a special"
	line "item."
	para "Maybe the"
	line "scientists at Alph"
	cont "know of it."
	done

EcruteakLegendaryLatiasHintText:
	text "Latias seeks"
	line "friendship in"
	cont "Fuchsia City."
	done

EcruteakLegendaryLatiosHintText:
	text "Latios searches"
	line "for Latias"
	cont "somewhere between"
	cont "Tohjo Falls and"
	cont "Mt.Silver."
	done

EcruteakLegendaryDeoxysHintText:
	text "Deoxys, a virus"
	line "from space, awaits"
	cont "a fresh host in"
	cont "Pewter Museum."
	done

EcruteakLegendaryDarkraiHintText:
	text "Darkrai lives in"
	line "darkness somewhere"
	cont "in Dark Cave."
	done

EcruteakLegendaryShayminHintText:
	text "Shaymin seek to"
	line "revive Viridian"
	cont "Forest."
	para "Perhaps another"
	line "forest protector"
	cont "can help it."
	done

EcruteakLegendaryGenesectHintText:
	text "Genesect hunts for"
	line "its prey at"
	cont "Cinnabar Lab."
	done

EcruteakLegendaryLugiaHintText:
	text "Lugia dwells in"
	line "the deepest cavern"
	cont "of the Whirl"
	cont "Islands"
	done

EcruteakLegendaryHoOhHintText:
	text "Ho-Oh takes the"
	line "Tin Tower as its"
	cont "throne."
	done

EcruteakLegendaryGroudonHintText:
	text "Groudon wages its"
	line "eternal battle in"
	cont "Primal Cave."
	para "Command of space"
	line "will be needed to"
	cont "get there."
	done

EcruteakLegendaryKyogreHintText:
	text "Kyogre wages its"
	line "eternal battle in"
	cont "Primal Cave."
	para "Command of space"
	line "will be needed to"
	cont "get there."
	done

EcruteakLegendaryRayquazaHintText:
	text "Rayquaza weighs"
	line "the worthy in"
	cont "Dragons Den."
	done

EcruteakLegendaryDialgaHintText:
	text "Dialga, master of"
	line "time, waits in"
	cont "Mt.Silver."
	para "Only a titan of a"
	line "#mon can reach"
	cont "it."
	done

EcruteakLegendaryPalkiaHintText:
	text "Palkia, master of"
	line "space, waits in"
	cont "Mt.Silver."
	para "Only an"
	line "otherworldly"
	cont "psychic power can"
	cont "reach it."
	done

EcruteakLegendaryGiratinaHintText:
	text "Giratina plots its"
	line "conquest from its"
	cont "dark throne in the"
	cont "Abyss."
	done

EcruteakLegendaryRegigigasHintText:
	text "Regigigas, an old"
	line "titan, awaits in"
	cont "the deepest corner"
	cont "of Cerulean Cave."
	done

EcruteakLegendaryXerneasHintText:
	text "Xerneas is revered"
	line "by the ancient"
	cont "people of Alph."
	para "Command of time"
	line "will be needed to"
	cont "get there."
	done

EcruteakLegendaryYveltalHintText:
	text "Yveltal, lord of"
	line "death, it is the"
	cont "oldest secret in"
	cont "the Ruins of Alph."
	done

EcruteakLegendaryZygardeHintText:
	text "Zygarde brings"
	line "balance to all"
	cont "things."
	para "Only a master of"
	line "legendary #mon"
	cont "can reach the"
	cont "oldest depths of"
	cont "Mt.Silver."
	done

EcruteakLegendaryMewtwoHintText:
	text "Mewtwo, the"
	line "genetically"
	cont "engineered"
	cont "ultimate weapon."
	para "Only the master of"
	line "masters can find"
	cont "it."
	done

EcruteakLegendaryArceusHintText:
	text "Arceus, the"
	line "creator God."
	para "Prayers say it"
	line "lives in the Hall"
	cont "of Origin."
	para "How to get there,"
	line "nobody knows."
	done

EcruteakTMCompleteText:
	text "You have acquired"
	line "all techniques."
	para "No enemy is a"
	line "match for your"
	cont "versatility."
	done

EcruteakTM01HintText:
	text "Drain Punch is"
	line "given at Cianwood"
	cont "Gym."
	done

EcruteakTM02HintText:
	text "Headbutt is given"
	line "in Ilex Forest."
	done

EcruteakTM03HintText:
	text "Curse is found"
	line "in Dark Cave."
	done

EcruteakTM04HintText:
	text "Aura Sphere is"
	line "found in the"
	cont "Ruins of Alph."
	done

EcruteakTM05HintText:
	text "Roar is found"
	line "in Mt.Mortar."
	done

EcruteakTM06HintText:
	text "Toxic is found"
	line "in Cinnabar Lab."
	done

EcruteakTM07HintText:
	text "Body Slam is"
	line "found in the"
	cont "Power Plant."
	done

EcruteakTM08HintText:
	text "Rock Smash is"
	line "found in the"
	cont "Ruins of Alph."
	done

EcruteakTM09HintText:
	text "Roost is given"
	line "on Route 39."
	done

EcruteakTM10HintText:
	text "Ancient Power"
	line "is found in"
	cont "Union Cave."
	done

EcruteakTM11HintText:
	text "Sunny Day is"
	line "found on Route"
	cont "27."
	done

EcruteakTM12HintText:
	text "Selfdestruct is"
	line "bought at Celadon"
	cont "Dept.Store, or"
	cont "found on"
	cont "Heroes Pass."
	done

EcruteakTM13HintText:
	text "Explosion is"
	line "bought at Celadon"
	cont "Dept.Store, or"
	cont "found on Route"
	cont "22."
	done

EcruteakTM14HintText:
	text "Blizzard is bought"
	line "at Goldenrod Game"
	cont "Corner, or found"
	cont "in Seafoam Cave."
	done

EcruteakTM15HintText:
	text "Hyper Beam is"
	line "bought at Celadon"
	cont "Dept.Store, or"
	cont "found in"
	cont "Cinnabar Lab."
	done

EcruteakTM16HintText:
	text "Icy Wind is given"
	line "at Mahogany Gym."
	done

EcruteakTM17HintText:
	text "Protect is given"
	line "in Viridian City."
	done

EcruteakTM18HintText:
	text "Rain Dance is"
	line "found at the"
	cont "Lake of Rage."
	done

EcruteakTM19HintText:
	text "Giga Drain is"
	line "found in"
	cont "Viridian Forest."
	done

EcruteakTM20HintText:
	text "Horn Drill is"
	line "bought at Celadon"
	cont "Game Corner, or"
	cont "found at Tohjo"
	cont "Lake."
	done

EcruteakTM21HintText:
	text "Fissure is bought"
	line "at Celadon Game"
	cont "Corner, or found"
	cont "on Heroes Pass."
	done

EcruteakTM22HintText:
	text "Solarbeam is"
	line "found on Route"
	cont "27."
	done

EcruteakTM23HintText:
	text "Iron Head is given"
	line "at Olivine Gym."
	done

EcruteakTM24HintText:
	text "Dragon Pulse is"
	line "given by Clair."
	done

EcruteakTM25HintText:
	text "Thunder is bought"
	line "at Goldenrod Game"
	cont "Corner, or found"
	cont "at the Old"
	cont "Lighthouse."
	done

EcruteakTM26HintText:
	text "Earthquake is"
	line "found on Victory"
	cont "Road."
	done

EcruteakTM27HintText:
	text "Return is given"
	line "at Goldenrod Gym."
	done

EcruteakTM28HintText:
	text "Dig is found in"
	line "National Park."
	done

EcruteakTM29HintText:
	text "Psychic is given"
	line "in Cianwood City."
	done

EcruteakTM30HintText:
	text "Shadow Ball is"
	line "given at Ecruteak"
	cont "Gym."
	done

EcruteakTM31HintText:
	text "Thunderbolt is"
	line "found at the"
	cont "Lake of Rage."
	done

EcruteakTM32HintText:
	text "Flamethrower is"
	line "found on Victory"
	cont "Road."
	done

EcruteakTM33HintText:
	text "Ice Punch can be"
	line "bought at"
	cont "Goldenrod Dept."
	cont "Store, or found"
	cont "in Cherrygrove"
	cont "Ruins."
	done

EcruteakTM34HintText:
	text "Earth Power is"
	line "found on Heroes"
	cont "Pass."
	done

EcruteakTM35HintText:
	text "Sleep Talk is"
	line "found in"
	cont "Goldenrod"
	cont "Warehouse."
	done

EcruteakTM36HintText:
	text "Sludge Bomb is"
	line "found on Route"
	cont "43."
	done

EcruteakTM37HintText:
	text "Sandstorm is"
	line "given on Route"
	cont "27."
	done

EcruteakTM38HintText:
	text "Fire Blast is"
	line "bought at"
	cont "Goldenrod Game"
	cont "Corner, or found"
	cont "in Rock Tunnel."
	done

EcruteakTM39HintText:
	text "Swift is given at"
	line "Violet Gym."
	done

EcruteakTM40HintText:
	text "Double-Edge is"
	line "found on Route"
	cont "45."
	done

EcruteakTM41HintText:
	text "Thunderpunch can"
	line "be bought at"
	cont "Goldenrod Dept."
	cont "Store, or found"
	cont "in Cherrygrove"
	cont "Ruins."
	done

EcruteakTM42HintText:
	text "Substitute is"
	line "bought at Celadon"
	cont "Game Corner, or"
	cont "found in"
	cont "Cherrygrove"
	cont "Ruins."
	done

EcruteakTM43HintText:
	text "Ice Beam is found"
	line "in the Whirl"
	cont "Islands."
	done

EcruteakTM44HintText:
	text "Rest is found in"
	line "Ice Path."
	done

EcruteakTM45HintText:
	text "Taunt is found in"
	line "Goldenrod"
	cont "Warehouse."
	done

EcruteakTM46HintText:
	text "Rock Slide is"
	line "found on Route"
	cont "45."
	done

EcruteakTM47HintText:
	text "Thunder Wave is"
	line "found in the"
	cont "Rocket Hideout."
	done

EcruteakTM48HintText:
	text "Fire Punch can be"
	line "bought at"
	cont "Goldenrod Dept."
	cont "Store, or found"
	cont "in Cherrygrove"
	cont "Ruins."
	done

EcruteakTM49HintText:
	text "X-Scissor is"
	line "given at Azalea"
	cont "Gym."
	done

EcruteakTM50HintText:
	text "Dark Pulse is"
	line "found in Dark"
	cont "Cave."
	done

EcruteakLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, MAPOBJECT_DARK_SKIN, EcruteakLugiaSpeechHouseYoungsterScript, -1

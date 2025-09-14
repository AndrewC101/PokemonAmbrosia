RadioChannelSongs:
; entries correspond to radio channel ids (see constants/radio_constants.asm)
	table_width 2, RadioChannelSongs
	dw MUSIC_POKEMON_TALK
	dw MUSIC_POKEMON_CENTER
	dw MUSIC_EPIC_TETRIS
	dw MUSIC_GAME_CORNER
	dw MUSIC_SUICUNE_BATTLE
	dw MUSIC_VIRIDIAN_CITY
	dw MUSIC_ROUTE_1
	dw MUSIC_ROCKET_OVERTURE
	dw MUSIC_POKE_FLUTE_CHANNEL
	dw MUSIC_RUINS_OF_ALPH_RADIO
	dw MUSIC_LAKE_OF_RAGE_ROCKET_RADIO
	assert_table_length NUM_RADIO_CHANNELS

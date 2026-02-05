; Pokémon swarms in grass

SwarmGrassWildMons:

; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	db 3, GEODUDE
	db 3, MEOWTH
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, MEOWTH
	db 4, MEOWTH
	db 4, MEOWTH
	; day
	db 3, GEODUDE
	db 3, MEOWTH
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, MEOWTH
	db 4, MEOWTH
	db 4, MEOWTH
	; nite
	db 3, GEODUDE
	db 3, MEOWTH
	db 2, ZUBAT
	db 2, GEODUDE
	db 2, MEOWTH
	db 4, MEOWTH
	db 4, MEOWTH

; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, STARLY
	db 10, STARLY
	db 40, DITTO
	; day
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, STARLY
	db 10, STARLY
	db 40, DITTO
	; nite
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, YANMA
	db 14, YANMA
	db 14, HOOTHOOT
	db 10, HOOTHOOT
	db 40, DITTO

	db -1 ; end

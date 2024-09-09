BattleTowerTrainers:
; The trainer class is not used in Crystal 1.0 due to a bug.
; Instead, the sixth character in the trainer's name is used.
; See BattleTowerText in engine/events/battle_tower/trainer_text.asm.
	table_width (NAME_LENGTH - 1) + 1, BattleTowerTrainers
	; name, class
	db "ALAN@@@@@@", HIKER
	db "FREDA@@@@@", KIMONO_GIRL
	db "JAMES@@@@@", POKEMANIAC
	db "CATHERINE@", LASS
	db "ADAM@@@@@@", COOLTRAINERM
	db "PETER@@@@@", POKEFANM
	db "LIZ@@@@@@@", POKEFANF
	db "BOBBY@@@@@", GENTLEMAN
	db "STEVEN@@@@", BIRD_KEEPER
	db "SAM@@@@@@@", SAILOR
	db "IRENE@@@@@", MEDIUM
	db "HARRY@@@@@", BLACKBELT_T
	db "BEN@@@@@@@", FISHER
	db "JOSHUA@@@@", BIKER
	db "ZAC@@@@@@@", BUG_CATCHER
	db "EVE@@@@@@@", PICNICKER
	db "KRISTY@@@@", BEAUTY
	db "CARLA@@@@@", PICNICKER
	db "HOLLY@@@@@", LASS
	db "COOPER@@@@", FIREBREATHER
	db "SHEERIN@@@", POKEFANM
	db "MAURO@@@@@", SCIENTIST
	db "LARMOUR@@@", YOUNGSTER
	db "KIRK@@@@@@", SAILOR
	db "DARREN@@@@", SCHOOLBOY
	db "LUKE@@@@@@", SUPER_NERD
	db "IAN@@@@@@@", BLACKBELT_T
	db "JONATHAN@@", SAGE
	db "KRISSE@@@@", LASS
	db "JULIA@@@@@", BEAUTY
	db "RACHEL@@@@", SWIMMERF
	db "ASHLEY@@@@", FISHER
	db "MEREDITH@@", COOLTRAINERF
	db "GERRY@@@@@", OFFICER
	db "DAVE HILL@", FIREBREATHER
; same again
	db "ALAN@@@@@@", HIKER
	db "FREDA@@@@@", KIMONO_GIRL
	db "JAMES@@@@@", POKEMANIAC
	db "CATHERINE@", LASS
	db "ADAM@@@@@@", COOLTRAINERM
	db "PETER@@@@@", POKEFANM
	db "LIZ@@@@@@@", POKEFANF
	db "BOBBY@@@@@", GENTLEMAN
	db "STEVEN@@@@", BIRD_KEEPER
	db "SAM@@@@@@@", SAILOR
	db "IRENE@@@@@", MEDIUM
	db "HARRY@@@@@", BLACKBELT_T
	db "BEN@@@@@@@", FISHER
	db "JOSHUA@@@@", BIKER
	db "ZAC@@@@@@@", BUG_CATCHER
	db "EVE@@@@@@@", PICNICKER
	db "KRISTY@@@@", BEAUTY
	db "CARLA@@@@@", PICNICKER
	db "HOLLY@@@@@", LASS
	db "COOPER@@@@", FIREBREATHER
	db "SHEERIN@@@", POKEFANM
	db "MAURO@@@@@", SCIENTIST
	db "LARMOUR@@@", YOUNGSTER
	db "KIRK@@@@@@", SAILOR
	db "DARREN@@@@", SCHOOLBOY
	db "LUKE@@@@@@", SUPER_NERD
	db "IAN@@@@@@@", BLACKBELT_T
	db "JONATHAN@@", SAGE
	db "KRISSE@@@@", LASS
	db "JULIA@@@@@", BEAUTY
	db "RACHEL@@@@", SWIMMERF
	db "ASHLEY@@@@", FISHER
	db "MEREDITH@@", COOLTRAINERF
	db "GERRY@@@@@", OFFICER
	db "DAVE HILL@", FIREBREATHER
	assert_table_length BATTLETOWER_NUM_UNIQUE_TRAINERS

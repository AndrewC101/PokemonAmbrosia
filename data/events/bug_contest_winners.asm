BugContestantPointers:
	table_width 2, BugContestantPointers
	dw BugContestant_BugCatcherDon ; this reverts back to the player
	dw BugContestant_BugCatcherDon
	dw BugContestant_BugCatcherEd
	dw BugContestant_CooltrainerMNick
	dw BugContestant_PokefanMWilliam
	dw BugContestant_BugCatcherBenny
	dw BugContestant_CamperBarry
	dw BugContestant_PicnickerCindy
	dw BugContestant_BugCatcherJosh
	dw BugContestant_YoungsterSamuel
	dw BugContestant_SchoolboyKipp
	assert_table_length NUM_BUG_CONTESTANTS + 1

; contestant format:
;   db class, id
;   dbw 1st-place mon, score
;   dbw 2nd-place mon, score
;   dbw 3rd-place mon, score

BugContestant_BugCatcherDon:
	db BUG_CATCHER, DON
	dbw WHIRLIPEDE,     300
	dbw WHIRLIPEDE,    285
	dbw VENIPEDE,   226

BugContestant_BugCatcherEd:
	db BUG_CATCHER, ED
	dbw SCOLIPEDE, 286
	dbw SCOLIPEDE, 251
	dbw VENIPEDE,   237

BugContestant_CooltrainerMNick:
	db COOLTRAINERM, NICK
	dbw SCYTHER,    357
	dbw SCOLIPEDE, 349
	dbw PINSIR,     368

BugContestant_PokefanMWilliam:
	db POKEFANM, WILLIAM
	dbw PINSIR,     332
	dbw SCOLIPEDE, 324
	dbw LARVESTA,    371

BugContestant_BugCatcherBenny:
	db BUG_CATCHER, BUG_CATCHER_BENNY
	dbw SCOLIPEDE, 318
	dbw LARVESTA,     295
	dbw VENIPEDE,   285

BugContestant_CamperBarry:
	db CAMPER, BARRY
	dbw PINSIR,     366
	dbw LARVESTA,    389
	dbw WHIRLIPEDE,     314

BugContestant_PicnickerCindy:
	db PICNICKER, CINDY
	dbw SCOLIPEDE, 341
	dbw WHIRLIPEDE,    301
	dbw VENIPEDE,   264

BugContestant_BugCatcherJosh:
	db BUG_CATCHER, JOSH
	dbw SCYTHER,    326
	dbw SCOLIPEDE, 292
	dbw WHIRLIPEDE,    282

BugContestant_YoungsterSamuel:
	db YOUNGSTER, SAMUEL
	dbw LARVESTA,     270
	dbw PINSIR,     282
	dbw VENIPEDE,   251

BugContestant_SchoolboyKipp:
	db SCHOOLBOY, KIPP
	dbw LARVESTA,    367
	dbw JOLTIK,      254
	dbw WHIRLIPEDE,     259

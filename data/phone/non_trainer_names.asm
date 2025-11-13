NonTrainerCallerNames:
; entries correspond to PHONECONTACT_* constants (see constants/trainer_constants.asm)
	table_width 2, NonTrainerCallerNames
	dw .none
	dw .mom
	dw .bikeshop
	dw .bill
	dw .elm
	dw .buena
	assert_table_length NUM_NONTRAINER_PHONECONTACTS + 1

.none:     db "----------@"
.mom:      db "Mum:@"
.bill:     db "Bill:@"
.elm:      db "Prof.Elm:@"
.bikeshop: db "Bike Shop:@"
.buena:    db "Buena:<LF>   DISC JOCKEY@"

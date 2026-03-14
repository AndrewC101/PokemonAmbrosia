BillsPC_ThemeNames:
	table_width 2
	dw .Pokedex
	dw .PokegearM
	dw .PokegearF
	dw .PackM
	dw .PackF
	dw .TrainerM
	dw .TrainerF
	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Bug
	dw .Ghost
	dw .Steel
	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon
	dw .Dark
	assert_table_length NUM_BILLS_PC_THEMES

.Pokedex:   db "#Dex@"
.PokegearM: db "#Gear♂@"
.PokegearF: db "#Gear♀@"
.PackM:     db "Pack♂@"
.PackF:     db "Pack♀@"
.TrainerM:  db "Trainer♂@"
.TrainerF:  db "Trainer♀@"
.Normal:    db "Normal@"
.Fighting:  db "Fighting@"
.Flying:    db "Flying@"
.Poison:    db "Poison@"
.Ground:    db "Ground@"
.Rock:      db "Rock@"
.Bug:       db "Bug@"
.Ghost:     db "Ghost@"
.Steel:     db "Steel@"
.Fire:      db "Fire@"
.Water:     db "Water@"
.Grass:     db "Grass@"
.Electric:  db "Electric@"
.Psychic:   db "Psychic@"
.Ice:       db "Ice@"
.Dragon:    db "Dragon@"
.Dark:      db "Dark@"

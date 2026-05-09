SECTION "Jukebox Songs", ROMX

JukeboxSongs::
	db NUM_MUSIC_SONGS - 1
for x, NUM_MUSIC_SONGS
if x != MUSIC_NONE
	db x
endc
endr
	db -1

JukeboxSongNamePointers::
	table_width 3
	dba .None
	dba .Route1
	dba .Route3
	dba .Route12
	dba .MagnetTrain
	dba .KantoGymBattle
	dba .KantoTrainerBattle
	dba .KantoWildBattle
	dba .PokemonCenter
	dba .HikerEncounter
	dba .LassEncounter
	dba .OfficerEncounter
	dba .HealPokemon
	dba .Route2
	dba .MtMoon
	dba .ShowMeAround
	dba .GameCorner
	dba .HallOfFame
	dba .ViridianCity
	dba .CeladonCity
	dba .TrainerVictory
	dba .WildVictory
	dba .GymVictory
	dba .MtMoonSquare
	dba .Gym
	dba .PalletTown
	dba .OaksPokemonTalk
	dba .ProfOak
	dba .RivalEncounter
	dba .AfterRivalFight
	dba .Evolution
	dba .NationalPark
	dba .AzaleaTown
	dba .CherrygroveCity
	dba .KimonoEncounter
	dba .UnionCave
	dba .JohtoWildBattle
	dba .JohtoTrainerBattle
	dba .Route30
	dba .EcruteakCity
	dba .VioletCity
	dba .JohtoGymBattle
	dba .ChampionBattle
	dba .RivalBattle
	dba .RocketBattle
	dba .ElmsLab
	dba .DarkCave
	dba .Route29
	dba .Route36
	dba .YoungsterEncounter
	dba .BeautyEncounter
	dba .RocketEncounter
	dba .PokemaniacEncounter
	dba .SageEncounter
	dba .NewBarkTown
	dba .GoldenrodCity
	dba .VermilionCity
	dba .PokemonChannel
	dba .PokeFluteChannel
	dba .TinTower
	dba .SproutTower
	dba .BurnedTower
	dba .Lighthouse
	dba .LakeOfRage
	dba .IndigoPlateau
	dba .Route37
	dba .RocketHideout
	dba .DragonsDen
	dba .JohtoWildBattleNight
	dba .RuinsOfAlphRadio
	dba .SuccessfulCapture
	dba .Route26
	dba .Mom
	dba .VictoryRoad
	dba .PokemonLullaby
	dba .PokemonMarch
	dba .MainMenu
	dba .RuinsOfAlphInterior
	dba .RocketOverture
	dba .DancingHall
	dba .BugContestRanking
	dba .RocketRadio
	dba .PostCredits
	dba .Clair
	dba .MobileAdapterMenu
	dba .MysticalmanEncounter
	dba .BattleTowerTheme
	dba .SuicuneBattle
	dba .BattleTowerLobby
	dba .ZinniaBattle
	dba .XVZ
	dba .HoennChampion
	dba .LugiaSong
	dba .GuileTheme
	dba .MistyMountain
	dba .HoennGrunt
	dba .MadWorld
	dba .EpicTetris
	dba .FinalBattle
	dba .RedIndigoPlateau
	dba .LavenderTown
	dba .RedDungeon
	dba .ChampionDPPt
	dba .EliteFourPrism
	dba .Megalovania
	dba .HoOhBattle
	dba .RedLavender
	assert_table_length NUM_MUSIC_SONGS

.None:                db "None@"
.Route1:              db "Route 1@"
.Route3:              db "Route 3@"
.Route12:             db "Route 12@"
.MagnetTrain:         db "Magnet Train@"
.KantoGymBattle:      db "Kanto Gym Battle@"
.KantoTrainerBattle:  db "Kanto Trainer@"
.KantoWildBattle:     db "Kanto Wild@"
.PokemonCenter:       db "Pokemon Center@"
.HikerEncounter:      db "Hiker Encounter@"
.LassEncounter:       db "Lass Encounter@"
.OfficerEncounter:    db "Officer Encounter@"
.HealPokemon:         db "Heal Pokemon@"
.Route2:              db "Route 2@"
.MtMoon:              db "Mt. Moon@"
.ShowMeAround:        db "Show Me Around@"
.GameCorner:          db "Game Corner@"
.HallOfFame:          db "Hall of Fame@"
.ViridianCity:        db "Viridian City@"
.CeladonCity:         db "Celadon City@"
.TrainerVictory:      db "Trainer Victory@"
.WildVictory:         db "Wild Victory@"
.GymVictory:          db "Gym Victory@"
.MtMoonSquare:        db "Mt. Moon Square@"
.Gym:                 db "Gym@"
.PalletTown:          db "Pallet Town@"
.OaksPokemonTalk:     db "Oak's Talk@"
.ProfOak:             db "Prof. Oak@"
.RivalEncounter:      db "Rival Encounter@"
.AfterRivalFight:     db "After Rival@"
.Evolution:           db "Evolution@"
.NationalPark:        db "National Park@"
.AzaleaTown:          db "Azalea Town@"
.CherrygroveCity:     db "Cherrygrove@"
.KimonoEncounter:     db "Kimono Encounter@"
.UnionCave:           db "Union Cave@"
.JohtoWildBattle:     db "Johto Wild@"
.JohtoTrainerBattle:  db "Johto Trainer@"
.Route30:             db "Route 30@"
.EcruteakCity:        db "Ecruteak City@"
.VioletCity:          db "Violet City@"
.JohtoGymBattle:      db "Johto Gym Battle@"
.ChampionBattle:      db "Champion Battle@"
.RivalBattle:         db "Rival Battle@"
.RocketBattle:        db "Rocket Battle@"
.ElmsLab:             db "Elm's Lab@"
.DarkCave:            db "Dark Cave@"
.Route29:             db "Route 29@"
.Route36:             db "Route 36@"
.YoungsterEncounter:  db "Youngster Enc.@"
.BeautyEncounter:     db "Beauty Encounter@"
.RocketEncounter:     db "Rocket Encounter@"
.PokemaniacEncounter: db "Pokemaniac Enc.@"
.SageEncounter:       db "Sage Encounter@"
.NewBarkTown:         db "New Bark Town@"
.GoldenrodCity:       db "Goldenrod City@"
.VermilionCity:       db "Vermilion City@"
.PokemonChannel:      db "Pokemon Channel@"
.PokeFluteChannel:    db "Poke Flute@"
.TinTower:            db "Tin Tower@"
.SproutTower:         db "Sprout Tower@"
.BurnedTower:         db "Burned Tower@"
.Lighthouse:          db "Lighthouse@"
.LakeOfRage:          db "Lake of Rage@"
.IndigoPlateau:       db "Indigo Plateau@"
.Route37:             db "Route 37@"
.RocketHideout:       db "Rocket Hideout@"
.DragonsDen:          db "Dragon's Den@"
.JohtoWildBattleNight: db "Johto Wild Nite@"
.RuinsOfAlphRadio:    db "Alph Radio@"
.SuccessfulCapture:   db "Successful Cap.@"
.Route26:             db "Route 26@"
.Mom:                 db "Mom@"
.VictoryRoad:         db "Victory Road@"
.PokemonLullaby:      db "Pokemon Lullaby@"
.PokemonMarch:        db "Pokemon March@"
.MainMenu:            db "Main Menu@"
.RuinsOfAlphInterior: db "Alph Interior@"
.RocketOverture:      db "Rocket Overture@"
.DancingHall:         db "Dancing Hall@"
.BugContestRanking:   db "Bug Contest@"
.RocketRadio:         db "Rocket Radio@"
.PostCredits:         db "Post Credits@"
.Clair:               db "Clair@"
.MobileAdapterMenu:   db "Mobile Adapter@"
.MysticalmanEncounter: db "Mysticalman Enc.@"
.BattleTowerTheme:    db "Battle Tower@"
.SuicuneBattle:       db "Suicune Battle@"
.BattleTowerLobby:    db "Tower Lobby@"
.ZinniaBattle:        db "Zinnia Battle@"
.XVZ:                 db "XVZ@"
.HoennChampion:       db "Hoenn Champion@"
.LugiaSong:           db "Lugia's Song@"
.GuileTheme:          db "Guile Theme@"
.MistyMountain:       db "Misty Mountain@"
.HoennGrunt:          db "Hoenn Grunt@"
.MadWorld:            db "Mad World@"
.EpicTetris:          db "Epic Tetris@"
.FinalBattle:         db "Final Battle@"
.RedIndigoPlateau:    db "Red Plateau@"
.LavenderTown:        db "Lavender Town@"
.RedDungeon:          db "Red Dungeon@"
.ChampionDPPt:        db "Champion DPPt@"
.EliteFourPrism:      db "Elite Four Prism@"
.Megalovania:         db "Megalovania@"
.HoOhBattle:          db "Ho-Oh Battle@"
.RedLavender:         db "Red Lavender@"

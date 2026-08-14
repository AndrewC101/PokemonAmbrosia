TrainerPalettes:
; entries correspond to trainer classes

; Each .gbcpal is generated from the corresponding .png, and
; only the middle two colors are included, not black or white.

	table_width COLOR_SIZE * 2

PlayerPalette: ; Chris uses the same colors as Cal
INCBIN "gfx/trainers/cal.gbcpal", middle_colors
KrisPalette: ; Kris shares Falkner's palette
INCBIN "gfx/trainers/falkner.gbcpal", middle_colors
INCBIN "gfx/trainers/whitney.gbcpal", middle_colors
INCBIN "gfx/trainers/bugsy.gbcpal", middle_colors
INCBIN "gfx/trainers/morty.gbcpal", middle_colors
INCBIN "gfx/trainers/pryce.gbcpal", middle_colors
INCBIN "gfx/trainers/jasmine.gbcpal", middle_colors
INCBIN "gfx/trainers/chuck.gbcpal", middle_colors
INCBIN "gfx/trainers/clair.gbcpal", middle_colors
INCBIN "gfx/trainers/rival1.gbcpal", middle_colors
INCBIN "gfx/trainers/oak.gbcpal", middle_colors
INCBIN "gfx/trainers/will.gbcpal", middle_colors
INCBIN "gfx/trainers/cal.gbcpal", middle_colors
INCBIN "gfx/trainers/bruno.gbcpal", middle_colors
INCBIN "gfx/trainers/karen.gbcpal", middle_colors
INCBIN "gfx/trainers/adam.gbcpal", middle_colors
INCBIN "gfx/trainers/champion.gbcpal", middle_colors
INCBIN "gfx/trainers/brock.gbcpal", middle_colors
INCBIN "gfx/trainers/misty.gbcpal", middle_colors
INCBIN "gfx/trainers/lt_surge.gbcpal", middle_colors
INCBIN "gfx/trainers/scientist.gbcpal", middle_colors
INCBIN "gfx/trainers/erika.gbcpal", middle_colors
INCBIN "gfx/trainers/youngster.gbcpal", middle_colors
INCBIN "gfx/trainers/schoolboy.gbcpal", middle_colors
INCBIN "gfx/trainers/bird_keeper.gbcpal", middle_colors
INCBIN "gfx/trainers/lass.gbcpal", middle_colors
INCBIN "gfx/trainers/janine.gbcpal", middle_colors
INCBIN "gfx/trainers/cooltrainer_m.gbcpal", middle_colors
INCBIN "gfx/trainers/cooltrainer_f.gbcpal", middle_colors
INCBIN "gfx/trainers/beauty.gbcpal", middle_colors
INCBIN "gfx/trainers/pokemaniac.gbcpal", middle_colors
INCBIN "gfx/trainers/grunt_m.gbcpal", middle_colors
INCBIN "gfx/trainers/gentleman.gbcpal", middle_colors
INCBIN "gfx/trainers/giovanni.gbcpal", middle_colors
INCBIN "gfx/trainers/cynthia.gbcpal", middle_colors
INCBIN "gfx/trainers/sabrina.gbcpal", middle_colors
INCBIN "gfx/trainers/bug_catcher.gbcpal", middle_colors
INCBIN "gfx/trainers/fisher.gbcpal", middle_colors
INCBIN "gfx/trainers/swimmer_m.gbcpal", middle_colors
INCBIN "gfx/trainers/swimmer_f.gbcpal", middle_colors
INCBIN "gfx/trainers/sailor.gbcpal", middle_colors
INCBIN "gfx/trainers/super_nerd.gbcpal", middle_colors
INCBIN "gfx/trainers/rival2.gbcpal", middle_colors
INCBIN "gfx/trainers/wallace.gbcpal", middle_colors
INCBIN "gfx/trainers/hiker.gbcpal", middle_colors
INCBIN "gfx/trainers/biker.gbcpal", middle_colors
INCBIN "gfx/trainers/blaine.gbcpal", middle_colors
INCBIN "gfx/trainers/steven.gbcpal", middle_colors
INCBIN "gfx/trainers/firebreather.gbcpal", middle_colors
INCBIN "gfx/trainers/leon.gbcpal", middle_colors
INCBIN "gfx/trainers/blackbelt_t.gbcpal", middle_colors
INCBIN "gfx/trainers/executive_m.gbcpal", middle_colors
INCBIN "gfx/trainers/psychic_t.gbcpal", middle_colors
INCBIN "gfx/trainers/picnicker.gbcpal", middle_colors
INCBIN "gfx/trainers/camper.gbcpal", middle_colors
INCBIN "gfx/trainers/executive_f.gbcpal", middle_colors
INCBIN "gfx/trainers/sage.gbcpal", middle_colors
INCBIN "gfx/trainers/medium.gbcpal", middle_colors
INCBIN "gfx/trainers/soldier.gbcpal", middle_colors
INCBIN "gfx/trainers/pokefan_m.gbcpal", middle_colors
INCBIN "gfx/trainers/kimono_girl.gbcpal", middle_colors
INCBIN "gfx/trainers/twins.gbcpal", middle_colors
INCBIN "gfx/trainers/pokefan_f.gbcpal", middle_colors
INCBIN "gfx/trainers/red.gbcpal", middle_colors
INCBIN "gfx/trainers/blue.gbcpal", middle_colors
INCBIN "gfx/trainers/officer.gbcpal", middle_colors
INCBIN "gfx/trainers/grunt_f.gbcpal", middle_colors
INCBIN "gfx/trainers/mysticalman.gbcpal", middle_colors
DeepRedPlayerPalette:
INCBIN "gfx/trainers/invader.gbcpal", middle_colors
INCBIN "gfx/trainers/crystal.gbcpal", middle_colors
INCBIN "gfx/trainers/green.gbcpal", middle_colors
GoldPlayerPalette:
INCBIN "gfx/trainers/lord_oak.gbcpal", middle_colors
INCBIN "gfx/trainers/role_player.gbcpal", middle_colors
INCBIN "gfx/trainers/role_player.gbcpal", middle_colors
INCBIN "gfx/trainers/calFemale.gbcpal", middle_colors
INCBIN "gfx/trainers/dad.gbcpal", middle_colors
INCBIN "gfx/trainers/jonathan.gbcpal", middle_colors
INCBIN "gfx/trainers/ash.gbcpal", middle_colors
INCBIN "gfx/trainers/nurse.gbcpal", middle_colors

	assert_table_length NUM_TRAINER_CLASSES + 1

RedPlayerPalette:
	RGB 31,21,11
	RGB 31,07,01

BluePlayerPalette:
	RGB 31,21,11
	RGB 10,09,31

GreenPlayerPalette:
	RGB 31,21,11
	RGB 07,23,03

BrownPlayerPalette:
	RGB 31,21,11
	RGB 15,10,03

SilverPlayerPalette:
	RGB 31,21,11
	RGB 17,17,17

YellowPlayerPalette:
	RGB 31,21,11
	RGB 31,24,05

PinkPlayerPalette:
	RGB 31,21,11
	RGB 31,12,20

PurplePlayerPalette:
	RGB 31,21,11
	RGB 17,07,25

OrangePlayerPalette:
	RGB 31,21,11
	RGB 31,13,00

DarkGreyPlayerPalette:
	RGB 31,21,11
	RGB 08,08,08

DarkerRedPlayerPalette:
	RGB 18,11,05
	RGB 31,07,01

DarkerBluePlayerPalette:
	RGB 18,11,05
	RGB 10,09,31

DarkerGreenPlayerPalette:
	RGB 18,11,05
	RGB 07,23,03

DarkerBrownPlayerPalette:
	RGB 18,11,05
	RGB 15,10,03

DarkerSilverPlayerPalette:
	RGB 18,11,05
	RGB 17,17,17

DarkerYellowPlayerPalette:
	RGB 18,11,05
	RGB 31,24,05

DarkerPinkPlayerPalette:
	RGB 18,11,05
	RGB 31,12,20

DarkerPurplePlayerPalette:
	RGB 18,11,05
	RGB 17,07,25

DarkerOrangePlayerPalette:
	RGB 18,11,05
	RGB 31,13,00

DarkerDarkGreyPlayerPalette:
	RGB 18,11,05
	RGB 08,08,08

	assert BrownPlayerPalette == RedPlayerPalette + PLAYER_COLOR_BROWN * 2 * COLOR_SIZE
	assert DarkerDarkGreyPlayerPalette + 2 * COLOR_SIZE - RedPlayerPalette == NUM_PLAYER_COLORS * 2 * COLOR_SIZE

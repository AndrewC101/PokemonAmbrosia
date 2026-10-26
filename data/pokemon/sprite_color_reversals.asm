MACRO mon_color_rule
	assert 0 <= \2 && \2 <= 1
	assert 0 <= \3 && \3 <= 1
	db \1, \2 * MON_COLOR_REVERSE_FOLLOWER | \3 * MON_COLOR_SECOND_MENU
ENDM

PokemonSpriteColorRules:
	mon_color_rule CHARMANDER, 1, 1
	mon_color_rule CHARMELEON, 1, 1
	mon_color_rule CHARIZARD, 1, 1
	mon_color_rule VENIPEDE, 1, 1
	mon_color_rule WHIRLIPEDE, 1, 1
	mon_color_rule SCOLIPEDE, 1, 1
	mon_color_rule HONEDGE, 1, 1
	mon_color_rule DOUBLADE, 1, 1
	mon_color_rule RATTATA, 1, 1
	mon_color_rule RATICATE, 0, 1
	mon_color_rule ARBOK, 1, 1
	mon_color_rule NIDORAN_F, 1, 1
	mon_color_rule NIDORINA, 1, 1
	mon_color_rule NIDORAN_M, 1, 1
	mon_color_rule NIDORINO, 1, 1
	mon_color_rule PAWNIARD, 1, 1
	mon_color_rule REGIGIGAS, 1, 1
	mon_color_rule VOLCARONA, 1, 0
	mon_color_rule GROWLITHE, 1, 1
	mon_color_rule ARCANINE, 1, 1
	mon_color_rule POLIWHIRL, 1, 1
	mon_color_rule MACHOP, 1, 1
	mon_color_rule MACHOKE, 1, 1
	mon_color_rule MIMIKYU, 1, 1
	mon_color_rule TENTACOOL, 1, 1
	mon_color_rule TENTACRUEL, 1, 1
	mon_color_rule SLOWPOKE, 1, 1
	mon_color_rule SLOWBRO, 1, 1
	mon_color_rule MAGNEMITE, 1, 1
	mon_color_rule MAGNETON, 1, 1
	mon_color_rule MAMOSWINE, 1, 1
	mon_color_rule ELECTIVIRE, 1, 1
	mon_color_rule MAGNEZONE, 1, 1
	mon_color_rule FERROSEED, 1, 1
	mon_color_rule SHELLDER, 1, 1
	mon_color_rule CLOYSTER, 1, 1
	mon_color_rule GASTLY, 1, 1
	mon_color_rule BAXCALIBUR, 1, 1
	mon_color_rule EXEGGCUTE, 1, 1
	mon_color_rule EXEGGUTOR, 1, 1
	mon_color_rule MARILL, 1, 1
	mon_color_rule AZUMARILL, 1, 1
	mon_color_rule SOLOSIS, 1, 1
	mon_color_rule DUOSION, 1, 1
	mon_color_rule RHYHORN, 1, 1
	mon_color_rule RHYDON, 1, 1
	mon_color_rule HONCHKROW, 1, 1
	mon_color_rule STARYU, 1, 1
	mon_color_rule SCYTHER, 1, 1
	mon_color_rule ELECTABUZZ, 1, 1
	mon_color_rule MAGIKARP, 1, 1
	mon_color_rule DITTO, 1, 1
	mon_color_rule EEVEE, 1, 1
	mon_color_rule RALTS, 1, 1
	mon_color_rule KIRLIA, 1, 1
	mon_color_rule GARDEVOIR, 1, 1
	mon_color_rule AERODACTYL, 1, 1
	mon_color_rule ARTICUNO, 1, 1
	mon_color_rule DRAGONITE, 1, 1
	mon_color_rule MEW, 1, 1
	mon_color_rule TREECKO, 1, 1
	mon_color_rule GROVYLE, 1, 1
	mon_color_rule SCEPTILE, 1, 1
	mon_color_rule RIOLU, 1, 1
	mon_color_rule LUCARIO, 1, 1
	mon_color_rule HOOTHOOT, 1, 1
	mon_color_rule CROBAT, 1, 1
	mon_color_rule FRIGIBAX, 1, 1
	mon_color_rule ARCTIBAX, 1, 1
	mon_color_rule GENESECT, 1, 1
	mon_color_rule MARSHTOMP, 1, 1
	mon_color_rule ESPEON, 1, 1
	mon_color_rule MELTAN, 1, 1
	mon_color_rule GLIGAR, 1, 1
	mon_color_rule GIBLE, 1, 1
	mon_color_rule GABITE, 1, 1
	mon_color_rule GARCHOMP, 1, 1
	mon_color_rule SCIZOR, 1, 1
	mon_color_rule SHAYMIN, 1, 1
	mon_color_rule TEDDIURSA, 1, 1
	mon_color_rule SWINUB, 1, 1
	mon_color_rule PILOSWINE, 1, 1
	mon_color_rule KYOGRE, 1, 1
	mon_color_rule SKARMORY, 1, 1
	mon_color_rule WHIMSICOTT, 1, 1
	mon_color_rule MILTANK, 1, 1
	mon_color_rule LARVITAR, 1, 1
	mon_color_rule PUPITAR, 1, 1
	mon_color_rule TYRANITAR, 1, 1
	mon_color_rule HO_OH, 1, 0
	mon_color_rule CELEBI, 1, 1
	mon_color_rule ARCEUS, 1, 0
	db 0

PURGE mon_color_rule

PokedexTypeSearchStrings:
; entries correspond with PokedexTypeSearchConversionTable (see data/types/search_types.asm)
	table_width POKEDEX_TYPE_STRING_LENGTH, PokedexTypeSearchStrings
	db "        @"
	db " Normal @"
	db "  Fire  @"
	db " Water  @"
	db " GRASS  @"
	db "Electric@"
	db "  Ice   @"
	db "Fighting@"
	db " Poison @"
	db " Ground @"
	db " Flying @"
	db "Psychic @"
	db "  Bug   @"
	db "  Rock  @"
	db " Ghost  @"
	db " Dragon @"
	db "  Dark  @"
	db " Steel  @"
	db " Fairy  @"
	db "  Uber  @"
	;assert_table_length NUM_TYPES

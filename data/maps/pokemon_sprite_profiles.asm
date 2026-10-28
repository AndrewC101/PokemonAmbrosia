LocalPokemonSpriteProfiles:
    db GROUP_ROUTE_32, MAP_ROUTE_32
    dw Route32PokemonProfile
    db GROUP_CERULEAN_CAVE, MAP_CERULEAN_CAVE
    dw CeruleanCavePokemonProfile
    db GROUP_ROUTE_40, MAP_ROUTE_40
    dw Route40PokemonProfile
    db GROUP_ROUTE_41, MAP_ROUTE_41
    dw Route41PokemonProfile
    db GROUP_ROUTE_20, MAP_ROUTE_20
    dw Route20PokemonProfile
    db GROUP_ROUTE_21, MAP_ROUTE_21
    dw Route21PokemonProfile
    db 0

Route32PokemonProfile:
    db 0
    db SEADRA, SHELLDER, POLIWAG, 0
    db 0

CeruleanCavePokemonProfile:
    db SPRITE_SUPER_NERD, 0
    db RAICHU, REGIGIGAS, 0
    db 0

Route40PokemonProfile:
    db SPRITE_BEAUTY, SPRITE_LASS, SPRITE_POKEFAN_M, SPRITE_STANDING_YOUNGSTER, 0
    db 0
    db 0

Route41PokemonProfile:
    db 0
    db 0
    db 0

Route20PokemonProfile:
    db 0
    db 0
    db 0

Route21PokemonProfile:
    db SPRITE_FISHER, 0
    db SQUIRTLE, 0
    db 0

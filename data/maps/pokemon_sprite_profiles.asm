; This defines which sprites on a map don't get full walking graphics
; it used to be that outdoor_sprites defined this for outdoor maps - which sprites get walking frames
; now outdoor_sprites isn't needed as we dynamically reload the sprites we need upon crossing a map connection
LocalPokemonSpriteProfiles:
    db GROUP_ROUTE_38, MAP_ROUTE_38
    dw Route38PokemonProfile
    db GROUP_ROUTE_39, MAP_ROUTE_39
    dw Route39PokemonProfile
    db GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
    dw OlivineCityPokemonProfile
    db GROUP_TIN_TOWER_1F, MAP_TIN_TOWER_1F
    dw TinTower1FPokemonProfile
    db GROUP_BURNED_TOWER_B1F, MAP_BURNED_TOWER_B1F
    dw BurnedTowerB1FPokemonProfile
    db GROUP_ILEX_FOREST, MAP_ILEX_FOREST
    dw IlexForestPokemonProfile
    db GROUP_GOLDENROD_UNDERGROUND, MAP_GOLDENROD_UNDERGROUND
    dw GoldenrodUndergroundPokemonProfile
    db GROUP_CHERRYGROVE_RUINS, MAP_CHERRYGROVE_RUINS
    dw CherrygroveRuinsPokemonProfile
    db GROUP_DRAGONS_DEN_B1F, MAP_DRAGONS_DEN_B1F
    dw DragonsDenB1FPokemonProfile
    db GROUP_ELEMENT_CAVE, MAP_ELEMENT_CAVE
    dw ElementCavePokemonProfile
    db GROUP_SPROUT_TOWER_2F, MAP_SPROUT_TOWER_2F
    dw SproutTower2FPokemonProfile
    db GROUP_SPROUT_TOWER_3F, MAP_SPROUT_TOWER_3F
    dw SproutTower3FPokemonProfile
    db GROUP_SPROUT_TOWER_B1F, MAP_SPROUT_TOWER_B1F
    dw SproutTowerB1FPokemonProfile
    db GROUP_TIN_TOWER_3F, MAP_TIN_TOWER_3F
    dw TinTower3FPokemonProfile
    db GROUP_TIN_TOWER_4F, MAP_TIN_TOWER_4F
    dw TinTower4FPokemonProfile
    db GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F
    dw TinTower5FPokemonProfile
    db GROUP_TIN_TOWER_6F, MAP_TIN_TOWER_6F
    dw TinTower6FPokemonProfile
    db GROUP_TIN_TOWER_7F, MAP_TIN_TOWER_7F
    dw TinTower7FPokemonProfile
    db GROUP_TIN_TOWER_8F, MAP_TIN_TOWER_8F
    dw TinTower8FPokemonProfile
    db GROUP_TIN_TOWER_9F, MAP_TIN_TOWER_9F
    dw TinTower9FPokemonProfile
    db GROUP_WHIRL_ISLAND_NW, MAP_WHIRL_ISLAND_NW
    dw WhirlIslandNWPokemonProfile
    db GROUP_WHIRL_ISLAND_NE, MAP_WHIRL_ISLAND_NE
    dw WhirlIslandNEPokemonProfile
    db GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW
    dw WhirlIslandSWPokemonProfile
    db GROUP_WHIRL_ISLAND_SE, MAP_WHIRL_ISLAND_SE
    dw WhirlIslandSEPokemonProfile
    db GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
    dw WhirlIslandB1FPokemonProfile
    db GROUP_WHIRL_ISLAND_B2F, MAP_WHIRL_ISLAND_B2F
    dw WhirlIslandB2FPokemonProfile
    db GROUP_WHIRL_ISLAND_LUGIA_CHAMBER, MAP_WHIRL_ISLAND_LUGIA_CHAMBER
    dw WhirlIslandLugiaChamberPokemonProfile
    db GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS
    dw TohjoFallsPokemonProfile
    db GROUP_MOUNT_MOON, MAP_MOUNT_MOON
    dw MountMoonPokemonProfile
    db GROUP_RUINS_OF_ALPH_HO_OH_WORD_ROOM, MAP_RUINS_OF_ALPH_HO_OH_WORD_ROOM
    dw RuinsOfAlphHoOhWordRoomPokemonProfile
    db GROUP_RUINS_OF_ALPH_KABUTO_WORD_ROOM, MAP_RUINS_OF_ALPH_KABUTO_WORD_ROOM
    dw RuinsOfAlphKabutoWordRoomPokemonProfile
    db GROUP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_WORD_ROOM
    dw RuinsOfAlphOmanyteWordRoomPokemonProfile
    db GROUP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, MAP_RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
    dw RuinsOfAlphAerodactylWordRoomPokemonProfile
    db GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE
    dw DarkCaveVioletEntrancePokemonProfile
    db GROUP_DARK_CAVE_BLACKTHORN_ENTRANCE, MAP_DARK_CAVE_BLACKTHORN_ENTRANCE
    dw DarkCaveBlackthornEntrancePokemonProfile
    db GROUP_MOUNT_MORTAR_1F_OUTSIDE, MAP_MOUNT_MORTAR_1F_OUTSIDE
    dw MountMortar1FOutsidePokemonProfile
    db GROUP_MOUNT_MORTAR_1F_INSIDE, MAP_MOUNT_MORTAR_1F_INSIDE
    dw MountMortar1FInsidePokemonProfile
    db GROUP_MOUNT_MORTAR_2F_INSIDE, MAP_MOUNT_MORTAR_2F_INSIDE
    dw MountMortar2FInsidePokemonProfile
    db GROUP_MOUNT_MORTAR_B1F, MAP_MOUNT_MORTAR_B1F
    dw MountMortarB1FPokemonProfile
    db GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
    dw IcePath1FPokemonProfile
    db GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
    dw IcePathB1FPokemonProfile
    db GROUP_ICE_PATH_B3F, MAP_ICE_PATH_B3F
    dw IcePathB3FPokemonProfile
    db GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F
    dw RockTunnel1FPokemonProfile
    db GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
    dw RockTunnelB1FPokemonProfile
    db GROUP_DIGLETTS_CAVE, MAP_DIGLETTS_CAVE
    dw DiglettsCavePokemonProfile
    db GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
    dw RuinsOfAlphInnerChamberPokemonProfile
    db GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F
    dw UnionCave1FPokemonProfile
    db GROUP_UNION_CAVE_B1F, MAP_UNION_CAVE_B1F
    dw UnionCaveB1FPokemonProfile
    db GROUP_UNION_CAVE_B2F, MAP_UNION_CAVE_B2F
    dw UnionCaveB2FPokemonProfile
    db GROUP_SLOWPOKE_WELL_B1F, MAP_SLOWPOKE_WELL_B1F
    dw SlowpokeWellB1FPokemonProfile
    db GROUP_SLOWPOKE_WELL_B2F, MAP_SLOWPOKE_WELL_B2F
    dw SlowpokeWellB2FPokemonProfile
    db GROUP_ROUTE_30, MAP_ROUTE_30
    dw Route30PokemonProfile
    db GROUP_ROUTE_31, MAP_ROUTE_31
    dw Route31PokemonProfile
    db GROUP_ROUTE_33, MAP_ROUTE_33
    dw Route33PokemonProfile
    db GROUP_ROUTE_34, MAP_ROUTE_34
    dw Route34PokemonProfile
    db GROUP_ROUTE_35, MAP_ROUTE_35
    dw Route35PokemonProfile
    db GROUP_ROUTE_46, MAP_ROUTE_46
    dw Route46PokemonProfile
    db GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
    dw CherrygroveCityPokemonProfile
    db GROUP_NEW_BARK_TOWN, MAP_NEW_BARK_TOWN
    dw NewBarkTownPokemonProfile
    db GROUP_VIOLET_CITY, MAP_VIOLET_CITY
    dw VioletCityPokemonProfile
    db GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
    dw AzaleaTownPokemonProfile
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

Route30PokemonProfile:
    db 0
    db MUDKIP, 0
    db 0

UnionCave1FPokemonProfile:
UnionCaveB1FPokemonProfile:
UnionCaveB2FPokemonProfile:
SlowpokeWellB1FPokemonProfile:
SlowpokeWellB2FPokemonProfile:
DarkCaveVioletEntrancePokemonProfile:
MountMortar1FOutsidePokemonProfile:
MountMortar1FInsidePokemonProfile:
MountMortar2FInsidePokemonProfile:
MountMortarB1FPokemonProfile:
IcePathB1FPokemonProfile:
IcePathB3FPokemonProfile:
RockTunnel1FPokemonProfile:
DiglettsCavePokemonProfile:
WhirlIslandNWPokemonProfile:
WhirlIslandNEPokemonProfile:
WhirlIslandSWPokemonProfile:
WhirlIslandB2FPokemonProfile:
TohjoFallsPokemonProfile:
MountMoonPokemonProfile:
RuinsOfAlphHoOhWordRoomPokemonProfile:
RuinsOfAlphKabutoWordRoomPokemonProfile:
RuinsOfAlphOmanyteWordRoomPokemonProfile:
SproutTower2FPokemonProfile:
SproutTower3FPokemonProfile:
SproutTowerB1FPokemonProfile:
TinTower3FPokemonProfile:
TinTower4FPokemonProfile:
TinTower5FPokemonProfile:
TinTower6FPokemonProfile:
TinTower7FPokemonProfile:
TinTower8FPokemonProfile:

GoldenrodUndergroundPokemonProfile:
TinTower1FPokemonProfile:
BurnedTowerB1FPokemonProfile:
OlivineCityPokemonProfile:
Route31PokemonProfile:
Route33PokemonProfile:
Route35PokemonProfile:
Route46PokemonProfile:
NewBarkTownPokemonProfile:
    db 0
    db 0
    db 0

Route34PokemonProfile:
    db SPRITE_ROCKET, SPRITE_ROCKET_GIRL, 0
    db 0
    db 0

CherrygroveCityPokemonProfile:
    db SPRITE_TEACHER, SPRITE_FISHER, SPRITE_COOLTRAINER_M, 0
    db 0
    db MAGIKARP, 0

VioletCityPokemonProfile:
    db 0
    db MURKROW, 0
    db 0

AzaleaTownPokemonProfile:
    db 0
    db SLOWPOKE, 0
    db 0

DarkCaveBlackthornEntrancePokemonProfile:
    db 0
    db NOWN, DARKRAI, 0
    db 0

IcePath1FPokemonProfile:
    db 0
    db CLOYSTER, 0
    db 0

RockTunnelB1FPokemonProfile:
    db 0
    db MOLTRES, NOWN, 0
    db 0

RuinsOfAlphInnerChamberPokemonProfile:
    db 0
    db ENTEI, 0
    db 0

WhirlIslandSEPokemonProfile:
    db 0
    db GABITE, 0
    db 0

WhirlIslandB1FPokemonProfile:
    db 0
    db SLOWBRO, 0
    db 0

WhirlIslandLugiaChamberPokemonProfile:
    db 0
    db LUGIA, 0
    db 0

RuinsOfAlphAerodactylWordRoomPokemonProfile:
    db 0
    db NOWN, 0
    db 0

TinTower9FPokemonProfile:
    db 0
    db BELLSPROUT, 0
    db 0

DragonsDenB1FPokemonProfile:
    db 0
    db RAYQUAZA, DRAGONITE, BAGON, GIBLE, 0
    db 0

ElementCavePokemonProfile:
    db 0
    db GROUDON, KYOGRE, 0
    db 0

IlexForestPokemonProfile:
    db SPRITE_ROCKER, SPRITE_LASS, 0
    db VOLCARONA, 0
    db 0

CherrygroveRuinsPokemonProfile:
    db 0
    db MR__MIME, BLISSEY, SMEARGLE, MEW, 0
    db 0

Route38PokemonProfile:
    db 0
    db MAGNEMITE, FERROTHORN, BELDUM, 0
    db 0

Route39PokemonProfile:
    db 0
    db MAWILE, 0
    db 0

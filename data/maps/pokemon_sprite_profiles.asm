; Map entries contain a group/number pair and a pointer to that map's profile:
;     db GROUP_ROUTE_5, MAP_ROUTE_5
;     dw Route5PokemonProfile
;
; Each profile contains three zero-terminated lists, in this order:
; 1. Human SPRITE_* IDs: standing poses for all four facings, no walking frames.
; 2. Pokemon species names: turning poses for all four facings, no stepping frames.
; 3. Pokemon species names: two front-facing frames, supporting down-facing idle animation.
; Use SPRITE_COOLTRAINER_F in list 1, but BLISSEY (not SPRITE_BLISSEY) in lists 2/3.
; An empty list is db 0. Unlisted Pokemon request full walking graphics;
; unlisted humans retain their normal graphics. All allocations must fit VRAM.
;
; These lists select graphics; each object_event's movement selects behavior.
; Rules apply to every object sharing that sprite/species on this map.
; Keep human types needed for trainer approaches or scripted walking out of list 1.
; Duplicate Pokemon of one species share the same graphics allocation.
;
; Normally nine distinct NPC/Pokemon sets can have full walking graphics, plus
; the player. Count shared graphic sets, not objects; repeated actors still use
; separate live-object/OAM slots. Turning/front graphics also have limited space.
; Empty lists request the normal defaults; stationary movement does not itself
; reduce the requested graphics. Excess sets spill into the non-walking pool in
; allocation order, not according to which actors need to walk. Animation/facings
; can then be wrong; if both pools overflow, the fallback suppresses the follower.
; Valid names unused by this map do not load extra graphics or consume space;
; undefined names fail assembly. Listing every NPC/Pokemon requests reduced
; graphics for them, but does not stop wandering or scripted/trainer movement.
; Use one Pokemon list per species; the turning list takes priority over front.
LocalPokemonSpriteProfiles:
    db GROUP_VIOLET_POKECENTER_1F, MAP_VIOLET_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_GOLDENROD_POKECENTER_1F, MAP_GOLDENROD_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_FUCHSIA_POKECENTER_1F, MAP_FUCHSIA_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_INDIGO_PLATEAU_POKECENTER_1F, MAP_INDIGO_PLATEAU_POKECENTER_1F
    dw IndigoPlateauPokecenter1FPokemonProfile
    db GROUP_AZALEA_POKECENTER_1F, MAP_AZALEA_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_BLACKTHORN_POKECENTER_1F, MAP_BLACKTHORN_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_CELADON_POKECENTER_1F, MAP_CELADON_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_CERULEAN_POKECENTER_1F, MAP_CERULEAN_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_CIANWOOD_POKECENTER_1F, MAP_CIANWOOD_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_ECRUTEAK_POKECENTER_1F, MAP_ECRUTEAK_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_LAVENDER_POKECENTER_1F, MAP_LAVENDER_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_MAHOGANY_POKECENTER_1F, MAP_MAHOGANY_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_PEWTER_POKECENTER_1F, MAP_PEWTER_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_SAFFRON_POKECENTER_1F, MAP_SAFFRON_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_SILVER_CAVE_POKECENTER_1F, MAP_SILVER_CAVE_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_VERMILION_POKECENTER_1F, MAP_VERMILION_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_VIRIDIAN_POKECENTER_1F, MAP_VIRIDIAN_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_OLIVINE_POKECENTER_1F, MAP_OLIVINE_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_CHERRYGROVE_POKECENTER_1F, MAP_CHERRYGROVE_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_CINNABAR_POKECENTER_1F, MAP_CINNABAR_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_ROUTE_32_POKECENTER_1F, MAP_ROUTE_32_POKECENTER_1F
    dw PokecenterPokemonProfile
    db GROUP_ROUTE_29, MAP_ROUTE_29
    dw Route29PokemonProfile
    db GROUP_ROUTE_11, MAP_ROUTE_11
    dw Route11PokemonProfile
    db GROUP_ANCIENT_RUIN_PRESENT, MAP_ANCIENT_RUIN_PRESENT
    dw AncientRuinPresentPokemonProfile
    db GROUP_ANCIENT_RUIN_PAST, MAP_ANCIENT_RUIN_PAST
    dw AncientRuinPastPokemonProfile
    db GROUP_MUSEUM, MAP_MUSEUM
    dw MuseumPokemonProfile
    db GROUP_ABYSS, MAP_ABYSS
    dw AbyssPokemonProfile
    db GROUP_MOUNT_MOON_SQUARE, MAP_MOUNT_MOON_SQUARE
    dw MountMoonSquarePokemonProfile
    db GROUP_TIN_TOWER_ROOF, MAP_TIN_TOWER_ROOF
    dw TinTowerRoofPokemonProfile
    db GROUP_ANCIENT_HALL, MAP_ANCIENT_HALL
    dw AncientHallPokemonProfile
    db GROUP_ANCIENT_HALL_STAIRS, MAP_ANCIENT_HALL_STAIRS
    dw AncientHallStairsPokemonProfile
    db GROUP_OLD_LIGHTHOUSE, MAP_OLD_LIGHTHOUSE
    dw OldLighthousePokemonProfile
    db GROUP_CINNABAR_LAB, MAP_CINNABAR_LAB
    dw CinnabarLabPokemonProfile
    db GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST
    dw NationalParkBugContestPokemonProfile
    db GROUP_RADIO_TOWER_2F, MAP_RADIO_TOWER_2F
    dw RadioTower2FPokemonProfile
    db GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F
    dw RadioTower4FPokemonProfile
    db GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F
    dw OlivineLighthouse6FPokemonProfile
    db GROUP_TEAM_ROCKET_BASE_B1F, MAP_TEAM_ROCKET_BASE_B1F
    dw TeamRocketBaseB1FPokemonProfile
    db GROUP_TEAM_ROCKET_BASE_B2F, MAP_TEAM_ROCKET_BASE_B2F
    dw TeamRocketBaseB2FPokemonProfile
    db GROUP_TEAM_ROCKET_BASE_B3F, MAP_TEAM_ROCKET_BASE_B3F
    dw TeamRocketBaseB3FPokemonProfile
    db GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
    dw SilverCaveOutsidePokemonProfile
    db GROUP_SILVER_CAVE_ROOM_3, MAP_SILVER_CAVE_ROOM_3
    dw SilverCaveRoom3PokemonProfile
    db GROUP_SILVER_CAVE_ROOM_1, MAP_SILVER_CAVE_ROOM_1
    dw SilverCaveRoom1PokemonProfile
    db GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2
    dw SilverCaveRoom2PokemonProfile
    db GROUP_SILVER_CAVE_ITEM_ROOMS, MAP_SILVER_CAVE_ITEM_ROOMS
    dw SilverCaveItemRoomsPokemonProfile
    db GROUP_VIRIDIAN_FOREST, MAP_VIRIDIAN_FOREST
    dw ViridianForestPokemonProfile
    db GROUP_ROUTE_19, MAP_ROUTE_19
    dw Route19PokemonProfile
    db GROUP_CAPE_STORM, MAP_CAPE_STORM
    dw CapeStormPokemonProfile
    db GROUP_SEAFOAM_CAVE, MAP_SEAFOAM_CAVE
    dw SeafoamCavePokemonProfile
    db GROUP_ROUTE_26, MAP_ROUTE_26
    dw Route26PokemonProfile
    db GROUP_ROUTE_27, MAP_ROUTE_27
    dw Route27PokemonProfile
    db GROUP_ROUTE_28, MAP_ROUTE_28
    dw Route28PokemonProfile
    db GROUP_ROUTE_1, MAP_ROUTE_1
    dw Route1PokemonProfile
    db GROUP_ROUTE_2, MAP_ROUTE_2
    dw Route2PokemonProfile
    db GROUP_ROUTE_3, MAP_ROUTE_3
    dw Route3PokemonProfile
    db GROUP_ROUTE_22, MAP_ROUTE_22
    dw Route22PokemonProfile
    db GROUP_ROUTE_7, MAP_ROUTE_7
    dw Route7PokemonProfile
    db GROUP_ROUTE_16, MAP_ROUTE_16
    dw Route16PokemonProfile
    db GROUP_ROUTE_17, MAP_ROUTE_17
    dw Route17PokemonProfile
    db GROUP_CELADON_CITY, MAP_CELADON_CITY
    dw CeladonCityPokemonProfile
    db GROUP_ROUTE_13, MAP_ROUTE_13
    dw Route13PokemonProfile
    db GROUP_ROUTE_14, MAP_ROUTE_14
    dw Route14PokemonProfile
    db GROUP_ROUTE_15, MAP_ROUTE_15
    dw Route15PokemonProfile
    db GROUP_ROUTE_18, MAP_ROUTE_18
    dw Route18PokemonProfile
    db GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
    dw FuchsiaCityPokemonProfile
    db GROUP_ROUTE_8, MAP_ROUTE_8
    dw Route8PokemonProfile
    db GROUP_ROUTE_10_SOUTH, MAP_ROUTE_10_SOUTH
    dw Route10SouthPokemonProfile
    db GROUP_LAVENDER_TOWN, MAP_LAVENDER_TOWN
    dw LavenderTownPokemonProfile
    db GROUP_ROUTE_12, MAP_ROUTE_12
    dw Route12PokemonProfile
    db GROUP_ROUTE_5, MAP_ROUTE_5
    dw Route5PokemonProfile
    db GROUP_ROUTE_6, MAP_ROUTE_6
    dw Route6PokemonProfile
    db GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
    dw SaffronCityPokemonProfile
    db GROUP_VERMILION_CITY, MAP_VERMILION_CITY
    dw VermilionCityPokemonProfile
    db GROUP_ROUTE_4, MAP_ROUTE_4
    dw Route4PokemonProfile
    db GROUP_ROUTE_9, MAP_ROUTE_9
    dw Route9PokemonProfile
    db GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH
    dw Route10NorthPokemonProfile
    db GROUP_ROUTE_25, MAP_ROUTE_25
    dw Route25PokemonProfile
    db GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
    dw CeruleanCityPokemonProfile
    db GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
    dw CianwoodCityPokemonProfile
    db GROUP_ROUTE_36, MAP_ROUTE_36
    dw Route36PokemonProfile
    db GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
    dw RuinsOfAlphOutsidePokemonProfile
    db GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
    dw NationalParkPokemonProfile
    db GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
    dw GoldenrodCityPokemonProfile
    db GROUP_ROUTE_45, MAP_ROUTE_45
    dw Route45PokemonProfile
    db GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
    dw BlackthornCityPokemonProfile
    db GROUP_ROUTE_43, MAP_ROUTE_43
    dw Route43PokemonProfile
    db GROUP_LAKE_OF_RAGE, MAP_LAKE_OF_RAGE
    dw LakeOfRagePokemonProfile
    db GROUP_ROUTE_42, MAP_ROUTE_42
    dw Route42PokemonProfile
    db GROUP_ROUTE_44, MAP_ROUTE_44
    dw Route44PokemonProfile
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
    db RAICHU, 0
    db REGIGIGAS, 0

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


BlackthornCityPokemonProfile:
RuinsOfAlphOutsidePokemonProfile:
GoldenrodCityPokemonProfile:

Route10NorthPokemonProfile:
Route25PokemonProfile:
CeruleanCityPokemonProfile:
Route6PokemonProfile:
SaffronCityPokemonProfile:
Route8PokemonProfile:
Route10SouthPokemonProfile:
LavenderTownPokemonProfile:
Route12PokemonProfile:
Route14PokemonProfile:
Route18PokemonProfile:
FuchsiaCityPokemonProfile:
Route15PokemonProfile:
Route7PokemonProfile:
Route16PokemonProfile:
Route17PokemonProfile:
CeladonCityPokemonProfile:
Route1PokemonProfile:
Route2PokemonProfile:
Route3PokemonProfile:
Route22PokemonProfile:
Route27PokemonProfile:
Route19PokemonProfile:
CapeStormPokemonProfile:


NationalParkBugContestPokemonProfile:
RadioTower2FPokemonProfile:
RadioTower4FPokemonProfile:
OlivineLighthouse6FPokemonProfile:
TeamRocketBaseB1FPokemonProfile:
TeamRocketBaseB3FPokemonProfile:
AncientHallStairsPokemonProfile:
MountMoonSquarePokemonProfile:

Route11PokemonProfile:
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
    db NOWN, 0
    db DARKRAI, 0

IcePath1FPokemonProfile:
    db 0
    db CLOYSTER, 0
    db 0

RockTunnelB1FPokemonProfile:
    db 0
    db NOWN, 0
    db MOLTRES, 0

RuinsOfAlphInnerChamberPokemonProfile:
    db 0
    db 0
    db ENTEI, 0

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
    db 0
    db LUGIA, 0

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
    db DRAGONITE, BAGON, GIBLE, 0
    db RAYQUAZA, 0

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
    db MR__MIME, BLISSEY, SMEARGLE, 0
    db MEW, 0

Route38PokemonProfile:
    db 0
    db MAGNEMITE, FERROTHORN, BELDUM, 0
    db 0

Route39PokemonProfile:
    db 0
    db MAWILE, 0
    db 0

Route42PokemonProfile:
    db 0
    db MAGMAR, 0
    db 0

Route44PokemonProfile:
    db 0
    db CHANSEY, TOGEKISS, 0
    db 0

Route43PokemonProfile:
    db 0
    db ABOMASNOW, EXEGGUTOR, BRELOOM, 0
    db 0

LakeOfRagePokemonProfile:
    db 0
    db SALAMENCE, 0
    db 0

Route45PokemonProfile:
    db 0
    db EXCADRILL, FRIGIBAX, 0
    db RAIKOU, 0

Route36PokemonProfile:
    db 0
    db ZUBAT, NIDOQUEEN, NIDOKING, 0
    db 0

NationalParkPokemonProfile:
    db 0
    db EXEGGCUTE, KIRLIA, TEDDIURSA, CHARIZARD, 0
    db 0

CianwoodCityPokemonProfile:
    db SPRITE_STANDING_YOUNGSTER, SPRITE_COOLTRAINER_F, 0
    db GURDURR, MEWTWO, POLIWRATH, 0
    db 0

Route4PokemonProfile:
    db 0
    db BLASTOISE, 0
    db 0

Route9PokemonProfile:
    db 0
    db METANG, FERROTHORN, 0
    db 0

Route5PokemonProfile:
    db 0
    db 0
    db BLISSEY, 0

VermilionCityPokemonProfile:
    db SPRITE_GRAMPS, 0
    db 0
    db 0

Route13PokemonProfile:
    db 0
    db FERROTHORN, 0
    db 0

Route26PokemonProfile:
    db 0
    db GALVANTULA, EXEGGUTOR, BLISSEY, 0
    db 0

Route28PokemonProfile:
    db 0
    db BLISSEY, 0
    db 0

SeafoamCavePokemonProfile:
    db 0
    db 0
    db ARTICUNO, 0

SilverCaveRoom1PokemonProfile:
    db 0
    db HOUNDOOM, AEGISLASH, 0
    db 0

SilverCaveRoom2PokemonProfile:
    db 0
    db MACHAMP, 0
    db MELMETAL, 0

SilverCaveItemRoomsPokemonProfile:
    db 0
    db LUCARIO, ALAKAZAM, 0
    db PALKIA, DIALGA, 0

ViridianForestPokemonProfile:
    db 0
    db VOLCARONA, STARAPTOR, 0
    db SHAYMIN, 0

SilverCaveOutsidePokemonProfile:
    db 0
    db STARAPTOR, GALVANTULA, VOLCARONA, ABOMASNOW, 0
    db 0

SilverCaveRoom3PokemonProfile:
    db 0
    db MEWTWO, HO_OH, DRAGONITE, TYRANITAR, SALAMENCE, METAGROSS, GARCHOMP, HYDREIGON, 0
    db 0

TeamRocketBaseB2FPokemonProfile:
    db 0
    db MAGNETON, 0
    db 0

AncientHallPokemonProfile:
    db 0
    db 0
    db ZYGARDE, 0

OldLighthousePokemonProfile:
    db 0
    db 0
    db ZAPDOS, 0

CinnabarLabPokemonProfile:
    db SPRITE_SCIENTIST, 0
    db MEWTWO, DITTO, MAGMORTAR, 0
    db GENESECT, 0

TinTowerRoofPokemonProfile:
    db 0
    db 0
    db HO_OH, 0

AncientRuinPresentPokemonProfile:
    db SPRITE_SAGE, 0
    db 0
    db YVELTAL, 0

AncientRuinPastPokemonProfile:
    db SPRITE_FISHER, SPRITE_COOLTRAINER_M, SPRITE_LASS, SPRITE_BEAUTY, SPRITE_RED, 0
    db 0
    db ARCEUS, XERNEAS, 0

MuseumPokemonProfile:
    db 0
    db 0
    db DEOXYS, 0

AbyssPokemonProfile:
    db SPRITE_SAGE, SPRITE_LANCE, 0
    db DRAGONITE, 0
    db DARKRAI, MELMETAL, GIRATINA, 0

Route29PokemonProfile:
    db SPRITE_YOUNGSTER, SPRITE_BEAUTY, SPRITE_FISHER, SPRITE_COOLTRAINER_F, 0
    db 0
    db 0

IndigoPlateauPokecenter1FPokemonProfile:
    db 0
    db 0
    db BLISSEY, ALAKAZAM, 0

PokecenterPokemonProfile:
    db 0
    db 0
    db BLISSEY, 0

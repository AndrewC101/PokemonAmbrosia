; DevNote - Scenes - Here is how cutscenes work

; Scenes are tightly coupled with the map they are on
; This file defines the mapping between map and a variable in wram representing scenes on that map
; You need to add a wram variable and an entry here if you want scenes to play on a map

; Each map has a numerical value called sceneId assigned to it, the default is 0, represented by SCENE_DEFAULT
; When the player walks on a coord_event tile it checks the sceneId for that event, SCENE_DEFAULT = 0, SCENE_ALWAYS = -1 etc
; If the sceneId of the map and the coord_event match then the scene plays, unless using SCENE_ALWAYS which always play

; I have added some custom sceneIds, SCENE_CUSTOM_1 = 101, SCENE_CUSTOM_2 = 102, down to SCENE_CUSTOM_9

; The scenes on a map need to happen sequentially, starting with SCENE_DEFAULT = 0
; When SCENE_DEFAULT has played you can set the maps sceneId to whichever scene should come next
; This is done via - setmapscene MAP_NAME, SCENE_ID - you can do this anywhere
; By convention the maps sceneId should have a final state of SCENE_FINISHED = 1, no coord_events should use that Id

MACRO scene_var
; map, variable
	map_id \1
	dw \2
ENDM

MapScenes::
	scene_var POKECENTER_2F,                               wPokecenter2FSceneID
	scene_var TRADE_CENTER,                                wTradeCenterSceneID
	scene_var COLOSSEUM,                                   wColosseumSceneID
	scene_var TIME_CAPSULE,                                wTimeCapsuleSceneID
	scene_var POWER_PLANT,                                 wPowerPlantSceneID
	scene_var CERULEAN_GYM,                                wCeruleanGymSceneID
	scene_var ROUTE_25,                                    wRoute25SceneID
	scene_var TRAINER_HOUSE_B1F,                           wTrainerHouseB1FSceneID
	scene_var VICTORY_ROAD_GATE,                           wVictoryRoadGateSceneID
	scene_var SAFFRON_MAGNET_TRAIN_STATION,                wSaffronMagnetTrainStationSceneID
	scene_var ROUTE_16_GATE,                               wRoute16GateSceneID
	scene_var ROUTE_17_ROUTE_18_GATE,                      wRoute17Route18GateSceneID
	scene_var INDIGO_PLATEAU_POKECENTER_1F,                wIndigoPlateauPokecenter1FSceneID
	scene_var WILLS_ROOM,                                  wWillsRoomSceneID
	scene_var KOGAS_ROOM,                                  wKogasRoomSceneID
	scene_var BRUNOS_ROOM,                                 wBrunosRoomSceneID
	scene_var KARENS_ROOM,                                 wKarensRoomSceneID
	scene_var LANCES_ROOM,                                 wLancesRoomSceneID
	scene_var HALL_OF_FAME,                                wHallOfFameSceneID
	scene_var ROUTE_27,                                    wRoute27SceneID
	scene_var NEW_BARK_TOWN,                               wNewBarkTownSceneID
	scene_var ELMS_LAB,                                    wElmsLabSceneID
	scene_var PLAYERS_HOUSE_1F,                            wPlayersHouse1FSceneID
	scene_var ROUTE_29,                                    wRoute29SceneID
	scene_var CHERRYGROVE_CITY,                            wCherrygroveCitySceneID
	scene_var MR_POKEMONS_HOUSE,                           wMrPokemonsHouseSceneID
	scene_var ROUTE_32,                                    wRoute32SceneID
	scene_var ROUTE_35_NATIONAL_PARK_GATE,                 wRoute35NationalParkGateSceneID
	scene_var ROUTE_36,                                    wRoute36SceneID
	scene_var ROUTE_36_NATIONAL_PARK_GATE,                 wRoute36NationalParkGateSceneID
	scene_var AZALEA_TOWN,                                 wAzaleaTownSceneID
	scene_var GOLDENROD_GYM,                               wGoldenrodGymSceneID
	scene_var GOLDENROD_MAGNET_TRAIN_STATION,              wGoldenrodMagnetTrainStationSceneID
	scene_var GOLDENROD_POKECENTER_1F,                     wGoldenrodPokecenter1FSceneID
	scene_var OLIVINE_CITY,                                wOlivineCitySceneID
	scene_var ROUTE_34,                                    wRoute34SceneID ; unused
	scene_var ROUTE_34_ILEX_FOREST_GATE,                   wRoute34IlexForestGateSceneID ; unused
	scene_var ECRUTEAK_TIN_TOWER_ENTRANCE,                 wEcruteakTinTowerEntranceSceneID
	scene_var WISE_TRIOS_ROOM,                             wWiseTriosRoomSceneID
	scene_var ECRUTEAK_POKECENTER_1F,                      wEcruteakPokecenter1FSceneID
	scene_var ECRUTEAK_GYM,                                wEcruteakGymSceneID
	scene_var MAHOGANY_TOWN,                               wMahoganyTownSceneID
	scene_var ROUTE_42,                                    wRoute42SceneID
	scene_var CIANWOOD_CITY,                               wCianwoodCitySceneID
	scene_var BATTLE_TOWER_1F,                             wBattleTower1FSceneID
	scene_var BATTLE_TOWER_BATTLE_ROOM,                    wBattleTowerBattleRoomSceneID
	scene_var BATTLE_TOWER_ELEVATOR,                       wBattleTowerElevatorSceneID
	scene_var BATTLE_TOWER_HALLWAY,                        wBattleTowerHallwaySceneID
	scene_var BATTLE_TOWER_OUTSIDE,                        wBattleTowerOutsideSceneID
	scene_var ROUTE_43_GATE,                               wRoute43GateSceneID
	scene_var MOUNT_MOON,                                  wMountMoonSceneID
	scene_var SPROUT_TOWER_3F,                             wSproutTower3FSceneID
	scene_var TIN_TOWER_1F,                                wTinTower1FSceneID
	scene_var BURNED_TOWER_1F,                             wBurnedTower1FSceneID
	scene_var BURNED_TOWER_B1F,                            wBurnedTowerB1FSceneID
	scene_var RADIO_TOWER_5F,                              wRadioTower5FSceneID
	scene_var RUINS_OF_ALPH_OUTSIDE,                       wRuinsOfAlphOutsideSceneID
	scene_var RUINS_OF_ALPH_RESEARCH_CENTER,               wRuinsOfAlphResearchCenterSceneID
	scene_var RUINS_OF_ALPH_HO_OH_CHAMBER,                 wRuinsOfAlphHoOhChamberSceneID
	scene_var RUINS_OF_ALPH_KABUTO_CHAMBER,                wRuinsOfAlphKabutoChamberSceneID
	scene_var RUINS_OF_ALPH_OMANYTE_CHAMBER,               wRuinsOfAlphOmanyteChamberSceneID
	scene_var RUINS_OF_ALPH_AERODACTYL_CHAMBER,            wRuinsOfAlphAerodactylChamberSceneID
	scene_var RUINS_OF_ALPH_INNER_CHAMBER,                 wRuinsOfAlphInnerChamberSceneID
	scene_var MAHOGANY_MART_1F,                            wMahoganyMart1FSceneID
	scene_var TEAM_ROCKET_BASE_B1F,                        wTeamRocketBaseB1FSceneID
	scene_var TEAM_ROCKET_BASE_B2F,                        wTeamRocketBaseB2FSceneID
	scene_var TEAM_ROCKET_BASE_B3F,                        wTeamRocketBaseB3FSceneID
	scene_var GOLDENROD_UNDERGROUND_SWITCH_ROOM_ENTRANCES, wGoldenrodUndergroundSwitchRoomEntrancesSceneID
	scene_var SILVER_CAVE_ROOM_3,                          wSilverCaveRoom3SceneID ; unused
	scene_var VICTORY_ROAD,                                wVictoryRoadSceneID
	scene_var DRAGONS_DEN_B1F,                             wDragonsDenB1FSceneID
	scene_var DRAGON_SHRINE,                               wDragonShrineSceneID
	scene_var OLIVINE_PORT,                                wOlivinePortSceneID
	scene_var VERMILION_PORT,                              wVermilionPortSceneID
	scene_var FAST_SHIP_1F,                                wFastShip1FSceneID
	scene_var FAST_SHIP_B1F,                               wFastShipB1FSceneID
	scene_var MOUNT_MOON_SQUARE,                           wMountMoonSquareSceneID
	scene_var MOBILE_TRADE_ROOM,                           wMobileTradeRoomSceneID
	scene_var MOBILE_BATTLE_ROOM,                          wMobileBattleRoomSceneID
	scene_var ECRUTEAK_CITY,                               wEcruteakCitySceneID
	scene_var HALL_OF_ORIGIN,                              wHallOfOriginSceneID
	scene_var ANCIENT_TEMPLE,                              wAncientTempleSceneID
	scene_var ANCIENT_RUIN_PRESENT,                        wAncientRuinPresentSceneID
	scene_var CERULEAN_CAVE,                               wCeruleanCaveSceneID
	scene_var DESTINY_ELITE_FOUR,                          wDestinyEliteFourSceneID
	scene_var DESTINY_FRONTIER,                            wDestinyFrontierSceneID
	scene_var DESTINY_SQUARE,                              wDestinySquareSceneID
	scene_var GOLDENROD_CITY,                              wGoldenrodCitySceneID
	scene_var PALLET_TOWN,                                 wPalletTownSceneID
	scene_var RADIO_TOWER_1F,                              wRadioTower1FSceneID
	scene_var ROUTE_22,                                    wRoute22SceneID
	scene_var ROUTE_26,                                    wRoute26SceneID
	scene_var ROUTE_31,                                    wRoute31SceneID
	scene_var ROUTE_44,                                    wRoute44SceneID
	scene_var SILVER_CAVE_ITEM_ROOMS,                      wSilverCaveItemRoomsSceneID
	scene_var SILVER_CAVE_OUTSIDE,                         wSilverCaveOutsideSceneID
	scene_var VERMILION_CITY,                              wVermilionCitySceneID
	scene_var VIOLET_CITY,                                 wVioletCitySceneID
	scene_var VIRIDIAN_GYM,                                wViridianGymSceneID
	db -1 ; end

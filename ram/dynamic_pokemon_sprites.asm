SECTION "Dynamic Pokemon sprites", WRAMX[$d400], BANK[2]
wDynamicSpriteState::
wDynamicSpriteBindings:: ds NUM_DYNAMIC_POKEMON_SPRITES
wDynamicSpriteOldBindings:: ds NUM_DYNAMIC_POKEMON_SPRITES
wDynamicSpriteCacheValid:: db
wDynamicSpriteCacheProfile:: db
wDynamicSpriteTargetProfile:: db
wDynamicSpriteRecordCount:: db
wDynamicSpriteTargetCount:: db
wDynamicSpriteIndex:: db
wDynamicSpriteRecords:: ds SPRITE_GFX_LIST_CAPACITY * DYNAMIC_SPRITE_RECORD_LENGTH
wDynamicSpriteTargetRecords:: ds SPRITE_GFX_LIST_CAPACITY * DYNAMIC_SPRITE_RECORD_LENGTH
wDynamicSpriteStateEnd::
wDynamicMapProfilePointer:: dw
wMapPokemonAliases:: ds NUM_MAP_POKEMON_ALIASES * 2
wDynamicSpriteStateMemoryEnd::
assert wDynamicSpriteStateMemoryEnd <= $d600

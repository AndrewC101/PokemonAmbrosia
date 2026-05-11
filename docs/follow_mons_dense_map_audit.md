# Follow-Mons Dense Map Audit

This file tracks map object-event pressure for the current follow-mon port.

## Current slot model

With the current port shape:

- map object slot `0` = player
- map object slot `1` = reserved follower template
- map object slots `2..17` = normal map objects

That leaves **16 usable `object_event` slots** per map.

Implications:

- maps with **17 `object_event`s** must lose at least one object
- maps with **16 `object_event`s** still fit, but have no spare room

## Maps that must be reduced

These maps currently have **17 `object_event`s** and need at least one object removed:

- `maps/DragonsDenB1F.asm`
- `maps/LakeOfRage.asm`
- `maps/NationalPark.asm`
- `maps/Route29.asm`
- `maps/Route32.asm`
- `maps/Route43.asm`
- `maps/WarZone.asm`

## Maps already at the limit

These maps currently have **16 `object_event`s** and fit exactly, but have no margin:

- `maps/Abyss.asm`
- `maps/AncientRuinPast.asm`
- `maps/CherrygroveCity.asm`
- `maps/CianwoodCity.asm`
- `maps/DestinyFrontier.asm`
- `maps/DestinyPark.asm`
- `maps/GoldenrodCity.asm`
- `maps/HallOfOrigin.asm`
- `maps/MountMortar1FInside.asm`
- `maps/Route2.asm`
- `maps/Route30.asm`
- `maps/Route34.asm`
- `maps/Route36.asm`
- `maps/Route41.asm`
- `maps/Route45.asm`
- `maps/VictoryRoad.asm`

## Temporary runtime guard

The current port includes a temporary clamp in `home/map.asm` so dense maps do not overflow the reserved follower slot during bring-up.

That means:

- the 17-object maps do not currently crash from this issue alone
- they may silently lose late objects until the map cleanup is done

This guard is only for bring-up. Final follow-mon enablement should not rely on it.

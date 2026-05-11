# Follow-Mons Dense Map Audit

This file tracks map object-event pressure for the current follow-mon port.

## Current slot model

With the current port shape:

- map object slot `0` = player
- map object slot `1` = reserved follower template
- map object slots `2..17` = normal map objects

That leaves **16 usable `object_event` slots** per map.

Implication:

- maps with **16 `object_event`s** still fit, but have no spare room
- there are currently **22** red-zone maps at that ceiling

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
- `maps/LakeOfRage.asm`
- `maps/MountMortar1FInside.asm`
- `maps/NationalPark.asm`
- `maps/Route2.asm`
- `maps/Route29.asm`
- `maps/Route30.asm`
- `maps/Route32.asm`
- `maps/Route34.asm`
- `maps/Route36.asm`
- `maps/Route41.asm`
- `maps/Route43.asm`
- `maps/Route45.asm`
- `maps/VictoryRoad.asm`
- `maps/WarZone.asm`

## Maps previously reduced

The original 17-object overflow set has now been fixed.

Those maps were:

- `maps/DragonsDenB1F.asm`
- `maps/LakeOfRage.asm`
- `maps/NationalPark.asm`
- `maps/Route29.asm`
- `maps/Route32.asm`
- `maps/Route43.asm`
- `maps/WarZone.asm`

## Runtime guard status

The temporary bring-up clamp in `home/map.asm` has been removed now that the 17-object maps have been reduced.

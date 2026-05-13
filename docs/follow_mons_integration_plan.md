# Follow Mons Integration Plan

## Purpose

This document turns the follow-mons feasibility assessment into a concrete implementation plan for `PokemonTrueCrystal`.

The goal is to add a party follower system derived from `fellowship-of-the-roms/pokecrystal` branch `follow-mons`, while preserving this repo's custom species roster, field-mon systems, map scripting, and current ROM layout.

## Recommendation

Do not attempt a direct merge of `fellowship/follow-mons` into this repo.

Treat this as a staged backport of selected systems from `follow-mons` into the current codebase.

Reason:

- This repo diverged from `fellowship/master` at commit `2adcca003` dated **2022-06-21**.
- `fellowship/master` is now at commit `cf8ee5424` dated **2025-11-13**.
- `fellowship/follow-mons` is at commit `28da8e085` dated **2025-11-15**.
- Relative to `fellowship/master`, this repo is `1502` commits ahead and `229` behind.
- Relative to `fellowship/master`, `follow-mons` is only `23` commits ahead.

That means a normal merge would drag in years of upstream drift plus this project's own heavy custom work. The correct model is "port the feature," not "merge the branch."

## Verified Local Constraints

### Object and map limits

Current local values:

- `NUM_OBJECT_STRUCTS = 13` in [constants/map_object_constants.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/constants/map_object_constants.asm:38)
- `NUM_OBJECTS = 18` in [constants/map_object_constants.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/constants/map_object_constants.asm:100)

`follow-mons` changes those to:

- `NUM_OBJECT_STRUCTS = 14`
- `NUM_OBJECTS = 17`
- dedicated `FOLLOWER` object id in [follow-mons/constants/script_constants.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/.tmp-follow-mons/constants/script_constants.asm:3)
- dedicated follower movement/object mode in [follow-mons/constants/map_object_constants.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/.tmp-follow-mons/constants/map_object_constants.asm:159)

Implication:

- The follower consumes a reserved map-object slot.
- Maps with `17` `object_event`s must be reduced or handled specially.
- Maps with `16` `object_event`s become red-zone maps and need explicit review.

The original `17`-object overflow set has now been fixed. The current red-zone maps are the ones at `16` object events:

- `Abyss.asm`
- `AncientRuinPast.asm`
- `CherrygroveCity.asm`
- `CianwoodCity.asm`
- `DestinyFrontier.asm`
- `DestinyPark.asm`
- `GoldenrodCity.asm`
- `HallOfOrigin.asm`
- `LakeOfRage.asm`
- `MountMortar1FInside.asm`
- `NationalPark.asm`
- `Route2.asm`
- `Route29.asm`
- `Route30.asm`
- `Route32.asm`
- `Route34.asm`
- `Route36.asm`
- `Route41.asm`
- `Route43.asm`
- `Route45.asm`
- `VictoryRoad.asm`
- `WarZone.asm`

### ROM and RAM headroom

From [pokecrystal.map](C:/cygwin64/home/Andrew/PokemonTrueCrystal/pokecrystal.map:1):

- `ROM0: 16065 bytes used / 319 free`
- `ROMX: 1801306 bytes used / 246694 free in 125 banks`
- `WRAM0: 4043 bytes used / 53 free`
- `WRAMX: 22992 bytes used / 5680 free in 7 banks`

Implication:

- Total ROM space is not the blocker.
- `ROM0` is tight and may require moving code out of home bank.
- `WRAM0` is tight and must be watched carefully during the port.
- `WRAMX` is comfortable and can absorb helper data if needed.

Also note:

- [layout.link](C:/cygwin64/home/Andrew/PokemonTrueCrystal/layout.link:309), [layout.link](C:/cygwin64/home/Andrew/PokemonTrueCrystal/layout.link:311), and [layout.link](C:/cygwin64/home/Andrew/PokemonTrueCrystal/layout.link:313) show late-bank layout. `ROMX $7d` is already assigned to `Crystal Events`, while `ROMX $7e` and `ROMX $7f` are available for new placement work.
- The repo is already a 2 MB ROM, so the concern is bank placement and hot-bank pressure, not global ROM size.

### Species and follower art gap

Current local species count:

- `NUM_POKEMON = 253` in [constants/pokemon_constants.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/constants/pokemon_constants.asm:276)

The `follow-mons` branch ships follower assets for the older roster only.

Verified gaps:

- local `base_stats` files: `254` entries including `egg`-adjacent roster files
- `follow-mons` follower PNGs: `278` files including Unown letters and egg
- local species/forms with no matching follower asset basename: `118`

Implication:

- Art is the largest workload after engine integration.
- The missing set is not trivial "recent additions"; it covers a large fraction of this repo's custom dex.

## Scope Definition

### In scope

- One visible party follower on the overworld
- Follower spawn/despawn across warps, scripts, interiors, and special transitions
- Species-based follower graphics using dedicated follower assets
- Basic follower interaction script
- Compatibility with this repo's field-mon and overworld-mon systems
- Map-by-map object budget fixes where needed
- Follower art pipeline for the local dex

### Out of scope for phase 1

- Porting every flavor interaction script from `engine/events/follower.asm`
- Exact branch parity with all `follow-mons` map edits
- Reworking all existing map scenes to showcase follower interactions
- Cosmetic polish for every edge case before core stability is proven

## Success Criteria

Phase-1 success means:

1. Follower appears using the first alive party mon.
2. Follower survives normal walking, doors, warps, map transitions, and scripted movement.
3. Follower does not corrupt object structs, object masks, map objects, or sprite VRAM.
4. No current map exceeds effective object capacity.
5. Missing follower assets are tracked and can be integrated incrementally.

## Port Strategy

## Phase 0 - Branch Setup and Diff Capture

Create a working branch specifically for this port.

Tasks:

- Create `follow-mons-port` branch from current `master`.
- Save clean diffs of `fellowship/master...fellowship/follow-mons` for the files listed below.
- Do not merge the branch as a whole.
- Treat `.tmp-follow-mons` as a reference tree only.

Primary reference files:

- `engine/overworld/events.asm`
- `engine/overworld/map_objects.asm`
- `engine/overworld/map_setup.asm`
- `engine/overworld/movement.asm`
- `engine/overworld/npc_movement.asm`
- `engine/overworld/overworld.asm`
- `engine/overworld/player_movement.asm`
- `engine/overworld/player_object.asm`
- `engine/overworld/scripting.asm`
- `home/map.asm`
- `home/map_objects.asm`
- `home/gfx.asm`
- `ram/wram.asm`
- `constants/map_object_constants.asm`
- `constants/ram_constants.asm`
- `constants/script_constants.asm`
- `data/sprites/map_objects.asm`
- `data/sprites/sprites.asm`
- `engine/gfx/mon_icons.asm`
- `gfx/following_sprite_pointers.asm`
- `gfx/following_sprites.asm`

Deliverable:

- A checked-in port notebook or issue list recording every adopted hunk and every rejected hunk.

## Phase 1 - Core Runtime Port

Port only the minimum runtime needed for a visible follower.

Tasks:

- Add follower state variables analogous to:
  - `wFollowerSpriteID`
  - `wFollowerPartyNum`
  - `wFollowerFlags`
  - `wFollowerState`
- Add reserved follower object id and movement constants.
- Port the dedicated follower object template and spawn flow from `player_object.asm`.
- Port the follower movement queue and follow-not-exact stepping logic.
- Port the follower visibility/in-pokeball state machine only if required by warp stability.

Important local review points:

- register preservation across object-copy helpers
- `hl/de/bc` assumptions across far calls
- object struct index handling
- object mask interactions
- map-object to object-struct copy order

Do not port yet:

- branch-specific map flavor scripts
- branch-specific interaction text logic beyond a minimal default interaction

Deliverable:

- Follower object can spawn, trail player, and despawn safely.

## Phase 2 - Sprite Loading Integration

This is the highest-risk technical overlap, because this repo already has custom overworld species sprite logic.

Tasks:

- Port only the parts of `GetFollowingSprite` and related decompression logic needed to resolve follower graphics.
- Reconcile with this repo's current `SPRITE_POKEMON` and custom `SPRITE_*` entries in [constants/sprite_constants.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/constants/sprite_constants.asm:1).
- Avoid assuming branch sprite ids match local sprite ids.
- Keep follower graphics isolated from existing field-mon species sprite resolution where possible.
- Decide whether follower assets should:
  - use a dedicated sprite class path, or
  - reuse existing species sprite plumbing with a follower-specific pointer table

Recommended approach:

- Add a follower-specific graphics path.
- Do not entangle follower loading with general field-mon overworld sprite selection until the feature is stable.

Deliverable:

- First alive party mon displays as a follower without breaking existing map sprites.

## Phase 3 - Minimal Script Surface

Add only the script hooks needed to make the feature usable.

Tasks:

- Port a minimal follower interaction entry point.
- Keep default interaction only at first.
- Add a small API surface for:
  - hide follower
  - show follower
  - freeze/unfreeze follower
  - query follower state if needed

Recommendation:

- Do not port the full `FollowerInteractionTable` immediately.
- Re-add custom species/location reactions later as a separate content pass.

Deliverable:

- Player can talk to the follower and get a stable default response.

## Phase 4 - Object Budget Mitigation

Before broader rollout, resolve the object-capacity problem explicitly.

Tasks:

- Audit all 7 maps at `17` objects.
- Audit all 16 maps at `16` objects.
- For each map, choose one of:
  - remove or consolidate nonessential NPC/item objects
  - gate optional objects behind events so they do not coexist
  - hide follower on that map
  - rework scripted temp actors so they do not consume persistent object slots

Recommended policy:

- Do not hide the follower by default across whole categories of maps.
- Use per-map exceptions only where object budgets or cutscenes make the follower unsafe.

Priority maps:

1. `WarZone.asm`
2. `Route32.asm`
3. `Route43.asm`
4. `NationalPark.asm`
5. `LakeOfRage.asm`
6. `DragonsDenB1F.asm`
7. `Route29.asm`

Deliverable:

- No map exceeds effective capacity with follower enabled.

## Phase 5 - Transition and Edge-Case Stabilization

This phase is about non-walking movement and map transitions.

Cases to verify:

- door warps
- map connections
- forced movement
- cutscenes with spawned temp actors
- elevators
- magnet train
- ship maps
- Hall of Fame
- Pokecenter healing
- strength/rock smash states
- surf start/end
- special scene loads

Reference maps already touched by `follow-mons` and likely to matter:

- `NewBarkTown.asm`
- `CherrygroveCity.asm`
- `ElmsLab.asm`
- `MrPokemonsHouse.asm`
- `IlexForest.asm`
- `Route32.asm`
- `Route34.asm`
- `TeamRocketBaseB1F.asm`
- `TeamRocketBaseB2F.asm`
- `TeamRocketBaseB3F.asm`
- `VictoryRoad.asm`
- `HallOfFame.asm`

Deliverable:

- Stable follower behavior in all mandatory progression scenes.

## Phase 6 - Art Pipeline

This is the largest content workload.

Tasks:

- Define follower sprite source format.
- Decide whether to derive followers from:
  - existing overworld sprites where they exist
  - front sprites as rough references
  - newly drawn assets
- Build a scripted conversion path to:
  - normalize canvas size
  - validate palette count
  - convert PNG -> `2bpp.lz`
  - generate/update pointer tables
- Add a validation script that checks every species/form has either:
  - a dedicated follower asset, or
  - an explicit fallback assignment

Recommended production order:

1. Starter and early-route species
2. Common party species
3. Legendaries and late-game species
4. Rare forms and edge cases

Recommended placeholder policy during development:

- Do not block runtime integration on missing art.
- Build a complete local `FollowingSpritePointers` table aligned to this repo's species order.
- For any species without real follower art yet, point its entry at a shared placeholder sprite.
- That placeholder can be a single existing follower asset such as `RhydonFollowingSprite`, though a deliberately neutral placeholder sprite would age better.
- This lets the follower engine, object handling, warps, palettes, and map-budget fixes be tested independently of art production.

Palette note:

- In `follow-mons`, follower graphics and follower palettes are chosen separately.
- The graphic comes from `FollowingSpritePointers`.
- The palette still comes from the species palette path via `MenuMonPals` and follower palette lookup.
- Because of that, a shared placeholder graphic will still be tinted per species. That is fine for development, but it may look ugly for some species and should be treated as temporary.

Deliverable:

- Repeatable follower asset pipeline with coverage report.

## Phase 7 - Species Content Pass

Once runtime is stable, start content expansion.

Tasks:

- Add local species-specific reactions where it materially improves the feature.
- Port only the strongest branch interactions from `engine/events/follower.asm`.
- Rewrite branch interactions that depend on maps or species absent from this repo.
- Add new interactions for this repo's custom roster only where they are worth the maintenance cost.

Recommendation:

- Keep this phase intentionally selective.
- Do not commit to writing bespoke interaction text for all 253 species.

Deliverable:

- A curated set of high-value follower reactions.

## Phase 8 - Save and Compatibility Policy

Decide early whether follower state affects save compatibility.

Questions to answer:

- Are any new persistent save fields required?
- Can follower state be reconstructed entirely from party state and map state?
- If persistent state is required, does the save patcher need an update?

Recommended approach:

- Prefer reconstructible runtime state.
- Avoid persistent save-format changes unless they are clearly needed.

Deliverable:

- Explicit compatibility policy documented before release.

## File-Level Work Breakdown

### High-risk engine files

- `engine/overworld/map_objects.asm`
- `engine/overworld/player_object.asm`
- `engine/overworld/overworld.asm`
- `engine/overworld/events.asm`
- `home/map_objects.asm`
- `home/gfx.asm`
- `ram/wram.asm`

These are the files most likely to produce silent regressions.

### Medium-risk integration files

- `constants/map_object_constants.asm`
- `constants/ram_constants.asm`
- `constants/script_constants.asm`
- `data/sprites/map_objects.asm`
- `data/sprites/sprites.asm`
- `engine/gfx/mon_icons.asm`
- `engine/menus/naming_screen.asm`
- `engine/sprite_anims/core.asm`

### Low-risk later-content files

- `engine/events/follower.asm`
- map script files adding follower-specific scenes
- follower text additions

## Risk Register

### Risk 1 - object overflow on dense maps

Probability: high

Impact: high

Mitigation:

- fix the 17-object maps before broad enablement
- add per-map follower suppression where necessary

### Risk 2 - follower sprite load path collides with field-mon sprite path

Probability: high

Impact: high

Mitigation:

- keep follower graphics path separate at first
- avoid reusing local field-mon hooks until stable

### Risk 3 - ROM0 overflow

Probability: medium

Impact: medium-high

Mitigation:

- push new helpers into ROMX where possible
- keep Home-bank glue minimal

### Risk 4 - WRAM0 overflow

Probability: medium

Impact: high

Mitigation:

- audit net byte delta before finalizing runtime variables
- move non-hot follower state to WRAMX if needed

### WRAM staging note

The current port still does **not** keep all branch-parity follower WRAM yet, but it now includes the minimum state needed for the currently ported script and transition logic.

Currently present:

- `wFollowerFlags`
- `wFollowerState`
- `wFollowerNextMovement`

Still deferred:

- `wFollowerSpriteID`
- `wFollowerPartyNum`
- any remaining follower-specific scratch/state bytes tied to full palette and interaction parity

This is a staging choice, not a final resolution of WRAM pressure.

Current temporary design:

- reserve map object slot `1` for the follower
- reserve object struct `1` for the follower
- keep `NUM_OBJECT_STRUCTS = 13` during early bring-up

That means the early port accepts **one fewer non-player visible object struct** than full branch parity.

Reopen the WRAM/object-struct budget when any of the following are ported:

- follower invisibility / in-ball behavior
- follower palette parity
- follower interaction script/content
- branch-specific follower movement state
- any runtime issue showing that 13 total object structs is too tight

### Risk 5 - art backlog stalls the feature

Probability: high

Impact: medium

Mitigation:

- ship runtime first
- allow temporary placeholder follower assets during development
- track asset coverage automatically

## Suggested Milestones

## Current Status

Completed on `dev`:

- follower constant `FOLLOWER = 1` added
- reserved follower sprite id added
- reserved map object slot `1` added for the follower template
- reserved object struct `1` added for the follower runtime object
- follower spawn template added in `player_object.asm`
- follower movement/runtime constants added:
  `SPRITEMOVEDATA_FOLLOWEROBJ`, `SPRITEMOVEFN_FOLLOWER_OBJ`,
  `FOLLOWERMOVE_*`, `SPRITEMOVEDATA_POKEBALL_OPENING`,
  `SPRITEMOVEDATA_POKEBALL_CLOSING`, and related step types
- branch-style follower movement data rows added in `data/sprites/map_objects.asm`
- branch-style `MovementFunction_FollowerObj` ported
- branch-style Poke Ball temp-object movement functions ported
- follower movement queue/runtime pieces now present:
  `ApplyMovementToFollower`, `GetFollowerNextMovementIndex`,
  `QueueFollowerFirstStep`, `FollowNotExact`, and branch-shaped
  `RefreshFollowingCoords`
- follower visibility/update helpers now ported:
  `HideFollowerIfNPCBump`, `UpdateFollowerSprite`,
  `CheckFollowerInvisOneStep`
- Poke Ball temp-object helpers now ported:
  `SpawnPokeballOpening`, `SpawnPokeballClosing`
- shared placeholder follower walking sprite now uses a branch-style pointer-table and decompression path
- outdoor sprite loading now explicitly registers the runtime follower sprite
- map-entry follower refresh hook added
- dense-map audit written to `docs/follow_mons_dense_map_audit.md`
- original 17-object overflow maps reduced to fit the reserved follower slot
- temporary dense-map clamp removed after map cleanup
- follower no longer blocks player movement
- pressing `A` on the unfinished follower no longer dispatches random NPC scripts
- placeholder follower has been verified stable across indoor/outdoor map transitions
- placeholder follower currently appears as the shared Rhydon sprite
- deferred WRAM staging decision documented
- minimum follower WRAM staged for current runtime:
  `wFollowerFlags`, `wFollowerState`, `wFollowerNextMovement`
- internal follower helpers added for stow/appear/save-coords/freeze control
- non-command `Script_appear_skipinput` helper added to match the reference runtime flow
- follower script command surface added locally:
  `freezefollower`, `unfreezefollower`, `getfollowerdirection`, `followcry`,
  `stowfollower`, `appearfollower`, `appearfolloweronestep`,
  `savefollowercoords`, `silentstowfollower`
- local command-id conflict resolved by keeping existing `nooryes` at `$aa`
  and assigning the follower commands to `$ab`-`$b3`
- branch-style follower ball-state runtime added:
  `FollowerInBall`, `_CheckActiveFollowerBallAnim`,
  and the home-bank `CheckActiveFollowerBallAnim` wrapper
- trainer post-battle path now calls `CheckActiveFollowerBallAnim`
- fall-map transition path now calls `FollowerInBall`
- Fly field-move script now matches the branch follower path:
  `silentstowfollower` and `loadvar VAR_FOLLOWERSTATE, PLAYER_NORMAL`
- `VAR_FOLLOWERSTATE` and the `wFollowerState` variable-table entry restored
- `map_setup.asm` now resets `wFollowerState` alongside `wPlayerState`

Not done yet:

- follower-specific palette/identity path from `overworld.asm`
  (`wFollowerSpriteID`, `wFollowerPartyNum`, follower palette parity)
- full branch follower interaction/content from `engine/events/follower.asm`
- broad branch map-script pass using the new follower commands
  (`freezefollower`, `unfreezefollower`, `getfollowerdirection`, etc.)
- starter-scene / Elm's Lab behavior is still **not** a valid acceptance test
  and should not be treated as stable until more branch map-script work lands
- `appearfolloweronestep` still falls back to plain appear behavior;
  the temporary helper plumbing is present, but one-step branch parity is not done
- object-struct / WRAM budget revisit for deferred parity bytes
  (`wFollowerSpriteID`, `wFollowerPartyNum`) and any later runtime pressure

### Engine parity estimate

Estimated follower engine parity versus `follow-mons`: roughly **55-65%**.

What is substantially in place:

- reserved follower object model
- core follow movement runtime
- placeholder follower gfx loading path
- basic follower script command surface
- follower visibility / ball-transition runtime scaffolding
- trainer/fall/fly engine hooks

What still keeps parity well short of complete:

- follower palette and species identity bookkeeping
- `engine/events/follower.asm` content layer
- broad map-script adoption of the follower command surface
- remaining transition/cutscene verification after the script pass
- final WRAM cleanup for the deferred follower identity bytes

### Milestone A - Proof of concept

- Completed:
- One follower appears
- Follows across normal map transitions
- Uses stable placeholder graphics

### Milestone B - Runtime stable

- In progress:
- Warps and major transitions stable
- Dense maps reviewed
- No object corruption on the currently verified bring-up path
- Branch transition hooks are partially ported, but story/cutscene script parity is not done

### Milestone C - Playable release candidate

- Core story flow works with follower enabled
- Missing art reduced to a tracked noncritical set
- Minimal default follower interaction present

### Milestone D - Full content release

- Broad art coverage
- Selected species/location interactions
- Map exceptions documented

## Missing Follower Asset Backlog

These local species/forms currently have no matching follower asset basename in the `follow-mons` asset set:

- `abomasnow`
- `aegislash`
- `arceus`
- `arctibax`
- `arctozolt`
- `bagon`
- `baxcalibur`
- `beldum`
- `bisharp`
- `breloom`
- `buneary`
- `chandelure`
- `chimchar`
- `conkeldurr`
- `cottonee`
- `darkrai`
- `deino`
- `deoxys`
- `dialga`
- `doublade`
- `dracovish`
- `drilbur`
- `duosion`
- `electivire`
- `excadrill`
- `feebas`
- `ferroseed`
- `ferrothorn`
- `frigibax`
- `froakie`
- `frogadier`
- `gabite`
- `galade`
- `galvantula`
- `garchomp`
- `gardevoir`
- `genesect`
- `gible`
- `giratina`
- `gliscor`
- `greninja`
- `groudon`
- `grovyle`
- `gurdurr`
- `hawlucha`
- `honchkrow`
- `honedge`
- `hydreigon`
- `infernape`
- `joltik`
- `kingambit`
- `kirlia`
- `kleavor`
- `kyogre`
- `lampent`
- `larvesta`
- `latias`
- `latios`
- `litwick`
- `lopunny`
- `lucario`
- `magmortar`
- `magnezone`
- `mamoswine`
- `marshtomp`
- `mawile`
- `melmetal`
- `meltan`
- `metagross`
- `metang`
- `milotic`
- `mimikyu`
- `mismagius`
- `monferno`
- `mr__mime`
- `mudkip`
- `ninetalesa`
- `nown`
- `palkia`
- `pawniard`
- `poltegeist`
- `porygonz`
- `ralts`
- `rayquaza`
- `regigigas`
- `reuniclus`
- `rhyperior`
- `riolu`
- `rotom`
- `salamence`
- `sceptile`
- `scolipede`
- `shaymin`
- `shelgon`
- `shroomish`
- `sneasler`
- `snover`
- `solosis`
- `staraptor`
- `staravia`
- `starly`
- `swampert`
- `sylveon`
- `timburr`
- `togekiss`
- `treecko`
- `ursaluna`
- `ursalunab`
- `venipede`
- `volcarona`
- `weavile`
- `whimsicott`
- `whirlipede`
- `xerneas`
- `yanmega`
- `yveltal`
- `zweilous`
- `zygarde`

## Immediate Next Steps

1. Create the dedicated port branch.
2. Port the follower runtime without flavor interactions.
3. Get a single placeholder follower walking on a low-object map.
4. Resolve sprite loading without touching the current field-mon path.
5. Audit the 7 maps already at 17 objects.
6. Stand up the follower asset coverage script.

## Bottom Line

This feature is feasible in this repo, but only as a controlled subsystem port.

The main hard parts are:

- overworld engine integration
- dense-map object budgets
- follower art coverage for the custom dex

ROM size is not the real blocker. Merge complexity and asset workload are.

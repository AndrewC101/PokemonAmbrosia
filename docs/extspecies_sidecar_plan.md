# ExtSpecies Sidecar Plan

## Goal

Extend the game beyond the current native species-id ceiling without a full 16-bit species rewrite.

The proposed approach is to promote `SAVEMON_ALTSPECIES` into a real `ExtSpecies` sidecar and treat it as the true identity for selected monsters.

## Core Idea

- Keep the existing 8-bit `species` byte as a carrier/base species.
- Use `altspecies` as an override for monsters that are part of the expanded pool.
- Define `effective species` as:
  - `species` when `altspecies == 0` or `altspecies == species`
  - `altspecies` otherwise

This keeps the existing mon struct mostly intact while allowing extra entries to live in parallel data tables.

## Why This Is The Best Simple Hack

- The repo already stores `SAVEMON_ALTSPECIES` in saved mon data:
  - `constants/pokemon_data_constants.asm`
- Box and UI code already know about `wBufferMonAltSpecies`:
  - `engine/pc/bills_pc.asm`
  - `engine/pc/bills_pc_ui.asm`
  - `engine/pokemon/stats_screen.asm`
  - `engine/pokemon/search.asm`
- Core species lookup is still species-only today:
  - `home/pokemon.asm:GetBaseData`

So the repo already has a partial sidecar concept, but it is not yet the canonical battle/data identity.

## Proposed Model

### Native monsters

- `species` = real species
- `altspecies` = same as `species`, or `0`

### Expanded monsters

- `species` = carrier species chosen for storage compatibility
- `altspecies` = real expanded species id

Carrier species can be arbitrary, but the cleanest rule is to group expanded monsters under a related base family where possible.

## Required Runtime State

Saved mons already have `altspecies`, but party and battle structs do not.

Add parallel sidecar state rather than widening the existing structs:

- `wPartyMonAltSpecies`
- `wOTPartyMonAltSpecies`
- `wBattleMonAltSpecies`
- `wEnemyMonAltSpecies`
- `wTempMonAltSpecies`
- `wCurAltSpecies` or equivalent scratch resolver state

This avoids changing `MON_SPECIES` and `SAVEMON_SPECIES` layout in the live structs.

## Implementation Stages

### 1. Define identity rules

- Decide whether `altspecies == 0` means native, or whether native mons always mirror `species`.
- Define a legal range for expanded species ids.
- Define carrier-species policy for gifts, wild mons, trades, eggs, and evolutions.

### 2. Make save/load and copy paths preserve the sidecar

Audit all paths that create or move mons so `altspecies` is always initialized and copied:

- catch/gift generation
- party add/remove
- box encode/decode
- daycare
- breeding/egg creation
- trade data
- evolution rewrite paths

The first invariant to enforce is: every mon always has a valid `altspecies`.

### 3. Add an effective-species resolver

Introduce a small API layer:

- `GetEffectiveSpecies`
- `SetCurSpeciesFromEffectiveSpecies`
- optional helpers for party/box/temp/battle mon contexts

Do not start by patching every caller manually. First create a single resolver point and route the highest-value systems through it.

### 4. Make core data lookups sidecar-aware

Start with the smallest set that makes an expanded mon functionally real:

- base data
- names
- front/back pics
- palettes
- icon pointer
- cry pointer
- evolution/moves pointer
- dex entry pointer

`GetBaseData` is the first hard requirement because much of the engine fans out from it.

### 5. Propagate sidecar state into battle and menus

Battle, stats, PC, and party screens must all agree on effective species.

Highest-priority contexts:

- party menu
- stats screen
- Bills PC
- wild/trainer battle load
- switch/send-out paths
- evolution scene

### 6. Decide Pokedex policy

There are two viable approaches:

- expanded mons get distinct dex entries
- expanded mons collapse onto their carrier species in the dex

The first is better long-term, but the second is the lower-risk MVP.

### 7. Decide link compatibility policy

This system is unlikely to be compatible with vanilla-style link assumptions.

Options:

- block expanded mons from link/time capsule features
- normalize them to carrier species during link transfer

Blocking is simpler and safer.

## Recommended MVP Scope

Do not try to generalize the whole game at once.

Start with:

1. one expanded species family
2. no breeding support initially
3. no link compatibility initially
4. explicit dex limitations if needed

The goal of the MVP is to prove that an expanded mon can:

- exist in party
- exist in box
- enter battle
- show correct stats/name/pic
- evolve or level correctly if applicable

## Main Risks

- code paths that silently read `species` instead of effective species
- party/battle sidecar desync
- save/load corruption from missed copy paths
- wrong art/data pairings
- breeding and evolution producing invalid identities
- dex/search logic disagreeing with storage identity
- link and time capsule incompatibility

## Complexity Assessment

- Lower than a `pokecrystal16` port
- Probably lower than a full `crystal-inheritance` form system
- Still a high-complexity engine change

This is the smallest strategy that plausibly gets the repo beyond the current species ceiling without rewriting species ids globally.

## Task List

### Phase 0: Design Decisions

- [ ] Decide whether native mons store `altspecies = 0` or mirror `altspecies = species`.
- [ ] Define the valid expanded-species range and reserve constants for it.
- [ ] Choose carrier-species policy for expanded mons.
- [ ] Decide the MVP dex policy:
  - distinct dex entries
  - or collapse to carrier species
- [ ] Decide the MVP link policy:
  - blocked
  - or normalized to carrier species

### Phase 1: Storage And Runtime Sidecar State

- [ ] Add WRAM sidecar arrays for party, opponent party, battle, and temp contexts.
- [ ] Add scratch helpers for resolving the current effective species.
- [ ] Document the invariant that every mon must have a valid `altspecies`.
- [ ] Audit initialization paths so newly created mons always receive a valid sidecar value.

### Phase 2: Copy-Path Hardening

- [ ] Audit catch generation paths in [engine/pokemon/caught_data.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\pokemon\caught_data.asm).
- [ ] Audit party add/remove and generation paths in [engine/pokemon/move_mon.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\pokemon\move_mon.asm).
- [ ] Audit box encode/decode and Bills PC transfer paths in [engine/pc/bills_pc.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\pc\bills_pc.asm).
- [ ] Audit daycare and breeding creation paths.
- [ ] Audit evolution rewrite paths so they preserve or intentionally replace `altspecies`.
- [ ] Audit trade and script gift paths.

### Phase 3: Effective-Species Resolver

- [ ] Add a helper that resolves `species + altspecies` into effective species.
- [ ] Add context helpers for party mon, box mon, temp mon, and battle mon reads.
- [ ] Route `GetBaseData` setup through the resolver in the first MVP contexts.
- [ ] Avoid broad blind search-and-replace; patch the highest-value funnels first.

### Phase 4: Core Lookup Conversion

- [ ] Make base-data lookup sidecar-aware.
- [ ] Make species-name lookup sidecar-aware.
- [ ] Make front/back pic lookup sidecar-aware.
- [ ] Make icon/palette lookup sidecar-aware.
- [ ] Make cry lookup sidecar-aware.
- [ ] Make evo/learnset lookup sidecar-aware.
- [ ] Make dex-entry lookup sidecar-aware if distinct dex entries are part of the MVP.

### Phase 5: MVP UI And Battle Support

- [ ] Make party menu species presentation use effective species.
- [ ] Make stats screen species presentation use effective species.
- [ ] Make Bills PC species presentation use effective species consistently.
- [ ] Make send-out and battle load paths populate battle-side sidecar state.
- [ ] Make evolution scenes use effective species for art/data decisions.
- [ ] Verify wild, trainer, and scripted battle intros do not regress.

### Phase 6: Expanded Species Content

- [ ] Define one small pilot family for the MVP.
- [ ] Add base stats, names, pics, palettes, cries, and learn/evo data for that pilot family.
- [ ] Add a controlled acquisition path for the pilot family:
  - scripted gift
  - or one controlled wild encounter
- [ ] Avoid breeding and link exposure for the first pilot.

### Phase 7: Dex And System Policy

- [ ] If using distinct dex entries, add dex-order and dex-data integration.
- [ ] If collapsing to carrier species, ensure dex/search logic intentionally reflects that policy.
- [ ] Add explicit guards for link and time capsule features if expanded mons are unsupported there.
- [ ] Add sanity checks where unsupported systems would otherwise silently corrupt data.

### Phase 8: Validation

- [ ] Verify an expanded mon survives party add/remove correctly.
- [ ] Verify an expanded mon survives boxing/unboxing correctly.
- [ ] Verify an expanded mon displays correct name, art, icon, and stats.
- [ ] Verify an expanded mon enters battle with the correct data and graphics.
- [ ] Verify save, reload, and re-open behavior preserves identity.
- [ ] Verify a native mon path still behaves exactly as before.

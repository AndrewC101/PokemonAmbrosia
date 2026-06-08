# Pokedex Current Area Encounters Plan

## Goal

Add a Pokedex view that shows the **current wild encounters in the player's current area**.

Scoped first version:
- include **grass** encounters
- include **surf** encounters
- exclude for now:
  - fishing
  - headbutt trees
  - rock smash
  - gifts / trades / scripted event encounters

This keeps the implementation aligned with the live wild encounter engine without pulling in every secondary encounter system at once.

## Why this scope

The repo already has:
- a full Pokedex area subsystem:
  - [engine/pokedex/pokedex_area_page.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/pokedex/pokedex_area_page.asm)
  - [engine/pokedex/pokedex_area_page_fishing.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/pokedex/pokedex_area_page_fishing.asm)
  - [engine/pokedex/pokedex_area_page_trees_rocks.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/pokedex/pokedex_area_page_trees_rocks.asm)
- a central wild encounter lookup path:
  - [engine/overworld/wildmons.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/overworld/wildmons.asm)

So this is not a greenfield feature. The main work is building a **current-map encounter extractor** and presenting that data in the Pokedex UI.

Fishing / tree / rock systems are all more indirect than grass / surf, so they should be a second phase.

## Current repo behavior to preserve

### Wild encounter data sources

Grass and surf data come from:
- [data/wild/johto_grass.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/data/wild/johto_grass.asm)
- [data/wild/kanto_grass.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/data/wild/kanto_grass.asm)
- [data/wild/swarm_grass.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/data/wild/swarm_grass.asm)
- [data/wild/johto_water.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/data/wild/johto_water.asm)
- [data/wild/kanto_water.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/data/wild/kanto_water.asm)
- [data/wild/swarm_water.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/data/wild/swarm_water.asm)

Lookup logic is in:
- [engine/overworld/wildmons.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/overworld/wildmons.asm:336) `LoadWildMonDataPointer`
- [engine/overworld/wildmons.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/overworld/wildmons.asm:340) `_GrassWildmonLookup`
- [engine/overworld/wildmons.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/overworld/wildmons.asm:351) `_WaterWildmonLookup`
- [engine/overworld/wildmons.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/overworld/wildmons.asm:420) `LookUpWildmonsForMapDE`

### Existing Pokedex area behavior

The current area pages are **species-centric**:
- they answer “where can this species be found?”
- they search across many maps / systems

This new feature is **area-centric**:
- “what can be found in the player's current area right now?”

That means it should not try to reuse the current area pages directly as-is, but it should reuse their rendering conventions where practical.

## Proposed feature shape

Add a new Pokedex page or subpage:
- title idea: `Current Area`
- content:
  - current map name
  - grass encounters for the active time of day
  - surf encounters

The page should show the encounter list for the player's **current map** only.

### Time-of-day handling

Grass data is split by:
- morning
- day
- night

The page should display only the list that is active for the current time of day.

Surf data has no time-of-day split, so it can always display the current surf list.

### Swarm handling

The extractor should follow the same wild lookup rules as live encounters:
- if the current area is under a swarm override, show the swarm table
- otherwise show the normal table

That keeps the page truthful to actual encounter behavior.

## Recommended UI behavior

Best first version:
- one page with two sections:
  - `Grass`
  - `Surf`

Each entry should show:
- species name
- level or level range

If the same species appears multiple times in a section:
- either show each slot separately, or
- merge duplicates into one row with a min/max level range

Recommended first pass:
- **merge duplicates**
- show one row per species with min/max level

This is more readable and fits the screen better.

## Data extraction plan

### 1. Get current map and context

Read:
- current map group / map id
- current time of day
- current swarm flags

These are already part of the live encounter engine state.

### 2. Resolve current grass table

Use the same lookup shape as the live wild encounter path:
- decide whether Johto / Kanto / swarm table applies
- call or mirror `LookUpWildmonsForMapDE`

Then:
- select the active time-of-day block
- read the 7 grass slots
- collect species and levels

### 3. Resolve current surf table

Likewise:
- decide whether Johto / Kanto / swarm water table applies
- look up the current map
- read the 3 surf slots
- collect species and levels

### 4. Normalize rows for display

For each section:
- merge duplicate species
- compute:
  - minimum level
  - maximum level

Proposed output row model:
- species id
- min level
- max level

### 5. Render to the Pokedex page

Display:
- current map name
- section label
- up to N rows per section

If the combined row count exceeds the page:
- page vertically or split by section

Recommended first pass:
- hard-cap to a single page if it fits
- if it does not fit, add simple paging

## Files likely to change

Primary:
- [engine/pokedex/pokedex.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/pokedex/pokedex.asm)
- likely a new file such as:
  - `engine/pokedex/pokedex_current_area_page.asm`

Possibly:
- [engine/overworld/wildmons.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/overworld/wildmons.asm)
  - if a shared helper is worth extracting

Avoid if possible:
- changing the live wild encounter behavior itself

## Implementation approach

### Option A: reuse live lookup helpers directly

Pros:
- least behavioral drift
- stays aligned with current swarm / map logic

Cons:
- may require careful register / calling-context handling if the helpers assume battle-field usage

### Option B: duplicate only the map-table selection logic into Pokedex code

Pros:
- simpler to reason about inside the Pokedex
- avoids coupling Pokedex UI to wild-battle setup routines

Cons:
- more duplication
- higher drift risk if wild lookup logic changes later

Recommendation:
- prefer **Option A** where helpers are small and pure
- only duplicate the minimum glue logic if the existing routines are too stateful

## Risks

1. **Behavior drift**
- The displayed list must match actual live encounter rules.
- Swarm and time-of-day are the main drift risks.

2. **UI overflow**
- Some maps may have enough unique species across grass and surf to exceed one page.

3. **Helper side effects**
- Reusing overworld encounter helpers may pull in assumptions about working RAM or registers.

4. **Map compatibility**
- Maps with no grass and no surf should show a clear `No encounters` style result rather than garbage.

## Recommended first implementation order

1. Add a new Pokedex page type / entry point for `Current Area`.
2. Implement current grass extraction only.
3. Render grass rows with merged species + level range.
4. Add current surf extraction.
5. Add swarm handling.
6. Add overflow handling if needed.
7. Only after that, consider rods / trees / rocks as a second project.

## Acceptance checklist

- Opening the new Pokedex page on a grass-only map shows the current time-of-day grass encounters.
- Opening it on a surf-only map shows surf encounters.
- Opening it on a map with both shows both sections.
- Swarm maps reflect the active swarm table when appropriate.
- Maps with no supported wild encounters show a clean empty state.
- The displayed species and levels match actual encounters from the repo’s live wild encounter logic.

## Second-phase expansion

If the first version is good enough, add:
- fishing
- headbutt trees
- rock smash

Those should be separate follow-up work, not part of the first implementation.

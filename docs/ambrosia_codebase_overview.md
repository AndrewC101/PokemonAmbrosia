# Pokemon Ambrosia Codebase Overview

This file is a persistent orientation note for future sessions. It is not a full spec. The goal is to provide a workable mental model of how this ROM hack is laid out, where major systems live, and where to look first when changing behavior.

## What this repository is

Pokemon Ambrosia is a ROM hack built on the `pret/pokecrystal` disassembly structure. The codebase is mostly Game Boy assembly for RGBDS, with some helper tools in C, Python, AWK, and shell.

The repository still follows the standard `pokecrystal` split between:

- fixed-bank code in `home/`
- banked engine/data includes in top-level `main.asm`
- shared macros/constants pulled in by `includes.asm`
- RAM layout in `ram/`
- game content in `data/`, `maps/`, `gfx/`, and `audio/`

The important implication is that Ambrosia is not organized as a conventional app with modules and classes. Instead, it is a large include graph that is assembled into ROM banks.

## Build mental model

The main build entry is the top-level `Makefile`.

Key points:

- The build target is usually `pokecrystal.gbc`.
- RGBDS tools are used: `rgbasm`, `rgblink`, `rgbfix`, `rgbgfx`.
- The assembler is invoked with `-P includes.asm`, so `includes.asm` acts like a global prelude for every assembly file.
- The ROM is built from a set of large object files rather than every `.asm` file directly.
- There are multiple ROM variants: normal, Crystal 1.1, AU, and debug builds.
- Generated debug artifacts matter:
  - `pokecrystal.map` shows bank/layout information.
  - `pokecrystal.sym` shows symbol addresses.

Top-level object composition from the `Makefile`:

- `home.o`: fixed bank routines from `home.asm`
- `main.o`: most banked engine/data includes from `main.asm`
- `ram.o`: WRAM/HRAM/SRAM/VRAM declarations from `ram.asm`
- additional object groups for large data files such as maps, dex entries, graphics, and some mobile code

## The three files to understand first

### `includes.asm`

This is the global include prelude. It brings in:

- core charmap definitions
- macros for constants, far calls, data layout, code helpers, graphics helpers, coords, scripts, etc.
- all major constant sets: hardware, RAM, battle, items, maps, scripts, Pokemon, trainers, types, and more

Practical meaning:

- when you see a script macro like `scene_script`, `warp_event`, `loadtrainer`, or `farcall`, its definition is usually reachable from `includes.asm`
- if you need to understand a token or constant, look in `constants/` or `macros/` first

### `home.asm`

`home.asm` includes the ROM0 "always callable" code in `home/`.

This directory contains low-level shared routines such as:

- startup/init
- VBlank/LCD/video helpers
- joypad input
- decompression and graphics helpers
- text/printing helpers
- SRAM helpers
- generic utility code like copy/string/math/array routines
- farcall/predef support

If something is broadly reusable or timing-sensitive, it is often here.

### `main.asm`

`main.asm` is the main bank layout file. It defines many ROMX sections and includes most gameplay systems, for example:

- `engine/overworld/*`
- `engine/events/*`
- `engine/items/*`
- `engine/menus/*`
- `engine/pokemon/*`
- `engine/battle/*`
- `data/*`

The bank section names are useful landmarks. They tell you roughly how the final ROM is partitioned, even if the source layout is more important day to day.

## Directory map

### `engine/`

This is the main gameplay code. High-value subdirectories:

- `engine/battle/`: battle flow, move handling, AI, trainer loading, switch logic
- `engine/overworld/`: map loading, player movement, map objects, tile events, wild encounters
- `engine/events/`: scripted gameplay systems, item interactions, one-off mechanics, contest/daycare/etc.
- `engine/items/`: bag logic, mart logic, item effects, TM/HM behavior
- `engine/menus/`: intro/start/save/party/menu UI flows
- `engine/pokemon/`: stat screens, evolution, exp, party data, learnsets, breeding
- `engine/pokedex/`: custom dex pages and display logic
- `engine/rtc/`: real-time clock code
- `engine/link/`: link battle/trade/mystery gift/mobile-era communication features
- `engine/gfx/` and `engine/tilesets/`: rendering helpers and map palette/tileset logic

### `data/`

This is mostly declarative content and tables consumed by engine code.

Examples:

- `data/pokemon/`: base stats, names, dex data, learnsets, evolutions
- `data/trainers/`: trainer parties, trainer class names, AI attributes
- `data/moves/`: move data, move descriptions, move effect tables
- `data/items/`: item names, descriptions, marts, attributes
- `data/maps/`: map table glue, attributes, blocks, scripts
- `data/wild/`: wild encounter data

When behavior is driven by a table rather than logic, it is usually here.

### `maps/`

This holds one `.asm` file per map and many `.blk` block-layout files.

A typical map `.asm` contains:

- object constants
- scene scripts
- map callbacks
- NPC/event scripts
- text
- movement data
- map event declarations such as warps, coord triggers, BG events, and object events

The file [docs/map_event_scripts.md](./map_event_scripts.md) is the local reference for this structure.

### `constants/`

Mostly enumerations and layout constants. This is one of the first places to look when a script token or numeric field is unclear.

### `macros/`

Macro definitions for data declarations, script DSLs, assertions, far calls, graphics helpers, and event syntax. If assembly source looks high-level, it is usually because these macros are doing the work.

### `ram/`

Split RAM declarations:

- `ram/wram.asm`
- `ram/hram.asm`
- `ram/sram.asm`
- `ram/vram.asm`

If a gameplay variable starts with `w...`, `h...`, or similar, its storage is likely declared here.

### `gfx/` and `audio/`

Asset-heavy directories. The `Makefile` has many explicit conversion rules from PNG/palette/source data into ROM-ready binary formats.

### `tools/`

Build and asset pipeline helpers.

Notable use cases:

- include scanning for dependency generation
- compression
- graphics conversion
- patch creation
- ROM post-processing

This repository already contains built helper executables in `tools/`, which suggests the project has been worked on in an environment where committing generated helpers is acceptable.

## How map content is wired

There is a clear split between map-local logic and global map tables.

- Each map script file lives in `maps/<MapName>.asm`.
- Shared map aggregation happens in `data/maps/map_data.asm`, which includes:
  - `data/maps/maps.asm`
  - `data/maps/attributes.asm`
  - `data/maps/blocks.asm`
  - `data/maps/scripts.asm`

This means:

- if you are changing one map's scripts, start in `maps/<MapName>.asm`
- if you are debugging how that map is registered globally, follow the `data/maps/*` includes

Example pattern seen in `maps/AzaleaTown.asm`:

- `def_scene_scripts` for scene gating
- `def_callbacks` for on-load behavior
- event scripts that use macros like `checkevent`, `loadtrainer`, `startbattle`, `reloadmapafterbattle`

Example Ambrosia-specific pattern seen in `maps/Abyss.asm`:

- map callback `MAPCALLBACK_OBJECTS` is used to spawn visible field Pokemon
- field Pokemon are represented as object events with scripts that call `loadwildmon` and `startbattle`

That tells us some custom overworld encounter behavior is implemented through normal map object scripting, not only through the grass/surf wild tables.

## Battle system shape

The battle system is concentrated in `engine/battle/`.

High-value files from the top-level include graph:

- `engine/battle/core.asm`
- `engine/battle/core2.asm`
- `engine/battle/start_battle.asm`
- `engine/battle/effect_commands.asm`
- `engine/battle/read_trainer_party.asm`
- `engine/battle/ai/move.asm`
- `engine/battle/ai/scoring.asm`
- `engine/battle/ai/items.asm`
- `engine/battle/ai/switch.asm`

Observed Ambrosia-specific extensions:

- abilities are integrated into battle/state display
- custom battle types exist, including `BATTLETYPE_BOSS_BATTLE`
- level-cap logic is referenced directly in battle code
- field-mon and aggressive-wild handling have special paths
- there are explicit info-box routines for enemy ability display

The README claims significantly upgraded AI, and the source layout supports that claim:

- trainer AI flags live in `constants/trainer_data_constants.asm`
- trainer AI attributes live in `data/trainers/attributes.asm`
- decision logic is primarily in `engine/battle/ai/`

If you need to change trainer intelligence, start in `engine/battle/ai/scoring.asm` and `engine/battle/ai/move.asm`.

## Pokemon data model

Core species data is in `data/pokemon/`.

Important files:

- `data/pokemon/base_stats.asm`
- `data/pokemon/evos_attacks.asm`
- `data/pokemon/names.asm`
- `data/pokemon/dex_entries.asm`
- `data/pokemon/egg_moves.asm`

`data/pokemon/base_stats.asm` is an include hub over per-species files in `data/pokemon/base_stats/`.

From the species list, Ambrosia has expanded far beyond Gen 2 and includes Pokemon from later generations. So when balancing or debugging species behavior, expect a large amount of custom per-species content instead of vanilla Crystal assumptions.

Ability-related UI hooks were observed in:

- `engine/pokemon/stats_screen.asm`
- `engine/pokedex/pokedex_2.asm`
- `engine/battle/core2.asm`

## Trainer data model

Trainer parties are defined in `data/trainers/parties.asm`.

Important observations from the file header:

- trainer parties are table-driven
- each trainer entry can encode moves, held items, and nicknames through `TRAINERTYPE_*` flags
- stat exp is partly assigned in code, especially in `engine/battle/read_trainer_party.asm`
- DVs are assigned per trainer class elsewhere

This is a strong indicator that encounter difficulty is a mix of:

- data tables for party composition
- engine-side logic for stat exp, battle type, and trainer-class-derived properties

## Items and custom mechanics

Custom items mentioned in the README do appear in source tables and item-effect code.

Examples found directly in the codebase:

- `REMEMBRALL`
- `Warp Device`
- `Mark Of God`
- `Hand Of God`

Likely places to inspect for item behavior:

- `data/items/names.asm`
- `data/items/descriptions.asm`
- `data/items/attributes.asm`
- `engine/items/item_effects.asm`
- `engine/items/items.asm`

If a key item does something globally unusual, expect the implementation to cross from item code into events, battle, party handling, or menu logic.

## Level caps and progression gating

Level-cap logic is not just a UI concept. It is enforced in code.

Observed references include:

- `engine/battle/core.asm`
- `engine/battle/effect_commands.asm`
- `engine/items/item_effects.asm`
- `engine/pokemon/experience.asm`
- `engine/menus/trainer_card.asm`
- `engine/menus/intro_menu.asm`

This suggests the cap affects:

- experience gain or level-up behavior
- certain battle outcomes or scaling behavior
- item usage
- trainer card presentation

So if a user-visible level-cap bug appears, do not assume it is confined to one screen or one subsystem.

## Useful local documentation

The `docs/` directory is worth using. It contains project-local references for script DSLs and subsystems, including:

- `docs/map_event_scripts.md`
- `docs/event_commands.md`
- `docs/movement_commands.md`
- `docs/text_commands.md`
- `docs/map_setup_scripts.md`
- `docs/battle_anim_commands.md`
- `docs/move_effect_commands.md`
- `docs/menus.md`

These are particularly useful because much of the assembly is macro-heavy and reads more like a scripting language than raw CPU instructions.

## Practical workflow for future changes

When working in this repository, this is the fastest reliable navigation strategy:

1. Identify whether the behavior is primarily engine code, data, or map script.
2. Start from the highest-level include hub:
   - `main.asm` for banked systems
   - `home.asm` for core fixed-bank routines
   - `data/maps/map_data.asm` for map aggregation
3. Jump to the most relevant content file:
   - `maps/*.asm` for map events
   - `data/*` for tables
   - `engine/*` for behavior
4. If a symbol or macro is unclear, check `constants/` and `macros/`.
5. If bank placement matters, consult `pokecrystal.map` and `pokecrystal.sym`.

## Current understanding of Ambrosia-specific customization

Based on this initial pass, Ambrosia appears to extend base `pokecrystal` in several major directions:

- expanded species roster and stat data
- ability-aware UI and battle logic
- heavily customized trainer parties and AI
- custom battle types and boss battle handling
- level-cap systems integrated across multiple subsystems
- visible overworld/field Pokemon implemented at least partly through map object scripting
- many custom items and convenience mechanics
- extensive custom maps, NPC scripts, and progression events

## What I would inspect next in a deeper pass

If a later session needs a more detailed architectural note, the next best areas to study are:

- `engine/battle/core.asm` and `core2.asm`
- `engine/battle/ai/scoring.asm`
- `engine/overworld/wildmons.asm`
- `engine/items/item_effects.asm`
- `engine/pokedex/pokedex_2.asm`
- `ram/wram.asm` for important persistent variables
- selected custom maps tied to Ambrosia features

For now, this file should be enough to re-enter the project quickly without rediscovering the layout from scratch.

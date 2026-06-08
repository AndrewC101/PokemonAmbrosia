# Item Icons Port Plan

## Goal

Port the item icon feature from:

- https://github.com/TimKun55/pokecrystal/commit/bdfa71bedd8438d1be7e802424dd8692283aaebe

into this codebase in a way that fits this project's custom item list and UI layout.

## High-Level Assessment

The source commit is mostly asset work. The code-side feature is relatively small:

- draw a 3x3 icon beside the current item description
- load a matching palette for that icon
- refresh the icon when the menu cursor changes
- optionally show a TM/HM icon with move-type coloring in the TM/HM pocket

This repo is similar enough for the feature to be practical, but too diverged for a direct cherry-pick.

## Why This Is Not A Straight Port

### 1. Custom item table

This repo has a heavily modified item list in [constants/item_constants.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\constants\item_constants.asm), including custom items such as:

- `ESCAPE_POD`
- `WARP_DEVICE`
- `HOLY_CROWN`
- `ASSAULT_VEST`
- `REMEMBRALL`
- `AMBROSIA`
- `JUKEBOX`

The upstream `ItemIconPointers` table cannot be copied blindly. A local item-to-icon mapping table is required.

### 2. Pack layout differences

The local pack screen is assembled procedurally in:

- [engine/items/pack.asm:1327](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\pack.asm:1327)
- [engine/items/pack.asm:1365](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\pack.asm:1365)

The upstream pack tilemap changes do not line up 1:1 with this repo, so the icon slot will need a local layout adjustment.

### 3. Mart palette/layout differences

The local repo has `_CGB_PackPals` in:

- [engine/gfx/cgb_layouts.asm:1245](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\gfx\cgb_layouts.asm:1245)

but does not appear to have the same dedicated buy-menu CGB layout used by the source commit. The mart side will need adapting rather than direct copying.

## Existing Hook Points In This Repo

The feature has good local integration points already:

- pack description callback:
  - [engine/items/update_item_description.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\update_item_description.asm)
- pack menu headers:
  - [engine/items/pack.asm:1444](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\pack.asm:1444)
- mart buy menu callback:
  - [engine/items/mart.asm:691](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\mart.asm:691)
- TM/HM description refresh:
  - [engine/items/tmhm.asm:239](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\tmhm.asm:239)

These are the main places that would need callback replacement to draw icons alongside descriptions.

## Recommended Scope

Recommended implementation order:

1. Pack item icons
2. Mart buy-menu item icons
3. Optional TM/HM icon support

Do not start with a full faithful upstream asset port. First make the feature work cleanly in this repo with a local mapping table and sensible fallbacks.

## Asset Strategy

Use a local asset plan rather than assuming every upstream icon is needed.

Suggested mapping policy:

1. Reuse upstream icons for standard/shared items where possible.
2. Reuse generic icons for custom items that do not need bespoke art.
3. Use a fallback placeholder icon for unknown or low-priority custom items.
4. Only create new art for custom items that are prominent enough to justify it.

This keeps the first pass practical and avoids blocking the feature on complete asset coverage.

## Proposed Implementation Plan

### Phase 1: Asset plumbing

Add the basic asset containers:

- new icon section in [main.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\main.asm)
- new [gfx/items.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\gfx\items.asm)
- new `gfx/items/items.pal`
- optional `gfx/tm_hm_types.pal`

Also add a local `ItemIconPointers` table keyed to this repo's actual item ids.

### Phase 2: Palette loading helpers

Adapt the upstream palette-loading logic into:

- [engine/gfx/color.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\gfx\color.asm)
- [engine/gfx/cgb_layouts.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\gfx\cgb_layouts.asm)

Preferred approach:

- reserve one background palette slot for the icon
- keep palette handling localized to pack/mart/TMHM contexts

### Phase 3: Pack integration

Add a new callback such as:

- `UpdateItemIconAndDescription`

Then switch the relevant pack menu headers in:

- [engine/items/pack.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\pack.asm)

Local pack work needed:

- reserve a 3x3 icon area
- update `_CGB_PackPals` attrmap coverage
- decompress the selected icon into a fixed tile slot
- reload the icon palette when the cursor changes

### Phase 4: Mart integration

Add a mart-specific description callback that also draws the icon, then swap:

- [engine/items/mart.asm:704](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\mart.asm:704)

Local mart work needed:

- reserve icon space in the buy menu layout
- load icon graphics into a stable tile slot
- adapt palette setup for the mart screen

### Phase 5: Optional TM/HM support

If desired, extend:

- [engine/items/tmhm.asm:239](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\tmhm.asm:239)

Suggested behavior:

- use a generic TM/HM icon graphic
- color it from the taught move's type palette

This is relatively low effort compared with the item mapping work.

## Bank Space Assessment

Bank space is not a major concern.

The current linker map in [pokecrystal.map](C:\cygwin64\home\Andrew\PokemonTrueCrystal\pokecrystal.map) reports:

- `ROMX: 1805835 bytes used / 242165 free in 125 banks`

There are also several high banks with large amounts of free space, including:

- bank `#115`: `0x281f` free
- bank `#116`: `0x2956` free
- bank `#117`: empty
- bank `#118`: empty
- bank `#121`: empty
- bank `#122`: empty
- bank `#123`: `0x2f28` free
- bank `#124`: `0x3628` free

Conclusion:

- ROM space risk is low
- icon assets should live in their own late ROMX section, not in a crowded gameplay/code bank

## Complexity

### Pragmatic port

Pack + mart, local mapping table, fallback icons for custom items.

Estimate:

- medium complexity

### Full faithful port

Pack + mart + TM/HM + exhaustive icon coverage for all local custom items.

Estimate:

- medium-high complexity

## Main Risks

1. Item-to-icon mapping errors caused by this repo's custom item ids.
2. Visual/layout bugs in the pack screen due to local tilemap differences.
3. Mart palette/setup differences requiring bespoke adaptation.
4. Custom items ending up with poor or inconsistent placeholder coverage.

The biggest technical risk is not decompression or callback wiring. It is keeping the local icon table aligned with this repo's actual item list.

## Recommended Execution Strategy

1. Build a local item mapping table first.
2. Implement pack support before mart support.
3. Use placeholder/generic icons for low-priority custom items.
4. Keep icon assets in a late dedicated ROMX section.
5. Treat TM/HM icon support as optional polish, not core scope.

## How To Assign An Icon To An Item

This repo now uses three separate layers for item icons:

1. Icon asset labels in [gfx/items.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\gfx\items.asm)
2. Per-item icon mapping in [data/items/icon_pointers.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\data\items\icon_pointers.asm)
3. Per-item icon colors in [data/items/icon_palettes.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\data\items\icon_palettes.asm)

The practical rule is:

- `gfx/items.asm` decides what icon labels exist
- `icon_pointers.asm` decides which icon label a specific item uses
- `icon_palettes.asm` decides what colors that specific item uses

### Case 1: Reuse An Existing Icon For An Item

If the item can share art with an existing icon:

1. Open [data/items/icon_pointers.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\data\items\icon_pointers.asm).
2. Find the entry for the item.
3. Change that `dba` line to point at the icon label you want.

Example:

```asm
dba EscapeRopeIcon
```

This only changes the art choice. The item can still keep its own palette entry in `icon_palettes.asm`.

### Case 2: Add A Brand-New Icon PNG

If the item needs unique art:

1. Add the source PNG in `gfx/items/`.
2. Create the matching compressed runtime asset as `gfx/items/<name>.2bpp.lz`.
3. Add a label for that file in [gfx/items.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\gfx\items.asm).

Example:

```asm
MyNewItemIcon:: INCBIN "gfx/items/my_new_item.2bpp.lz"
```

Notes:

- The PNG is the editable source.
- The `.2bpp.lz` file is what the game actually loads.
- If several items should share the same art, they can all point at the same icon label.

### Case 3: Point A Specific Item At The New Icon

After adding the label in `gfx/items.asm`:

1. Open [data/items/icon_pointers.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\data\items\icon_pointers.asm).
2. Find the entry for the item.
3. Change the `dba` target to the new label.

Example:

```asm
dba MyNewItemIcon
```

Important:

- `icon_pointers.asm` is keyed to item id order.
- Keep the table length and entry order aligned with [constants/item_constants.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\constants\item_constants.asm).
- Do not insert or delete random lines unless you are intentionally changing the item table structure.

### How To Give The Item A Palette

Each item has its own palette entry in [data/items/icon_palettes.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\data\items\icon_palettes.asm).

Each entry is two `RGB` rows:

```asm
	RGB c1r, c1g, c1b
	RGB c2r, c2g, c2b
```

The loader automatically supplies:

- white as the first color
- black as the fourth color

So the two `RGB` rows in `icon_palettes.asm` are the two middle colors of the icon.

To assign or change a palette:

1. Open [data/items/icon_palettes.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\data\items\icon_palettes.asm).
2. Find the item's entry by its comment.
3. Replace the two `RGB` rows with the colors you want.

Example:

```asm
	RGB 31, 20, 10 ; MY_ITEM / MyNewItemIcon
	RGB 18, 08, 04
```

Important:

- Palette entries are per item, not per icon label.
- Two different items can point at the same icon art in `icon_pointers.asm` but use different colors in `icon_palettes.asm`.
- This is how shared ball art can still get different colors.

### Recommended Workflow For A New Custom Item

1. Decide whether the item can reuse an existing icon.
2. If yes:
   - update `data/items/icon_pointers.asm`
   - update `data/items/icon_palettes.asm`
3. If no:
   - add `gfx/items/<name>.png`
   - add `gfx/items/<name>.2bpp.lz`
   - add the label to `gfx/items.asm`
   - point the item at that label in `data/items/icon_pointers.asm`
   - add or adjust the item's palette in `data/items/icon_palettes.asm`

### Placeholder Rule

If an item does not have bespoke art yet, point it at:

```asm
dba PokeBallIcon
```

Then give it a temporary palette entry in `icon_palettes.asm`.

That keeps the table valid while custom art is still pending.

## Suggested First Implementation Target

If this feature is picked up later, the best first milestone is:

1. Pack item icons only
2. Generic fallback coverage for all custom items
3. No TM/HM icon support yet

That would prove the rendering, palette, and mapping approach with the smallest blast radius.

## Task List

### Prep

- [ ] Extract the minimal upstream code changes from the source commit and separate them from the asset dump.
- [ ] Build a local item list from [constants/item_constants.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\constants\item_constants.asm).
- [ ] Decide the first-pass scope:
  - pack only
  - pack + mart
  - TM/HM deferred or included

### Asset Mapping

- [ ] Create a local icon category list for this repo's items.
- [ ] Map standard items to reused upstream icons.
- [ ] Assign generic fallback icons to custom items that do not need unique art.
- [ ] Identify any custom items that genuinely need bespoke icons.
- [ ] Add a placeholder icon for unmapped or low-priority items.

### Asset Plumbing

- [ ] Add `gfx/items.asm`.
- [ ] Add the imported item icon graphics to a dedicated late `ROMX` section.
- [ ] Add `gfx/items/items.pal`.
- [ ] If TM/HM support is in scope, add `gfx/tm_hm_types.pal`.
- [ ] Define a local `ItemIconPointers` table keyed to this repo's actual item ids.

### Palette Support

- [ ] Add icon-palette loading helpers in [engine/gfx/color.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\gfx\color.asm).
- [ ] Extend [engine/gfx/cgb_layouts.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\gfx\cgb_layouts.asm) so the chosen palette slot is available in pack contexts.
- [ ] Add matching palette setup for the mart context rather than assuming upstream layout parity.

### Pack Integration

- [ ] Add a pack callback wrapper that refreshes both the description and the current item icon.
- [ ] Reserve a 3x3 icon area in the local pack tilemap/layout.
- [ ] Load icon graphics into a fixed tile slot.
- [ ] Update attrmap coverage for the icon area.
- [ ] Switch the pack menu headers to the new callback.

### Mart Integration

- [ ] Add a mart callback wrapper that refreshes both the description and the current item icon.
- [ ] Reserve icon space in the buy-menu layout.
- [ ] Load icon graphics into a stable tile slot for the mart screen.
- [ ] Add mart-specific palette setup if the existing CGB layout does not expose the needed palette slot cleanly.
- [ ] Swap the current mart callback to the icon-aware version.

### Optional TM/HM Integration

- [ ] Decide whether TM/HM gets a generic item icon or a move-type-colored icon.
- [ ] Add the TM/HM icon draw path in [engine/items/tmhm.asm](C:\cygwin64\home\Andrew\PokemonTrueCrystal\engine\items\tmhm.asm).
- [ ] Verify the TM/HM description refresh path does not clobber the icon tile region.

### Validation

- [ ] Verify the icon updates correctly while moving the pack cursor.
- [ ] Verify the icon updates correctly while moving the mart cursor.
- [ ] Verify custom items always resolve to a valid icon, even if it is a fallback.
- [ ] Verify palette colors look correct on hardware-accurate palettes, not just in one emulator.
- [ ] Verify no UI corruption occurs when leaving pack/mart/TMHM screens.

# Easy Mode Implementation Plan

Implementation note:
- The final implementation uses a single saved difficulty enum in `wDifficulty`.
- `DIFFICULTY_NORMAL = 0`, `DIFFICULTY_HARD = 1`, `DIFFICULTY_EASY = 2`.
- The earlier split `wHardMode` / `wDifficultyMode` approach described below was superseded.

## Goal

Add a new `Easy` difficulty option that is unlocked after **5 trainer-battle whiteouts**. Easy mode changes trainer-battle rules and trainer-mon loading, but **must not** affect battles marked `SUPER_BOSS_BATTLE`.

## Verified current behavior

- Difficulty is currently stored as a boolean in `wHardMode` at [ram/wram.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/ram/wram.asm:3240).
- The options menu currently toggles only `Normal` / `Hard` in [engine/menus/options_menu.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/menus/options_menu.asm:286).
- Trainer-loss unlock tracking already exists in `wWhiteoutCount` and is incremented only for trainer whiteouts in [engine/events/whiteout.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/events/whiteout.asm:36) and [engine/events/whiteout.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/events/whiteout.asm:220).
- The current 5-loss unlock is still wired to Gift Of God messaging in [engine/events/whiteout.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/events/whiteout.asm:45) and to the Elm lab repo display in [maps/ElmsLab.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/maps/ElmsLab.asm:733).
- Trainer-battle item restriction is in [engine/battle/core.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/battle/core.asm:6104).
- Shift prompt restriction is in [engine/battle/core.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/battle/core.asm:4099).
- Trainer level scaling and trainer stat-exp assignment are both in [engine/battle/read_trainer_party.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/battle/read_trainer_party.asm:54).
- `BATTLETYPE_BOSS_BATTLE` is widely used by content scripts across many maps, not just a few isolated fights.

## Key design decision

Do **not** turn `wHardMode` directly into a 3-state enum.

Reason:
- many map scripts already do `readmem wHardMode` and branch on `ifequal 0` vs nonzero, which currently means `Normal` vs `Hard`
- if `Easy` were stored as a nonzero third value there, those scripts would silently route easy mode into hard-mode content

Recommended model:
- keep `wHardMode` as the existing compatibility boolean for legacy script behavior
- add a new saved byte, e.g. `wDifficultyMode`, in existing free saved WRAM near `wHardMode`
- define values such as:
  - `DIFFICULTY_NORMAL = 0`
  - `DIFFICULTY_HARD = 1`
  - `DIFFICULTY_EASY = 2`
- keep `wHardMode = 1` only when `wDifficultyMode == DIFFICULTY_HARD`
- keep `wHardMode = 0` for both `Normal` and `Easy`

This isolates new engine behavior from the large existing script surface that treats nonzero as hard mode.

## Workstreams

### 1. Difficulty data and option menu

Files:
- [ram/wram.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/ram/wram.asm)
- [engine/menus/options_menu.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/menus/options_menu.asm)
- [engine/menus/intro_menu.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/menus/intro_menu.asm)

Plan:
- add `wDifficultyMode` in existing free saved WRAM so save layout does not shift
- update the difficulty row to cycle `Normal -> Hard -> Easy`
- before `wWhiteoutCount >= 5`, `Easy` should be unavailable
- recommended UI behavior: skip `Easy` while locked rather than showing a selectable dead state
- on selection:
  - `Normal`: `wDifficultyMode = NORMAL`, `wHardMode = 0`
  - `Hard`: `wDifficultyMode = HARD`, `wHardMode = 1`
  - `Easy`: `wDifficultyMode = EASY`, `wHardMode = 0`
- keep NG+ defaulting to hard by setting both variables consistently

### 2. Unlock flow

Files:
- [engine/events/whiteout.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/events/whiteout.asm)
- [maps/ElmsLab.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/maps/ElmsLab.asm)

Plan:
- keep using `wWhiteoutCount`; no separate unlock flag is required
- at **exactly 5 trainer whiteouts**, show an Easy Mode unlock message instead of the current Gift Of God unlock text
- remove the 5-loss Gift Of God description unlock from Elm’s Lab repo display
- do **not** change the actual Mr. Mime password reward path unless explicitly requested later
- if the player already passed 5 losses before this feature lands, the option should simply appear as unlocked

### 3. New battle type

Files:
- [constants/battle_constants.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/constants/battle_constants.asm)
- many map scripts that currently use `BATTLETYPE_BOSS_BATTLE`

Plan:
- add `BATTLETYPE_SUPER_BOSS_BATTLE` at the end of the battle-type list to minimize churn
- engine rule: `SUPER_BOSS_BATTLE` should behave the same as the current `BATTLETYPE_BOSS_BATTLE`
  - no items / no shift behavior
  - boss-battle trainer stat-exp treatment
  - any other current boss-battle checks that key directly on battle type
- then add one additional rule: `SUPER_BOSS_BATTLE` bypasses all easy-mode behavior
- content follow-up required: decide which existing `BATTLETYPE_BOSS_BATTLE` fights should be promoted to `SUPER_BOSS_BATTLE`

Important scope note:
- until content scripts actually use `SUPER_BOSS_BATTLE`, the new bypass path has no effect

### 4. Items usable in all battles on Easy

File:
- [engine/battle/core.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/battle/core.asm:6104)

Plan:
- keep structural exclusions that are not difficulty rules:
  - linked battles
  - bug contest / contest-specific paths
- on `DIFFICULTY_EASY`, bypass the current trainer-battle no-item restrictions
- `SUPER_BOSS_BATTLE` must explicitly skip this bypass and keep its normal restriction behavior

### 5. Shift usable in all battles on Easy

File:
- [engine/battle/core.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/battle/core.asm:4099)

Plan:
- on `DIFFICULTY_EASY`, bypass the current trainer-battle shift restrictions
- still preserve structural conditions that make the prompt impossible or meaningless:
  - one-mon party
  - link battle
  - enemy switching state
  - active battler fainted
- `SUPER_BOSS_BATTLE` must skip the easy bypass

### 6. Trainer level reduction on Easy

File:
- [engine/battle/read_trainer_party.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/battle/read_trainer_party.asm:54)

Plan:
- only apply to trainer mons loaded through `ReadTrainerParty`
- subtract from the **final battle level**, not the raw source byte
- use:
  - `-2` while `wLevelCap < 50`
  - `-5` while `wLevelCap >= 50`
- clamp at level 1
- do **not** let the subtraction feed species-downgrade logic; `MaybeUpgradeScaledTrainerSpecies` should continue to work from the original/scaled-up comparison, not from the easy-mode reduced level
- `SUPER_BOSS_BATTLE` bypasses this reduction

### 7. Trainer stat-exp override on Easy

File:
- [engine/battle/read_trainer_party.asm](C:/cygwin64/home/Andrew/PokemonTrueCrystal/engine/battle/read_trainer_party.asm:220)

Plan:
- insert an early easy-mode override ahead of the normal badge/new-game-plus stat-exp logic
- easy-mode tiers:
  - `wLevelCap < 70`: `0` stat exp
  - `wLevelCap >= 70`: `oneQuarter` stat exp, i.e. the current `.lowStatExp` branch (`$1000` / 4096)
  - after `EVENT_BEAT_RED`: `oneHalf` stat exp, i.e. the current `.mediumStatExp` branch (`$4000` / 16384)
- easy-mode must also preserve the current non-easy exceptions:
  - `BATTLETYPE_BATTLE_FRONTIER`
  - trainer class `ROLE_PLAYER_NORMAL`
  - trainer class `ROLE_PLAYER_SHINY`
- `SUPER_BOSS_BATTLE` bypasses this override as well, though it is not yet used by content

## Risks

1. `wHardMode` script coupling is the biggest risk. Treating it as an enum would silently route easy mode into hard-mode map content.
2. `SUPER_BOSS_BATTLE` is an engine hook plus a content-audit task. Adding the type without re-tagging fights does not change those fights.
3. `SUPER_BOSS_BATTLE` should be implemented as a true boss-battle duplicate first; otherwise it can drift from `BOSS_BATTLE` over time.
4. Trainer level reduction must not interfere with species-upgrade logic in `ReadTrainerParty`.
5. Easy-mode item/shift changes should not trample structural battle modes like link/contest unless that is explicitly desired.

## Recommended implementation order

1. Add `wDifficultyMode` and update the options menu.
2. Replace the 5-loss unlock message and Elm repo gating.
3. Add `BATTLETYPE_SUPER_BOSS_BATTLE`.
4. Make every current `BATTLETYPE_BOSS_BATTLE` engine check treat `SUPER_BOSS_BATTLE` the same way.
5. Implement easy-mode item and shift bypasses.
6. Implement easy-mode trainer level reduction.
7. Implement easy-mode trainer stat-exp override.
8. Audit and retag selected content fights as `SUPER_BOSS_BATTLE`.

## Acceptance checklist

- Easy is unavailable before 5 trainer losses and available after.
- 5 losses no longer unlock the Gift Of God repo description.
- Easy allows item use and shift in ordinary trainer battles.
- `SUPER_BOSS_BATTLE` behaves like `BOSS_BATTLE` even when easy mode does not exist.
- Easy does not apply its benefits in `SUPER_BOSS_BATTLE`.
- Easy trainer mons are reduced by 2 / 5 levels at the correct level-cap thresholds.
- Easy trainer stat exp follows `0 -> oneQuarter -> oneHalf` at the required progression points.
- Easy-mode stat-exp exceptions still skip the override in frontier and role-player battles.
- Existing hard-mode map-script behavior remains tied to `wHardMode` and does not accidentally trigger on Easy.

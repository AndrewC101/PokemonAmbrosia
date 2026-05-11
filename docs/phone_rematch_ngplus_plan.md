# Phone Rematch Trainers: NG+ Hard Mode First-Battle Team Plan

## Goal

If `wNewGamePlus == 1` and `wHardMode == 1`, trainers who offer phone numbers and have rematch team progressions should use their strongest team even on the first battle.

The current rematch scripts already do this for later fights by explicitly choosing later trainer IDs. The remaining gap is the initial unbeaten map-trainer battle, which still uses the static trainer ID baked into the `trainer` macro.

## Why The `trainer` Macro Is Not The Right Hook

The `trainer` macro in [macros/scripts/maps.asm](../macros/scripts/maps.asm) stores a fixed:

- event flag
- trainer class
- trainer id
- seen/win/loss/after text pointers

That data is copied into `wTempTrainer` when the trainer notices or is talked to, via [home/trainers.asm](../home/trainers.asm).

The actual first battle then goes through:

1. `loadtemptrainer`
2. `encountermusic`
3. `startbattle`

`loadtemptrainer` is implemented in [engine/overworld/scripting.asm](../engine/overworld/scripting.asm) and copies:

- `wTempTrainerClass -> wOtherTrainerClass`
- `wTempTrainerID -> wOtherTrainerID`

So the macro is static, but the battle target is still mutable at runtime before the fight starts.

## Recommended Approach

Hook the override into `Script_loadtemptrainer` in [engine/overworld/scripting.asm](../engine/overworld/scripting.asm).

### Flow

1. `Script_loadtemptrainer` copies `wTempTrainerClass` and `wTempTrainerID` into `wOtherTrainerClass` and `wOtherTrainerID` as it already does.
2. Immediately after that, call a helper that checks whether the trainer should be upgraded.
3. If yes, replace only `wOtherTrainerID` with the trainer's strongest rematch ID.
4. Leave `wOtherTrainerClass` unchanged.

## Conditions For Override

The helper should require all of the following:

1. `wNewGamePlus == 1`
2. `wHardMode == 1`
3. the trainer's beat flag in `wTempTrainerEventFlag` is not yet set
4. the `(trainer class, trainer id)` pair matches a known phone/rematch trainer initial team

Condition 3 is important because this change should affect only the first unbeaten encounter. Later phone/rematch logic already chooses upgraded trainer IDs explicitly in map scripts.

## Data Table Shape

Use a small table of triplets:

- trainer class
- initial trainer id
- strongest trainer id

Examples:

- `YOUNGSTER, JOEY1, JOEY5`
- `BUG_CATCHER, WADE1, WADE5`

A linear scan is fine. The number of phone/rematch trainers is small.

## Why This Is Better Than Script Rewrites

An alternative would be to replace each affected `trainer` object with a custom script that picks the trainer ID manually before `startbattle`.

That is worse because it:

- creates high map-script churn
- duplicates the same NG+/Hard Mode logic many times
- makes it easy for one trainer to drift from the others

The engine hook keeps the policy in one place and leaves the rematch scripts alone.

## Expected Scope

Primary code change:

- [engine/overworld/scripting.asm](../engine/overworld/scripting.asm)

Supporting data:

- new table file under `data/` or near trainer/phone data, depending on available space and local conventions

Optional helper location:

- the helper can live next to `Script_loadtemptrainer` if small
- otherwise move the table/helper into a nearby engine/data file and call it from `Script_loadtemptrainer`

## Regression Risks To Review

After implementing, review:

1. register preservation across the new helper call from `Script_loadtemptrainer`
2. event-flag check correctness using `wTempTrainerEventFlag`
3. no effect on explicit `loadtrainer` rematch battles
4. no effect on non-phone trainers
5. no effect when either `wNewGamePlus` or `wHardMode` is zero

## Summary

Do not fight the `trainer` macro.

Instead, keep the static map data as-is and override `wOtherTrainerID` inside `Script_loadtemptrainer` for unbeaten phone/rematch trainers when both NG+ and Hard Mode are enabled.

# Field Mon Box Crash

Capturing an aggressive overworld Pokemon with a full party used to crash when the mon was sent to the PC.

Root cause:
- Field mons reuse the trainer-object script path, but the boxed-capture path writes the player's OT name into `wBufferMonOT`.
- `pokecrystal.sym` shows `wBufferMonOT` overlaps trainer temp state in WRAM:
  - `wSeenTrainerBank`
  - `wSeenTrainerDistance`
  - `wSeenTrainerDirection`
  - `wTempTrainerEventFlag`
  - `wTempTrainerClass`
  - `wTempTrainerID`
  - `wSeenTextPointer`
  - `wWinTextPointer`
- That overwrite corrupts the field-mon level cache and the trainer script state needed after battle.

Fix:
- Cache the field-mon level in `wSeenTrainerDistance` during `loadtemptrainer`.
- Read that cached level in the field-mon battle setup instead of `wWinTextPointer`.
- After `reloadmapafterbattle`, call `LoadTrainer_continue` to rebuild trainer temp state before `trainerflagaction SET_FLAG`.
- Skip `PrintWinLossText` for `FIELD_MON`, since field mons do not have real trainer win/loss text pointers.

Relevant files:
- `engine/overworld/scripting.asm`
- `engine/battle/core.asm`
- `engine/events/trainer_scripts.asm`
- `engine/pokemon/move_mon.asm`
- `engine/pc/bills_pc.asm`

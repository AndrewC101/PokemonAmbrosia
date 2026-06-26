# OpenEmu Frontpic Investigation

Issue investigated on 2026-06-26:

- intermittent glitched tile on enemy Pokemon frontpics in battle
- intermittent glitched tile on Elm's Lab starter `pokepic`
- reports currently point at OpenEmu on macOS

What the code shows:

- Both symptoms share the same mon frontpic load path:
  - `engine/events/pokepic.asm`
  - `engine/battle/core.asm`
  - `engine/gfx/load_pics.asm`
- The shared loader changed materially in commit `c94bce60b9` on 2026-03-08.
- I cannot establish authorship from the repo history alone; the change landed inside a broad catch-all commit rather than an isolated frontpic patch.
- That commit did two separate things:
  - useful frontpic prep refactor: split `_GetFrontpic` into `_PrepareFrontpic` plus copy, which is now used by Bills PC
  - risky behavior change: aligned 2bpp copies started taking the `CheckGDMA` -> `SafeHDMATransfer` path

Why that path is suspicious:

- `SafeHDMATransfer` had been dead code before that commit.
- mon frontpics in battle and `pokepic` satisfy the alignment rules for `CheckGDMA`, so they now hit the new path reliably on CGB
- the symptom is intermittent single-tile corruption, which is consistent with timing-sensitive VRAM transfer issues
- this repo already has other recent frontpic fixes that document timing-sensitive corruption in adjacent systems

Fix applied here:

- keep the March frontpic prep split
- keep the general GDMA path for other callers
- restore the older non-GDMA copy behavior only for `_GetFrontpic`

Rationale:

- this is the narrowest change that targets the shared suspect path
- Bills PC still keeps its dedicated prepared-frontpic path and guarded copy logic
- the mon frontpic callers return to the older, previously stable transfer behavior without rewriting global VRAM copy rules

# Hello Chord — Claude Project Memory

> Project-specific context for Claude Code sessions in this game. Shared context (toolchain, commands, testing standard, Chord conventions) comes from the workspace `CLAUDE.md` one level up, which Claude Code loads automatically. Do not restate it here; link to it.

<!-- workspace: ../CLAUDE.md -->

## Project Identity

**Name:** Hello Chord
**Purpose:** A locked loft, three bell ropes, and one chord to ring before the rain stops.
**Engine:** Sharpee, written in Chord (`hello-chord.story`)
**Repository:** https://github.com/Johnesco/hello-chord
**Live:** https://johnesco.github.io/ifhub/app.html?game=hello-chord
**Created:** 2026-09-07 with `sharpee init`, adopted into the workspace templates the same day

## Project Context

The workspace's reference game. Rain drives the player into a small stone church; a hymn board says which bell rope to pull first, the key to the loft hatch hangs in the vestry, and ringing red, white, then blue wins. Four rooms, one door, three ropes, twenty points. It exists so every part of the pipeline has a known-good example: header, rooms and exits, a lockable door, a supporter, `must` requirements, one-way states, a phrase catalog, scoring with ranks, a win, and a hand-written tests document with a branch.

## Design Documents

The story file is the design record. There is no `docs/` folder; add one only if the game grows past a demo.

## Writing Style Rules

- Short paragraphs, plain present tense, a little dry.
- Room descriptions may name their exits; this is a demo, not a style showcase.
- Refusal text explains what to do instead of what went wrong ("red first").

## File Structure Overview

```
hello-chord/
├── CLAUDE.md                THIS FILE
├── README.md                public documentation
├── hello-chord.story        the game, one Chord file
├── hello-chord.tests.json   tests document: the main line to the win, one branch of wrong-order pulls
├── hello-chord.config.json  IFID
├── ifhub.conf               the IF Hub card
├── browser/hello-chord.css  author CSS override, loaded last
├── assets/  feelies/        empty
├── .github/                 issue and PR templates from sdlc-baseline
└── scripts/setup-labels.sh  label setup for the GitHub repo
```

Built output at the root (`play.html`, `game.js`, `*.css`, `lib/themes/`, `theme-listener.js`, `source.html`, `tests.html`, `walkthrough.txt`, `walkthrough_output.txt`) is written by the workspace build and committed. `dist/` and `node_modules/` are ignored. `index.html` is the landing page IF Hub writes.

## Key Design Decisions (do not change without discussion)

- The ropes are `scenery, pullable` with one-way states `slack, pulled`. Order is enforced with `must` lines that name the previous rope, so each refusal can say what to do.
- The hatch is a real door (`a door, lockable with the brass key`) so UNLOCK and OPEN come from the engine, not from rules.
- Scoring is 5 (loft) + 5 (key) + 10 (chord) = 20, with ranks at 0, 10, and 20 so the rank announcement fires twice in a normal playthrough.
- One file, on purpose. Splitting into `.chord` fragments is documented in the cookbook; this game stays small enough to read top to bottom.

## Current Feature Status

### Implemented
- [x] Four rooms, blocked exit south, first-visit text in the Porch and the Bell Loft
- [x] Key on a hook, lockable hatch, three ropes in order, win with a final phrase
- [x] Scoring, ranks, SCORE
- [x] Tests document: 19 cards, 33 assertions, one branch; `sharpee test` green
- [x] Built, laid out, and shipped through `tools/build.py` and the hub's `ship.py`

### Planned
- [ ] Nothing. Changes here should only demonstrate a pipeline or language feature the other games need.

## Working in this project

**SDLC profile:** core

Shared rules live in the workspace: `../CLAUDE.md` (loaded automatically), `../reference/chord-cookbook.md` (Chord lessons that are true here), `../reference/tests-document.md` (the tests document). Build and ship from the workspace:

```bash
python ../tools/build.py hello-chord --force
python C:/code/ifhub/tools/ship.py hello-chord
```

This project uses the [sdlc-baseline](https://github.com/Johnesco/sdlc-baseline) universal workflow. Claude must follow these canonical docs:

- [Workflow (7 steps)](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/workflow.md) — ticket-first, decide before you build, documentation-aware
- [Roles & hat-switch protocol](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/roles.md) — PO / BA / Dev / Documenter / QA
- [Definition of Done](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/definition-of-done.md) — exit criteria by issue type, verification-first
- [Severity & priority matrix](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/severity-matrix.md)
- [Commit, PR, and branch conventions](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/commit-conventions.md)
- [Release management](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/release-management.md)
- [Testing](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/testing.md) — the local gate here is `python ../tools/build.py hello-chord`, which fails on any failed assertion
- [Backlog hygiene](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/backlog-hygiene.md)
- [ADR protocol](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/adrs.md)
- [Profiles](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/profiles.md)

**Three non-negotiables:**

1. **No code without a ticket.** An Issue, or an ADR stub for a decision.
2. **Decide before you build.** Anything above a tuning tweak gets a six-line ADR stub first.
3. **Claude cannot QA its own work.** The Verify column is always human-owned.

### Project-specific deviations

- The first commit and the GitHub repo were created by the hub's `ship.py` on 2026-09-07, before any ticket existed, because the game was the pipeline test. Everything after that follows the workflow.

### Architecture Decisions

ADRs live in `docs/adr/` once the first one exists (index: `docs/adr/README.md`). Format, stub, and threshold rule: [sdlc-baseline `docs/adrs.md`](https://github.com/Johnesco/sdlc-baseline/blob/main/docs/adrs.md).

## Project History

### Recent Changes
- 2026-09-07: Adopted into the workspace docs model (`tools/new_game.py --adopt`): this file, the sdlc-baseline GitHub templates, `scripts/setup-labels.sh`. Not yet shipped.
- 2026-09-07: Written, tested, built, and shipped as the first Sharpee game through `tools/build.py` and IF Hub. The red rope needed `pullable` before its `on` clause could run.

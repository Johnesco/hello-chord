# Hello Chord

A small bell-ringing puzzle written in [Chord](https://sharpee.net/chord/) for the
Sharpee engine. Find the key, unlock the loft hatch, and ring the three bells in the
order the hymn board gives. Four rooms, one door, three ropes, twenty points.

It exists to prove the Sharpee workspace pipeline end to end: scaffold, compose,
build, test, and ship to [IF Hub](https://johnesco.github.io/ifhub/).

## Files

| File | What it is |
| --- | --- |
| `hello-chord.story` | The whole game, one Chord file. |
| `hello-chord.tests.json` | The tests document `sharpee test` replays: the main line through the win, plus one branch that pulls the ropes in the wrong order. |
| `hello-chord.config.json` | The IFID `sharpee init` minted. Publishing requires it. |
| `ifhub.conf` | The IF Hub card: title, author, description, tags, source, walkthrough. |
| `browser/hello-chord.css` | Author CSS, loaded after the engine and theme CSS. |
| `play.html`, `game.js`, `*.css`, `lib/themes/`, `theme-listener.js` | The built player, laid out at the root by `tools/build.py` in the workspace. |
| `source.html`, `tests.html`, `walkthrough.txt`, `walkthrough_output.txt` | The hub's source, tests, and walkthrough panes, also written by the build. |
| `index.html` | The landing page; the only file IF Hub writes into this folder. |

`dist/` and `node_modules/` are ignored. The root layout is what gets committed and published.

## Commands

```
npx sharpee play                                 # play in the terminal
npx sharpee compose --check hello-chord.story    # the load gates, nothing written
npx sharpee test                                 # replay hello-chord.tests.json
npx sharpee build                                # dist/web/hello-chord/ only

python ../tools/build.py hello-chord --force     # gates, build, tests, lay out the hub folder
python C:/code/ifhub/tools/ship.py hello-chord   # publish to johnesco.github.io/hello-chord/ and list it
```

## Walkthrough

north, read board, east, take key, west, unlock hatch with key, open hatch, up,
pull red rope, pull white rope, pull blue rope.

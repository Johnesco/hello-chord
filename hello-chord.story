## Hello Chord — a small bell-ringing puzzle, written to test the Sharpee
## workspace pipeline end to end: scaffold, compose, build, test, ship to IF Hub.

story
  title: Hello Chord
  authors:
    John Googol
  id: hello-chord
  story-version: 0.1.0
  ifid: BAEEF4A3-1ABC-4D82-8F61-96E068FAC715
  description: A locked loft, three bell ropes, and one chord to ring before the rain stops.
  themes: modern-dark, retro-terminal, paper, system-6
  use scoring
    rank "Visitor" at 0
    rank "Sexton" at 10
    rank "Bell-Ringer" at 20

## ===========================================================================
## ROOMS
## ===========================================================================

create the Porch
  a room
  aka church porch, doorway
  north to the Nave
  south is blocked: no-leaving

  first time
    The rain has chased you under the porch of a small stone church.
    Somewhere above, a bell tower waits for someone to give it a reason.

  A narrow stone porch, dry only by comparison. The church door stands
  open to the north. The rain is to the south, and it is not letting up.

create the Nave
  a room
  aka church, aisle
  east to the Vestry
  up to the Bell Loft through the hatch

  Rows of pews face a plain altar. A hymn board hangs on a pillar. A
  small door in the corner leads east to the vestry, and a ladder climbs
  to a hatch in the ceiling.

create the Vestry
  a room
  aka robing room

  A cramped room smelling of candle wax and damp wool. An iron hook is
  screwed into the wall at eye height. The nave is back to the west.

create the Bell Loft
  a room
  aka loft, tower, bell tower
  score climbed worth 5

  first time
    You climb through the hatch into the loft. Three ropes hang in a
    row, each rising into the dark toward a bell you cannot see.

  A square wooden loft under the bells. Three ropes hang here: a red
  one, a white one, and a blue one. The hatch leads back down.

  after the player entering
    award climbed
  end after

## ===========================================================================
## THE PLAYER
## ===========================================================================

create Rowan
  a person
  playable
  starts in the Porch

  Damp, but curious.

## ===========================================================================
## THINGS
## ===========================================================================

create the hatch
  a door, lockable with the brass key
  aka loft hatch, trapdoor, door

  A square hatch in the ceiling with a keyhole set into its frame.

create the hymn board
  aka board, hymn, hymns, numbers, pillar
  scenery, readable
  in the Nave

  A wooden board of movable numbers, the kind that lists the hymns for
  the day. Someone has slid in a different sort of instruction.

  on the player reading
    phrase hymn-text
      The board reads, in worn brass numerals and a scrap of paper:{br}
      TODAY: NO HYMNS.{br}
      RING THE RED, THEN THE WHITE, THEN THE BLUE.{br}
      THE KEY IS ON THE HOOK.
  end on

create the pews
  aka pew, benches, bench
  scenery, plural
  in the Nave

  Dark oak pews, polished by generations of fidgeting.

create the altar
  aka table
  scenery
  in the Nave

  A plain stone altar with nothing on it.

create the ladder
  aka rungs
  scenery
  in the Nave

  A wooden ladder bolted to the wall, rising to the hatch.

create the iron hook
  aka hook
  scenery, a supporter with capacity 1
  in the Vestry

  An iron hook, the plain kind meant for a coat or a key.

create the brass key
  aka key
  on the iron hook
  score found-key worth 5

  A small brass key, worn smooth. A paper tag reads LOFT.

  after the player taking
    award found-key
  end after

create the red rope
  aka red, red bell rope, red bell
  scenery, pullable
  in the Bell Loft
  states: slack, pulled

  A thick rope wound in red wool, tied off at waist height.

  on the player pulling
    the red rope must be slack: red-already-rung
    change the red rope to pulled
    phrase red-note
      You haul on the red rope. Far above, a deep bell answers: one low,
      round note that goes on longer than seems reasonable.
  end on

create the white rope
  aka white, white bell rope, white bell
  scenery, pullable
  in the Bell Loft
  states: slack, pulled

  A rope wound in white wool, hanging beside the red one.

  on the player pulling
    the red rope must be pulled: white-too-early
    the white rope must be slack: white-already-rung
    change the white rope to pulled
    phrase white-note
      You pull the white rope. A second bell rings out, higher, and the
      two notes hang together in the air.
  end on

create the blue rope
  aka blue, blue bell rope, blue bell
  scenery, pullable
  in the Bell Loft
  states: slack, pulled
  score chord worth 10

  A rope wound in blue wool, the last in the row.

  on the player pulling
    the white rope must be pulled: blue-too-early
    change the blue rope to pulled
    award chord
    win hello-chord
  end on

## ===========================================================================
## TEXT
## ===========================================================================

define phrases en-US
  no-leaving:
    You look out at the rain. The rain looks back. Not yet.
  red-already-rung:
    The red rope is still swinging gently. Its bell has said its piece.
  white-too-early:
    You give the white rope a tug, then stop. The hymn board was clear
    about the order: red first.
  white-already-rung:
    The white rope is already swinging. One note per bell, for now.
  blue-too-early:
    Your hand closes on the blue rope and hesitates. Red, then white,
    then blue. The board was specific.
  hello-chord:
    You pull the blue rope. The third bell joins the other two, and for
    a long moment the tower holds a single chord over the wet fields.
    Below, the rain eases. Hello, Chord.

before the game starts
  change the player to Rowan
end before

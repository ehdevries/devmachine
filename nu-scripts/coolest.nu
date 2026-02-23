# This is a cheeky little command-line game I wrote with my kids :-)
# It has nothing to do with setting up my dev machine, it's just a bit of fun.

# Who is the coolest?
export def main [] {
  let player1 = coolest players | first
  let player2 = coolest players | last

  let winner = (if (random bool) {
    coolest score $player1
    $player1
  } else {
    coolest score $player2
    $player2
  })

  print $"($winner) is the coolest!"

  coolest show
}

# Choose players and reset their scores to zero
export def 'coolest init' [] {
  print "Player 1: what is your name?"
  let player1 = (input)

  print "Player 2: what is your name?"
  let player2 = (input)

  coolest reset $player1 $player2
  coolest show
}

# Get the path to the file where the score is kept
export def 'coolest path' [] {
  [ $nu.home-dir '.coolest.json' ] | path join
}

# Show the current score
export def 'coolest show' [] {
  if (coolest path | path exists) != true {
    coolest reset "Kids" "Grownups"
  }

  open (coolest path)
}

# Reset both players' scores to zero
export def 'coolest zero' [] {
  let player1 = coolest players | first
  let player2 = coolest players | last

  coolest reset $player1 $player2
  coolest show
}

# Get the list of current players
def 'coolest players' [] {
  coolest show | columns
}

# Reset the specified players' scores to zero
def 'coolest reset' [
  player1: string
  player2: string
] {
  { $player1: 0, $player2: 0 } | save -f (coolest path)
}

# Score a point for the specified player
def 'coolest score' [player: string] {
  coolest show | update $player { $in + 1 } | save -f (coolest path)
}

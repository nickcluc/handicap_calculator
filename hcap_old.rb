def handicap
  if player_rounds.count >= 5
    differentials = []
    player_rounds.includes(:tee).each{ |round| differentials << (round.score - round.tee.rating) * 113 / round.tee.slope }
    differentials.sort!
    usable_differentials = []
    diff_count = differentials.length
    n = DIFF_HASH[diff_count]
    n.times{ usable_differentials << differentials.shift }
    ( usable_differentials.inject(0){ |sum, number| sum + number } / usable_differentials.length * 0.96 ).round(0)
  else
    "You need to play #{5-player_rounds.count} more rounds to calculate a handicap."
  end
end

DIFF_HASH = {
  5 => 1,
  6 => 1,
  7 => 2,
  8 => 2,
  9 => 3,
  10 => 3,
  11 => 4,
  12 => 4,
  13 => 5,
  14 => 5,
  15 => 6,
  16 => 6,
  17 => 7,
  18 => 8,
  19 => 9,
  20 => 10
}.freeze

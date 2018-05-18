class Handicap
  require_relative '../initializer'

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

  attr_reader :parser, :rounds

  def initialize(file_path)
    @file_path = file_path
    @parser = CsvParser.new(file_path).process
    @rounds = @parser.rounds.map do |row|
      Round.new(row)
    end
  end

  def calculate
    return "You need to play #{5 - rounds.count} more rounds to calculate a handicap." if rounds.count < 5

    differentials = get_differentials

    usable_differentials = []
    diff_count = differentials.length

    n = DIFF_HASH[diff_count]
    n.times{ usable_differentials << differentials.shift }
    ( usable_differentials.inject(0){ |sum, number| sum + number } / usable_differentials.length * 0.96 ).round(2)
  end

  def usable_rounds
    rounds.sort_by{|round| round.date}.last(20)
  end

  def get_differentials
    differentials = []
    usable_rounds.each do |round|
      differentials << (round.score - round.rating) * 113 / round.slope
    end
    differentials.sort!
  end
end

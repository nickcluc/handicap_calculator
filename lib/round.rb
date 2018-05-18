class Round
  require_relative '../initializer'

  attr_reader :date, :score, :rating, :slope

  def initialize(row_data)
    row_data.symbolize_keys!
    @date = process_date row_data[:DATE]
    @score = row_data[:SCORE].to_i
    @rating = row_data[:RATING].to_f
    @slope = row_data[:SLOPE].to_i
  end

  private

  def process_date(date_str)
    date_str = date_str.split('/').rotate(-1).join('/')
    Date.parse(date_str)
  end
end

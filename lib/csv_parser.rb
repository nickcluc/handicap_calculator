class CsvParser
  require_relative '../initializer'
  require 'csv'

  attr_accessor :round_rows, :file_path

  def initialize(file_path)
    @file_path = file_path
    @round_rows = []
  end

  def process`
    CSV.foreach(file_path, headers: true ) do |row|
      round_rows << row
    end
    self
  end
end

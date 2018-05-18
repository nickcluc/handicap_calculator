class CsvParser
  require_relative '../initializer'
  require 'csv'

  attr_accessor :rounds, :file_path

  def initialize(file_path)
    @file_path = file_path
    @rounds = []
  end

  def process
    CSV.foreach(file_path, headers: true) do |row|
      rounds << row
    end
    self
  end
end

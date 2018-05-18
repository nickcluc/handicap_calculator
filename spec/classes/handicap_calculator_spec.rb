require_relative '../spec_helper'

describe Handicap do
  let(:handicap) { build :handicap }

  before do
    csv = CSV.new("DATE,SCORE,RATING,SLOPE\n05/08/15,95,70.3,116\n", headers:true)
    allow(CSV).to receive(:foreach).with({ parser: { file_path: "test.csv" } }, headers: true).and_return(csv.read)
  end

  it 'has a valid Factory' do
    # Tests #initialize as well (since its a PORO)
    expect(handicap.parser).to be_a(CsvParser)
  end

  describe '#calculate' do
    it 'will not calculate a handicap with less than 5 scores' do
      allow(handicap).to receive(:rounds).and_return(build_list(:round, 4))
      expect(handicap.calculate).to eq("You need to play #{5 - handicap.rounds.count} more rounds to calculate a handicap.")
    end

    it 'calculates a handicap when there are more than 5 scores', focus: true do
      allow(handicap).to receive(:rounds).and_return(build_list(:round, 6))
      expect(handicap.calculate).to be_a Float
    end

    it 'correctly calculates a handicap' do
      allow(handicap).to receive(:rounds).and_return(build_list(:round, 20))
      expect(handicap.calculate).to eq(23.09)
    end
  end
end

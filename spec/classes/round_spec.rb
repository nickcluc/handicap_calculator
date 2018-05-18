require_relative '../spec_helper'

describe Round do
  let(:round) { build(:round) }

  before do
    csv = CSV.new("DATE,SCORE,RATING,SLOPE\n05/08/15,95,70.3,116\n", headers:true)
    CSV.stub(:foreach).with({ parser: { file_path: "test.csv" } }, headers: true).and_return(csv.read)
  end

  it 'has a valid Factory' do
    # Tests #initialize as well (since its a PORO)
    expect(round.date).to be_a Date
    expect(round.score).to be_a Integer
    expect(round.rating).to be_a Float
    expect(round.slope).to be_a Integer
  end
end

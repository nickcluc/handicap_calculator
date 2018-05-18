require_relative '../spec_helper'

describe CsvParser do
  let(:parser) { build :csv_parser }

  it 'has a valid Factory' do
    # Tests #initialize as well (since its a PORO)
    expect(parser.file_path).to_not be_nil
    expect(parser.rounds).to be_empty
  end

  describe '#process' do
    before do
      allow(CSV).to receive(:foreach).and_yield("field1,field2\n")
    end

    it 'processes the csv' do
      # stub the csv
      parser.process
      expect(parser.rounds).to_not be_empty
    end

    it 'returns itself' do
      expect(parser.process).to eq(parser)
    end
  end
end

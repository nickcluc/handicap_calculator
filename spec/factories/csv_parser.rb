FactoryBot.define do
  factory :csv_parser do
    file_path 'test.csv'
    initialize_with { new(attributes) }
  end
end

FactoryBot.define do
  factory :handicap do
    parser { attributes_for(:csv_parser) }
    initialize_with { new(attributes) }
  end
end

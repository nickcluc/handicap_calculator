FactoryBot.define do
  factory :round do
    DATE '05/08/15'
    SCORE '95'
    RATING '70.1'
    SLOPE '117'

    initialize_with do
      new(attributes)
    end
  end
end

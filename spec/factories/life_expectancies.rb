FactoryBot.define do
  factory :life_expectancy do
    birth_year { 1 }
    life_expectancy_both { 1.5 }
    life_expectancy_male { 1.5 }
    life_expectancy_female { 1.5 }
    loc_id { 1 }
    location { nil }
    variant { nil }
  end
end

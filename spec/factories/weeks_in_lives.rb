FactoryBot.define do
  factory :weeks_in_life do
    start_date { "2024-11-13" }
    end_date { "2024-11-13" }
    week_number { 1 }
    memo { "MyString" }
    account { nil }
  end
end

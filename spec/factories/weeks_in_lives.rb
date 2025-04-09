FactoryBot.define do
  factory :weeks_in_life do
    start_date { "2024-11-23" }
    end_date { "2024-11-23" }
    week_number { 1 }
    year { 1 }
    memo { "MyString" }
    account { nil }
  end
end

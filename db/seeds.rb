# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


Account.create!(
  first_name: 'John',
  last_name: 'Doe',
  user_agreement: true,
  date_of_agreement: Time.current,
  date_of_birth: '1954-01-01',
  estimated_lifespan: '2034-01-01',
  email: "kubatron117@gmail.com",
  password: 'Password123@'
)
#
# Account.create!(
#   first_name: 'Pepa',
#   last_name: 'Novak',
#   user_agreement: true,
#   date_of_agreement: Time.current,
#   date_of_birth: '1990-01-01',
#   estimated_lifespan: '2070-01-01',
#   email: "pepa@novak.local",
#   password: 'Password123@'
# )


WeeksInLife.create!(
  start_date: '2024-11-18',
  end_date: '2024-11-24',
  week_number: 47,
  year: 2024,
  memo: 'Testovací záznam 1',
  account_id: 1
)

WeeksInLife.create!(
  start_date: '2024-11-25',
  end_date: '2024-12-01',
  week_number: 48,
  year: 2024,
  memo: 'Testovací záznam 2',
  account_id: 1
)
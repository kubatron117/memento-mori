# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

./rails-new  memento-mori --database=mariadb-mysql --api --skip-sprockets --skip-action-text --skip-active-storage --skip-webpack-install --skip-test

Gem installations:
- rails generate rspec:install
- rails generate rodauth:install --json --argon2


Scaffolds:
- rails generate scaffold WeeksInLife start_date:date end_date:date week_number:integer year:integer memo:string{2048} account:references
- rails generate scaffold Location location:string{255} iso3_code:string{3} iso2_code:string{2} loc_type_id:integer loc_type_name:string{255}
- rails generate scaffold Variant var_id:integer variant:string{255}
- rails generate scaffold LifeExpectancy birth_year:integer life_expectancy_both:float life_expectancy_male:float life_expectancy_female:float loc_id:integer location:references variant:references
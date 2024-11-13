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

Gem installations:
- rails generate rspec:install
- rails generate rodauth:install --json --argon2


Scaffolds:
- rails generate scaffold WeeksInLife start_date:date end_date:date week_number:integer memo:string{2048}  account:references
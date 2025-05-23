source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"
# Use mysql as the database for Active Record
# gem "mysql2", "~> 0.5.6"
gem "pg", "~> 1.5.9"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.6.0"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.13.0"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem 'solid_queue', '~> 1.1.3'
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", '~> 0.1.10', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors', '~> 2.0.2'

gem "rodauth-rails", "~> 2.0.2"

gem 'ransack', "~> 4.2.1"

gem 'aws-sdk-rails', '~> 5'
gem 'aws-actionmailer-ses', '~> 1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  gem 'shoulda-matchers', '~> 6.4.0'
  gem 'factory_bot_rails', '~> 6.4.4'
  gem 'faker', '~> 3.5.1'
  gem 'rspec-rails', '~> 7.1.0'

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false
end
# Enables Sequel to use Active Record's database connection
gem "sequel-activerecord_connection", "~> 2.0"
# Used by Rodauth for password hashing
gem "argon2", "~> 2.3"
# Used by Rodauth for rendering built-in view and email templates
gem "tilt", "~> 2.4"

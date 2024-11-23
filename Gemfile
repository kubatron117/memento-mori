source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.0"
# Use mysql as the database for Active Record
# gem "mysql2", "~> 0.5.6"
gem "pg", "~> 1.5.9"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.4.3"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder", "~> 2.13.0"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem 'solid_queue', '~> 1.0.2'
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", '~> 0.1.9', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
gem 'rack-cors', '~> 2.0.2'

gem 'argon2', "~> 2.3.0"
gem "rodauth-rails", "~> 1.15.2"

gem 'ransack', "~> 4.2.1"

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



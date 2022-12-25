source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '3.1.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 7.0.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'jsbundling-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

gem 'dotenv-rails'

gem 'draper'
gem 'active_decorator'

# Use Redis adapter to run Action Cable in production
gem 'sidekiq', '~> 6.5', '>= 6.5.1'
gem 'hiredis', '~> 0.6.3'
gem 'redis', '~> 4.7', '>= 4.7.1', require: ['redis', 'redis/connection/hiredis']
gem 'redis-namespace', '~> 1.8', '>= 1.8.2'

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem 'bcrypt', '~> 3.1.7'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem 'sassc-rails'

gem 'rspec-rails', '~> 6.0.0.rc1'
gem 'factory_bot_rails'

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem 'image_processing', '~> 1.2'

# AWS S3 for files storage
gem 'aws-sdk-s3', require: false

# Validate upload files
gem 'active_storage_validations'

gem 'capistrano-slackify', require: false

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rubocop', require: false # A Ruby static code analyzer and formatter, based on the community Ruby style guide.
  gem 'rubocop-rails', require: false # A RuboCop extension focused on enforcing Rails best practices and coding conventions.
  gem 'rubocop-rspec', require: false # Code style checking for RSpec files
  gem 'rubocop-performance', require: false # An extension of RuboCop focused on code performance checks.

  gem 'capistrano', '~> 3.17', require: false
  gem 'capistrano-rails', '~> 1.6', '>= 1.6.2', require: false
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler', '~> 2.1', require: false
  gem 'capistrano3-puma', require: false
  gem 'capistrano-sidekiq', require: false
  gem 'capistrano-yarn', require: false
end

group :development do
  gem 'annotate'
  gem 'letter_opener'

  gem 'brakeman', require: false
  gem 'rails_best_practices', require: false

  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem 'rack-mini-profiler'

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem 'spring'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Use Pagy to add paginated results [https://github.com/ddnexus/pagy]
gem "pagy"
# Use Ransack to enable the creation of search forms for your application [https://github.com/activerecord-hackery/ransack]
gem "ransack"
# Spreadsheet Architect is a library that allows you to create XLSX, ODS, or CSV spreadsheets super easily [https://github.com/westonganger/spreadsheet_architect]
gem "spreadsheet_architect"

gem "bcrypt", "~> 3.1"

gem "cssbundling-rails", "~> 1.1"

gem "devise", "~> 4.8"

gem "terser", "~> 1.1"

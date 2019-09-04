source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.6.3'
gem 'dotenv-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# gem 'sprockets-rails'
# gem 'sprockets'
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 3.12.1'
gem 'bootsnap', '>= 1.4.2', require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'redis'
gem 'redis-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'rspec_junit_formatter', require: false
  gem 'factory_bot_rails'
  gem 'webmock'
  gem 'fabrication'
  gem 'machinist'
  gem 'faker'
  gem "json_matchers"
  #gem 'letter_opener_web'
  gem "letter_opener"

  #gem 'swagger-blocks'
  # gem 'swagger-docs'
  # gem 'grape-swagger-rails'
  #gem 'dredd_hooks'
  gem 'rswag', git: 'https://github.com/greendog/rswag.git'  # https://medium.com/wolox-driving-innovation/lets-forget-painful-api-documentation-f5d0f5d0d06d
  gem 'json-schema'

  # rubocop
  gem 'rubocop', require: false
  gem 'rubocop-junit_formatter', require: false
  gem 'rubocop-performance', '~> 1.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'devise'
gem 'devise-jwt'
gem 'versionist'
gem 'pg'
gem 'rack-cors'
#gem 'rack-attack'  # https://github.com/kickstarter/rack-attack

# json object presenters (active_model_serializers instead)
#gem 'fast_jsonapi'
#gem 'blueprinter'
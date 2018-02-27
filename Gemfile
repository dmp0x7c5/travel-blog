# frozen_string_literal: true

source "https://rubygems.org"

# rails
gem "rails", "~> 5.1.5"

# general gems
gem "activeadmin"
gem "pg"
gem "puma", "~> 3.7"

# frontend // just for activeadmin
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

# authentication & authorization
gem "devise", "~> 4.4.1"
gem "pundit"
# gem "doorkeeper"
# gem "rack-attack"
# gem "rack-cors"

# grape # + jsonapi
gem "grape"
gem "grape-swagger"
gem "grape-swagger-rails"
gem "hashie-forbidden_attributes" # to make grape params validation work

group :test, :development do
  gem "pry-rails"

  # local config
  gem "dotenv-rails"

  # factories and helpers
  gem "factory_bot_rails"
  gem "ffaker"
end

group :development do
  # debug
  gem "better_errors"
  gem "bullet"
  gem "letter_opener"
  gem "web-console", ">= 3.3.0"

  # guard
  gem "guard-bundler", require: false
  gem "guard-rails", require: false
  gem "guard-rspec", require: false
  gem "guard-rubocop", require: false
  gem "guard-shell", require: false

  # spring
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "rspec-rails"
  gem "shoulda-matchers", # locked for Rails5 support
      git: "https://github.com/thoughtbot/shoulda-matchers"
  gem "timecop"

  # coverage
  gem "simplecov", require: false

  # security
  gem "brakeman", require: false
  gem "bundler-audit", require: false
end

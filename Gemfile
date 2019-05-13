source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.5.1"

gem "rails", "~> 5.2.3"
gem "puma", "~> 3.11"
gem "mysql2", ">= 0.4.4", "< 0.6.0"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.5"
gem "bootstrap-sass", "3.3.7"
gem "jquery-rails", "~> 4.3", ">= 4.3.1"
gem "bootsnap", ">= 1.1.0", require: false
gem "i18n"
gem "i18n-js"
gem "config"
gem "devise"
gem "omniauth"
gem "omniauth-google-oauth2"
gem "figaro"
gem "ffaker"
gem "bootstrap_form", ">= 4.2.0"
gem "bcrypt", "3.1.12"
gem "kaminari"
gem "kaminari-bootstrap"
gem "image_processing"
gem "acts_as_follower", github: "tcocca/acts_as_follower", branch: "master"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "capybara"
  gem "factory_bot_rails"
  gem "pry"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "chromedriver-helper"
  gem "shoulda-matchers", "~> 3.1"
  gem "database_cleaner"
  gem "rails-controller-testing"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]

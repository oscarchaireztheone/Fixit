source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }



ruby '2.7.2'
gem 'rack-cors'
gem 'mimemagic', github: 'mimemagicrb/mimemagic', ref: '01f92d86d15d85cfd0f20dabd025dcbd36a8a60f'
gem 'twilio-ruby', '~> 5.45', '>= 5.45.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'dotenv-rails', groups: [:development, :test]
gem 'jbuilder', '~> 2.7'
gem 'devise', '~> 4.8'
gem 'activeadmin', '~> 2.7.0'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

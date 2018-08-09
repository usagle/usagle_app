source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'pg'
gem 'rails', '~> 5.1.2'

gem 'bootstrap-sass', '3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'font-awesome-rails'
gem 'font-awesome-rails'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'materialize-sass'
gem 'sass-rails', '~> 5.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'simple_form'
gem 'slim'
gem 'therubyracer'
gem 'toastr-rails'
gem 'turbolinks', '~> 5'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'

gem 'cancancan'
gem 'devise'

# other gems
gem 'friendly_id', '~> 5.2', '>= 5.2.4'
gem 'mail_form', '~> 1.7', '>= 1.7.1'
gem 'paperclip', '~> 6.0.0'
gem 'puma', '~> 3.7'

# environments
gem 'dotenv'
gem 'dotenv-rails', require: 'dotenv/rails-now'

# background_jobs
gem 'sidekiq'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'letter_opener'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'selenium-webdriver'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'sqlite3'
  gem 'web-console', '>= 3.3.0'
end

group :development do
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-sidekiq', require: false
end

group :test do
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
  gem 'minitest-reporters',       '1.1.14'
  gem 'rails-controller-testing', '1.0.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

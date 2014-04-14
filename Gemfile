source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use sqlite3 as the database for Active Record
platforms :ruby do
  gem 'sqlite3'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Zurb Foundation
gem 'foundation-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'draper', '~> 1.3'
gem 'roar-rails', '~> 0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# Use minitest for tests
group :development, :test do
  gem 'minitest-rails', '~> 1.0.0.beta2'
  # use vanilla gem once https://github.com/blowmage/minitest-rails-capybara/pull/21 is resolved
  gem 'minitest-rails-capybara', github: 'jordanbrock/minitest-rails-capybara', ref: 'f043c5a'
  gem 'factory_girl_rails'
end

group :development do
  # Use guard
  gem 'guard-minitest'
  gem 'guard-bundler'
  gem 'growl'
end

# Use coveralls.io for code coverage
gem 'coveralls', require: false, group: :test

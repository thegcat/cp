source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'

# Use sqlite3 as the database for Active Record
platforms :ruby do
  gem 'pg'
  group :development, :test do
    gem 'sqlite3'
  end
end

platforms :jruby do
  gem 'activerecord-jdbcpostgresql-adapter'
  group :development, :test do
    gem 'activerecord-jdbcsqlite3-adapter'
  end
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Zurb Foundation
gem 'foundation-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

gem 'devise'

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

group :heroku do
  gem 'rails_12factor'
  gem 'unicorn'
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
  gem 'minitest-rails', '~> 2.0.0'
  gem 'minitest-rails-capybara', '~> 2.0.0'
  gem 'factory_girl_rails'
end

group :development do
  # Use guard
  gem 'guard-minitest'
  gem 'guard-bundler'
  gem 'growl'

  gem 'rails-footnotes', '~> 4.0'
end

# Use coveralls.io for code coverage
gem 'coveralls', require: false, group: :test

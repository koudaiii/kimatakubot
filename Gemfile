source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'mysql2'

# Use rails_12factor for Heroku
gem 'rails_12factor', group: :production
gem 'heroku'


# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

gem 'less-rails' #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails'

# Use holiday_jp
gem 'holiday_jp'

#Use Font Awesome
gem 'font-awesome-less'

#Use puma
gem 'puma'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# Use therubyracer for bootstrap
gem 'therubyracer', platforms: :ruby


# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use Markdown
gem 'redcarpet'  

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

### Use Kimatakubot
# for twitter api
gem 'omniauth-twitter', '~> 1.0.1'
gem 'twitter'
gem 'dotenv-rails'
gem 'tweetstream', '~> 2.6.1'

# Use Sudden_death for tweet
gem 'sudden_death'

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'kaminari'

group :development, :test do
  # Use cucumber as the test tool
  gem 'cucumber-rails', require: false
  gem 'cucumber-rails-training-wheels'

  # Use capybara as the test tool
  gem 'capybara'

  # Use rspec as the test tool
  gem 'rspec-rails'

  # Use spork for speed of server (no using)
  gem 'spork'

  # Use guard
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-rubocop'

  # Gemfileを監視して変更があったら自動でbundle installを実行
  gem 'guard-bundler'
  gem 'growl'

  gem 'webrat'
  gem 'database_cleaner'

  gem 'turnip'
  gem 'factory_girl_rails'

  gem 'simplecov', :require => false

  gem 'binding_of_caller'
  gem "better_errors"
  gem 'pry'

  gem 'pry-rails'
  gem 'pry-coolline'
  gem 'pry-debugger'
  gem 'awesome_print'

  gem 'hirb'
  gem 'hirb-unicode'

  gem 'rails-erd'
  # static code analyzer
  gem 'rubocop', require: false
  # gem 'guard-rubocop'
  gem 'quiet_assets'

  # heroku
  gem 'foreman'
end

source 'https://rubygems.org'
ruby '2.1.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.6.0'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Bootstrap Web Front-End Framework
gem 'bootstrap-sass', '~> 3.3.1.0'

# Autoprefixer is a tool to parse CSS and add vendor prefixes to CSS rules using values from the Can I Use.
gem 'autoprefixer-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.2.5'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Allows to make sample data with semi-realistic names, emails, etc.
gem 'faker', '>= 1.4.3'

# Use ActiveModel has_secure_password
#gem 'bcrypt', '~> 3.1.9'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do

  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Add a comment summarizing the current schema, in model files, routes, tests and fixtures
  gem 'annotate', '~> 2.6.5'
end

group :test do
  # Create customizable Minitest output formats
  gem 'minitest-reporters'
  
  # Allows to take advantage of the Rails.backtrace_cleaner when using MiniTest.
  gem 'mini_backtrace'
  
  # Guard::Minitest allows to automatically & intelligently launch tests with the minitest framework when files are modified.
  gem 'guard-minitest'
end

group :production, :qa do
  # PostgreSQL Database
  gem 'pg',             '~> 0.18.1'

  # Heroku dependency
  gem 'rails_12factor', '0.0.3'

  # Web Server
  gem 'unicorn',        '4.8.3'

end


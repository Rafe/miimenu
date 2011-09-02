source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

#gem 'sqlite3'
gem 'mysql2'

# Asset template engines
gem 'sass-rails', "~> 3.1.0"
gem 'coffee-script'
gem 'uglifier'

# compass for css
gem 'compass', :git => 'https://github.com/chriseppstein/compass.git',
               :branch => 'rails31'
gem 'sass'
gem 'html5-boilerplate'

gem 'jquery-rails'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'


# Gravatar image
gem 'gravatar_image_tag', '1.0.0'
  
#gem for parsing JSON and XML
gem 'yajl-ruby', :require => 'yajl'
gem 'nokogiri'

# Paginator
gem "kaminari"

# File Uploads
gem 'paperclip'

#user authurize
gem 'devise', '>= 1.4.2'
gem 'omniauth', :git => 'git://github.com/intridea/omniauth.git'

# render recipe instruction
gem 'maruku'

group :test, :development do
  gem "rspec", "~> 2.0"
  gem "rspec-rails", "~> 2.0"
  gem "factory_girl_rails"
  gem "database_cleaner"
  gem "shoulda-matchers"
  gem "rcov"
  gem "delorean"
  gem "autotest"
  gem "annotate", :git => "https://github.com/ctran/annotate_models.git"
  gem "watchr"
  gem "jasmine", '1.1.0.rc3'
  gem "headless"
  gem 'faker', '0.3.1'
  # gem "capybara"
  # gem 'yard'
  # gem "bluecloth"
end

group :test do
  gem 'webrat', '0.7.1'
  gem 'spork', '~> 0.9.0.rc'
end

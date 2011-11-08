source 'http://rubygems.org'

gem 'rails', '3.1.1'
gem 'mysql2'
gem 'jquery-rails'
gem 'rb-fsevent'
gem 'activeadmin'
gem "cancan"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end


# Deploy with Capistrano
gem 'capistrano'
gem 'unicorn'

gem 'snmp'

gem 'pry', :group => :development
gem 'pry-rails', :group => :development
gem 'growl', :group => [:test, :development]
gem "rspec-rails", :group => [:test, :development]

group :production do
  gem 'therubyracer'
end

group :test do
  gem 'turn', :require => false
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end

source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'

gem 'dotenv-rails', '~> 2.2.0', groups: [:test, :development] # Load enviroment variables to mimic Heroku

gem 'jsonapi-resources'
gem 'jsonapi-authorization'
gem 'pundit', '~> 1.1.0'

gem 'foreman',                    '~> 0.63.0'
gem 'pg', '~> 0.20.0'
gem 'puma', '~> 3.8.2'
gem 'rack-cors',                  require: 'rack/cors'

group :test do
  gem 'factory_girl_rails', '~> 4.8'
  gem 'rspec-rails'
  gem 'faker',                    '~> 1.7.2'
  gem 'rspec-its'
  gem 'shoulda-matchers',         require: false
end

group :development, :test do
  gem 'spring', '~> 1.3.6' # Default Rails application pre-loader
  gem 'spring-commands-rspec'
  gem 'pry'
  gem 'awesome_print'

end

group :production do
  gem 'memcachier',               '~> 0.0.2'
  gem 'dalli',                    '~> 2.7.2'
  gem 'rails_12factor',           '~> 0.0.2'
  gem 'newrelic_rpm'
end

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

gem_group :development do
  gem 'hirb'
  gem 'annotate'
end

gem_group :test do
end

rails g annotate:install

config.generators do |g|
  g.factory_bot suffix: 'factory'
end

# spec/support/factory_bot.rb
# => rails_helper.rb
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

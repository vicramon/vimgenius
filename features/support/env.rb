require 'cucumber/rails'

Capybara.default_selector = :css

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

ActionController::Base.allow_rescue = false

AfterConfiguration { DatabaseCleaner.clean }

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

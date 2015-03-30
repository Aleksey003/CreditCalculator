require 'capybara'
include Capybara::DSL

Capybara.default_driver = :selenium

def app
  Sinatra::Application
end

#set :environment, :test 

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true 
  config.filter_run :focus
  config.order = 'random' 
end

require 'rspec'
require 'rack/test'
require 'webmock/rspec'
require 'rspec-html-matchers'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'

require_relative '../app'

WebMock.disable_net_connect!(allow_localhost: true)

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include RSpec::HtmlMatchers

  # Disable SQL Logging in Test
  ActiveRecord::Base.logger = nil

  def app
    Sinatra::Application
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end


require_relative './setup_test_database'
require 'capybara'
require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require File.join(File.dirname(__FILE__), 'features', 'web_helpers.rb')

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

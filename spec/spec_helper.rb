require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
  add_filter '/config/'
end
require 'factory_girl_rails'
require "webmock/rspec"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end

  config.order = :random

  config.include FactoryGirl::Syntax::Methods
end

WebMock.disable_net_connect!(allow_localhost: true)

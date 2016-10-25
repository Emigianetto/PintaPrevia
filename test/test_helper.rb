ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'raakt'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  TEST_ACCESSIBILITY = true

  def assert_basic_accessibiliy  
    rt = Raakt::Test.new(@response.body)  
    result = rt.all  
    assert result.length == 0, result.collect { |msg| "\n" + msg.text + "\n" }  
  end
  # Add more helper methods to be used by all tests here...
end

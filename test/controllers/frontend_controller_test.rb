require 'test_helper'

class FrontendControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_basic_accessibiliy
  end

end

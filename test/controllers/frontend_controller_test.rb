require 'test_helper'

class FrontendControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

end

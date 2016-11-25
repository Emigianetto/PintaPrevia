require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test "the age" do
    # assert (@user.age == 25)
  end

end

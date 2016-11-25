require 'test_helper'

class PreviaGroupTest < ActiveSupport::TestCase
  setup do
    @previa_group = previa_groups(:one)
  end

  test "min_age" do
    # assert (@previa_group.min_age == 22)
  end

  test "max_age" do
    # assert (@previa_group.max_age == 25)
  end

  test "gender" do
    # assert (@previa_group.gender == "Todos")
  end

end

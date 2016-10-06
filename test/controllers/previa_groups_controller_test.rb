require 'test_helper'

class PreviaGroupsControllerTest < ActionController::TestCase
  setup do
    @previa_group = previa_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:previa_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create previa_group" do
    assert_difference('PreviaGroup.count') do
      post :create, previa_group: {  }
    end

    assert_redirected_to previa_group_path(assigns(:previa_group))
  end

  test "should show previa_group" do
    get :show, id: @previa_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @previa_group
    assert_response :success
  end

  test "should update previa_group" do
    patch :update, id: @previa_group, previa_group: {  }
    assert_redirected_to previa_group_path(assigns(:previa_group))
  end

  test "should destroy previa_group" do
    assert_difference('PreviaGroup.count', -1) do
      delete :destroy, id: @previa_group
    end

    assert_redirected_to previa_groups_path
  end
end

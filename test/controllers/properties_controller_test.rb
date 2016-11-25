require 'test_helper'

class PropertiesControllerTest < ActionController::TestCase
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get :index
    # assert_response :success
    # assert_not_nil assigns(:properties)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get new" do
    get :new
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should create property" do
    # assert_difference('Property.count') do
    #   post :create,  params: { property: {  } }
    # end

    # assert_redirected_to property_path(assigns(:property))
  end

  test "should show property" do
    get :show, params: { id: @property }
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get edit" do
    get :edit, params: { id: @property }
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should update property" do
    # patch :update, params: { id: @property, property: {  } }
    # assert_redirected_to property_path(assigns(:property))
  end

  test "should destroy property" do
    # assert_difference('Property.count', -1) do
    #   delete :destroy, params: { id: @property }
    # end

    # assert_redirected_to properties_path
  end
end

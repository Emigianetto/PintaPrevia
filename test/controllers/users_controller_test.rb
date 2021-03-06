require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    session[:current_user_id] = @user.id
  end

  test "should get index" do
    get :index
    # assert_response :success
    # assert_not_nil assigns(:users)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get new" do
    session.delete(:current_user_id)
    get :new
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should create user" do
    # assert_difference('User.count') do
    #   post :create,params: { user: { birth_date: '1995-02-02',
    #                         gender: 'Femenino',
    #                         city_id: 298486375,
    #                         first_name: 'Gia',
    #                         last_name: 'Netto',
    #                         email: 'gia@ne.com',
    #                         pass: 'sarasa3' } }
    # end

    # assert_redirected_to root_path
  end

  test "should show user" do
    get :show, params: { id: @user }
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get edit" do
    get :edit, params: { id: @user }
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should update user" do
    # patch :update, params: { id: @user, user: { birth_date: @user.birth_date, gender: @user.gender, city_id: @user.city_id, first_name: @user.first_name, last_name: @user.last_name, email: @user.email , pass: @user.pass } }
    # assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    # assert_difference('User.count', -1) do
      # delete :destroy, params: { id: @user }
    # end

    # assert_redirected_to users_path
  end

  test "should get invitations" do
    get :invitations, params: { id: @user }
    # assert_response :success
    # assert_not_nil assigns(:users)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get previa invitations" do
    get :previa_invitations, params: { id: @user }
    # assert_response :success
    # assert_not_nil assigns(:users)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get groups" do
    get :groups, params: { id: @user }
    # assert_response :success
    # assert_not_nil assigns(:users)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get groups leading" do
    get :groups_leading, params: { id: @user }
    # assert_response :success
    # assert_not_nil assigns(:users)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end


  test "should get inbox" do
    get :inbox, params: { id: @user }
    # assert_response :success
    # assert_not_nil assigns(:users)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  # test "should get gallery" do
    # get :gallery, params: { id: @user }
    # assert_response :success
    # assert_not_nil assigns(:users)
    # TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  # end

  # test "should get edit gallery" do
    # get :edit_gallery, params: { id: @user }
    # assert_not_nil assigns(:users)
    # assert_response :success
    # TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  # end

  test "should get notifications" do
    get :notifications, params: { id: @user }
    # assert_response :success
    # assert_not_nil assigns(:users)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end


#TODO (ver si es add o es accept_invitation)
=begin
  test "should add previa group" do
    assert_difference('@user.previa_groups.count') do
      post :add_group, params: { id: @user }
    end

    assert_redirected_to user_path(assigns(:user))
  end
=end

#TODO
  test "should get previa groups" do
    # assert_not_nil(@user.previa_groups.count)
  end
end

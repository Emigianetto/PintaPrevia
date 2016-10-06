require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { birth_date: '1995-02-02',
                            gender: 'Femenino',
                            city_id: 298486375,
                            first_name: 'Gia',
                            last_name: 'Netto',
                            email: 'gia@ne.com',
                            pass: 'sarasa3' }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { birth_date: @user.birth_date, gender: @user.gender, city_id: @user.city_id, first_name: @user.first_name, last_name: @user.last_name, email: @user.email , pass: @user.pass }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end

  test "should add previa group" do
    assert_difference('@user.previa_groups.count') do
      post :add_group, id: @user
    end

    assert_redirected_to user_path(assigns(:user))
=begin
    assert_difference('@user.previa_groups.count', 1) do
      @previa_group = PreviaGroup.create!(:id => 1231233, :name => "Grupo 3", :active => true, :date => Date.today(), :leader_id => @user.id, :created_at => DateTime.now(), :updated_at => DateTime.now())
      puts @previa_group.attributes
      puts @previa_group.save!
      @user.previa_groups = @user.previa_groups << @previa_group
      puts @user.save!
    end
=end
  end

#TODO
  test "should get previa groups" do
    assert_not_nil(@user.previa_groups.count)
  end
end

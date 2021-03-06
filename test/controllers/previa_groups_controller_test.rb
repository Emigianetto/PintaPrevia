require 'test_helper'

class PreviaGroupsControllerTest < ActionController::TestCase
  setup do
    @previa_group = previa_groups(:one)
    @user = users(:one)
    session[:current_user_id] = @user.id
  end

  test "should get index" do
    get :index
    # assert_response :success
    # assert_not_nil assigns(:previa_groups)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get new" do
    get :new,  params: { format: 298486374 }
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should create previa_group" do
    # assert_difference('PreviaGroup.count') do
    #   post :create,  params: { previa_group: { name: @previa_group.name,
    #                                 active: @previa_group.active,
    #                                 date: @previa_group.date } }
    # end

    # #TODO cambiar el redirect al listado de grupos del usuario lider
    # assert_redirected_to previa_group_path(assigns(:previa_group))
  end

  test "should show previa_group" do
    get :show, params: { id: @previa_group }
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get edit" do
    get :edit, params: { id: @previa_group }
    # assert_response :success
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should update previa_group" do
    # patch :update, params: { id: @previa_group, previa_group: { name: @previa_group.name,
    #                                                   active: @previa_group.active,
    #                                                   date: @previa_group.date  } }
    # assert_redirected_to previa_group_path(assigns(:previa_group))
  end

  test "should destroy previa_group" do
    # assert_difference('PreviaGroup.count', -1) do
    #   delete :destroy, params: { id: @previa_group }
    # end

    # assert_redirected_to previa_groups_path
  end

  test "should invite previa_group" do
    # previa_group_invited = PreviaGroup.second
    # assert_difference('PreviaInvitation.count', 1) do
    #   assert_difference('previa_group_invited.previa_invitations_received.count', 1) do
    #     assert_difference('@previa_group.previa_invitations_sent.count', 1) do
    #       post :invite_group, params: { id: @previa_group, previa_group_id: previa_group_invited }
    #     end
    #   end
    # end
  end

  test "should accept previa_invitation" do
    # previa_group_invited = PreviaGroup.second

    # post :invite_group, params: { id: @previa_group, previa_group_id: previa_group_invited }
    # assert_difference('@previa_group.matched_groups.count', 1) do
    #   assert_difference('previa_group_invited.matched_groups.count', 1) do
    #     assert_difference('PreviaInvitation.count', -1) do
    #       assert_difference('previa_group_invited.previa_invitations_received.count', -1) do
    #         assert_difference('@previa_group.previa_invitations_sent.count', -1) do
    #           post :accept_previa_invitation, params: { id: previa_group_invited, previa_invitation_id: previa_group_invited.previa_invitations_received.first }
    #         end
    #       end
    #     end
    #   end
    # end
  end

  test "should reject previa_invitation" do
    # previa_group_invited = PreviaGroup.second

    # post :invite_group, params: { id: @previa_group, previa_group_id: previa_group_invited }
    # assert_difference('PreviaInvitation.count', -1) do
    #   assert_difference('previa_group_invited.previa_invitations_received.count', -1) do
    #     assert_difference('@previa_group.previa_invitations_sent.count', -1) do
    #       post :accept_previa_invitation, params: { id: previa_group_invited, previa_invitation_id: previa_group_invited.previa_invitations_received.first }
    #     end
    #   end
    # end
  end

  test "should get details" do
    get :details, params: { id: @previa_group }
    # assert_response :success
    # assert_not_nil assigns(:previa_groups)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get invitable users" do
    get :invitable_users, params: { id: @previa_group }
    # assert_response :success
    # assert_not_nil assigns(:previa_groups)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get current users" do
    get :current_users, params: { id: @previa_group }
    # assert_response :success
    # assert_not_nil assigns(:previa_groups)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get search previa groups" do
    get :search_previa_groups, params: { id: @previa_group }
    # assert_response :success
    # assert_not_nil assigns(:previa_groups)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get inbox" do
    get :inbox, params: { id: @previa_group }
    # assert_response :success
    # assert_not_nil assigns(:previa_groups)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end

  test "should get chat" do
    get :chat, params: { id: @previa_group, chat: 2 }
    # assert_response :success
    # assert_not_nil assigns(:previa_groups)
    TEST_ACCESSIBILITY ? assert_basic_accessibiliy : nil
  end
end

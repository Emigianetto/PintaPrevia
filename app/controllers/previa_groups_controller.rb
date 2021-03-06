class PreviaGroupsController < ApplicationController
  before_action :set_previa_group, except: [:new, :create, :index]
  before_action :set_user

  # GET /previa_groups
  # GET /previa_groups.json
  def index
    @title = "Grupos"
    @previa_groups = PreviaGroup.all
  end

  # GET /previa_groups/1
  # GET /previa_groups/1.json
  def show
    @title = "Grupo " + @previa_group.name
  end

  # GET /previa_groups/new
  def new
    @title = "Nuevo grupo"
    @previa_group = PreviaGroup.new(:active => false, :leader => @user, :search_min_age => 18, :search_max_age => 60, :search_gender => 'Mixto', :search_distance => 30)
  end

  # GET /previa_groups/1/edit
  def edit
    @title = "Editar grupo"
  end

  # POST /previa_groups
  # POST /previa_groups.json
  def create
    @previa_group = CreatePreviaGroup.call(previa_group_params, @user)   

    respond_to do |format|
      if @previa_group.persisted?
        format.html { redirect_to previa_group_invitable_users_path(@previa_group), notice: 'El grupo de previa fue creado con éxito.' }
        format.json { render :invitable_users, status: :created, location: @previa_group }
      else
        format.html { render :new }
        format.json { render json: @previa_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /previa_groups/1
  # PATCH/PUT /previa_groups/1.json
  def update
    respond_to do |format|
      if @previa_group.update(previa_group_params)
        format.html { redirect_to @previa_group, notice: 'El grupo de previa fue modificado con éxito.' }
        format.json { render :show, status: :ok, location: @previa_group }
      else
        format.html { render :edit }
        format.json { render json: @previa_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /previa_groups/1
  # DELETE /previa_groups/1.json
  def destroy
    @previa_group.destroy
    respond_to do |format|
      format.html { redirect_to previa_groups_url, notice: 'El grupo de previa fue borrado con éxito.' }
      format.json { head :no_content }
    end
  end

  # GET /previa_groups/1/details
  # GET /previa_groups/1/details.json
  def details
    @title = "Detalles de grupo"
    @current_users = GetCurrentUsers.call(@previa_group)
  end

  # GET /previa_groups/1/invitable_users
  # GET /previa_groups/1/invitable_users.json
  def invitable_users
    @title = "Invitar usuario"
    @invitable_users = GetInvitableUsers.call(@previa_group)
  end

  # GET /previa_groups/1/current_users
  # GET /previa_groups/1/current_users.json
  def current_users
    @title = "Usuarios actuales"
    @current_users = GetCurrentUsers.call(@previa_group)
  end

  # POST /previa_groups/1/invite_user
  # POST /previa_groups/1/invite_user.json
  def invite_user
    invited_user = User.find(params[:user_id])
    InviteUser.call(@previa_group, invited_user)

    respond_to do |format|
      format.html { redirect_to previa_group_invitable_users_path(@previa_group), notice: 'El usuario fue invitado con éxito.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/finish
  # POST /previa_groups/1/finish.json
  def finish
    FinishPreviaGroup.call(@previa_group)

    respond_to do |format|
      format.html { redirect_to previa_group_current_users_path(@previa_group), notice: 'El grupo de previa fue cerrado con éxito.'}
      format.json {head :no_content}
    end
  end

  # GET /previa_groups/1/invite_group
  # GET /previa_groups/1/invite_group.json
  def search_previa_groups
    @title = "Buscar previa"
    @previa_groups_found = SearchPreviaGroups.call(@previa_group)
  end

  # POST /previa_groups/1/ban_group
  # POST /previa_groups/1/ban_group.json
  def ban_group
    banned_group = PreviaGroup.find(params[:previa_group_id])
    BanGroupFromGroup.call(@previa_group, banned_group)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'El grupo de previa fue bloqueado con éxito.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/invite_group
  # POST /previa_groups/1/invite_group.json
  def invite_group
    invited_group = PreviaGroup.find(params[:previa_group_id])
    InviteGroup.call(@previa_group, invited_group)

    respond_to do |format|
      format.html { redirect_to previa_group_search_previa_groups_path(@previa_group), notice: 'El grupo de previa fue invitado con éxito.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/accept_previa_invitation
  # POST /previa_groups/1/accept_previa_invitation.json
  def accept_previa_invitation
    previa_invitation = PreviaInvitation.find(params[:previa_invitation_id])
    AcceptPreviaInvitation.call(@previa_group, previa_invitation)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'La invitación fue aceptada con éxito.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/reject_previa_invitation
  # POST /previa_groups/1/reject_previa_invitation.json
  def reject_previa_invitation
    previa_invitation = PreviaInvitation.find(params[:previa_invitation_id])
    RejectPreviaInvitation.call(@previa_group, previa_invitation)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'La invitación fue rechazada con éxito.' }
      format.json { head :no_content }
    end
  end

  # GET /previa_groups/1/inbox
  # GET /previa_groups/1/inbox.json
  def inbox
    @title = "Conversaciones del grupo " + @previa_group.name
    @chats = GetChatsForPreviaGroup.call(@previa_group)
  end

  # GET /previa_groups/1/chat
  # GET /previa_groups/1/chat.json
  def chat
    @title = "Conversacion"
    @chats = GetChatsForPreviaGroup.call(@previa_group)
    @messages = GetMessagesForChat.call(Chat.find(params[:chat]))
  end

  # POST /previa_groups/1/send_message
  # POST /previa_groups/1/send_message.json
  def send_message
    chat = Chat.find(params[:chat])
    SendMessageToChat.call(@previa_group, chat, params[:message])

    respond_to do |format|
      format.html { redirect_to previa_group_chat_path(@previa_group, :chat => chat) }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/delete_user
  # POST /previa_groups/1/delete_user.json
  def delete_user
    deleted_user = User.find(params[:user_id])
    DeleteUserFromGroup.call(@previa_group, deleted_user)

    respond_to do |format|
      format.html { redirect_to previa_group_current_users_path(@previa_group), notice: 'El usuario fue eliminado con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_previa_group
      @previa_group = PreviaGroup.find(params[:id])
      # @previa_group = PreviaGroup.find_by(id: 253223)
    end

    def set_user
      # session[:current_user_id] = User.find_by(id: 298486374)
      @user = User.find(session[:current_user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def previa_group_params
      params.fetch(:previa_group, {})
      params.require(:previa_group).permit(:user_id, :name, :active, :date, :leader_id, :group_attributes, :members, :invited_users, :banned_users, :banned_groups, :matched_groups, :previa_invitations, :search_min_age, :search_max_age, :search_gender, :search_distance, :chat, :previa_group_id, :previa_invitation_id)
    end
end

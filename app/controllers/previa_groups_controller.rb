class PreviaGroupsController < ApplicationController
  before_action :set_previa_group, except: [:new]
  before_action :set_user

  # GET /previa_groups
  # GET /previa_groups.json
  def index
    @previa_groups = PreviaGroup.all
  end

  # GET /previa_groups/1
  # GET /previa_groups/1.json
  def show
  end

  # GET /previa_groups/new
  def new
    @previa_group = PreviaGroup.new(:active => true, :leader => @user)
  end

  # GET /previa_groups/1/edit
  def edit
  end

  # POST /previa_groups
  # POST /previa_groups.json
  def create
    @previa_group = CreatePreviaGroup.call(previa_group_params, @user)   

    respond_to do |format|
      if @previa_group.persisted?
        format.html { redirect_to @previa_group, notice: 'Previa group was successfully created.' }
        format.json { render :show, status: :created, location: @previa_group }
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
        format.html { redirect_to @previa_group, notice: 'Previa group was successfully updated.' }
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
      format.html { redirect_to previa_groups_url, notice: 'Previa group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /previa_groups/1/invitable_users
  # GET /previa_groups/1/invitable_users.json
  def invitable_users
    @invitable_users = GetInvitableUsers.call(@previa_group)
  end

  # POST /previa_groups/1/invite_user
  # POST /previa_groups/1/invite_user.json
  def invite_user
    set_previa_group
    invited_user = User.find(params[:user_id])
    InviteUser.call(@previa_group, invited_user)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'User was successfully invited.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/ban_group
  # POST /previa_groups/1/ban_group.json
  def ban_group
    set_previa_group
    banned_group = PreviaGroup.find(params[:previa_group_id])
    BanGroupFromGroup.call(@previa_group, banned_group)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'Group was successfully banned.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/invite_group
  # POST /previa_groups/1/invite_group.json
  def invite_group
    set_previa_group
    invited_group = PreviaGroup.find(params[:previa_group_id])
    InviteGroup.call(@previa_group, invited_group)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'Group was successfully invited.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/accept_previa_invitation
  # POST /previa_groups/1/accept_previa_invitation.json
  def accept_previa_invitation
    set_previa_group
    previa_invitation = PreviaInvitation.find(params[:previa_invitation_id])
    AcceptPreviaInvitation.call(@previa_group, previa_invitation)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'Invitation was successfully accepted.' }
      format.json { head :no_content }
    end
  end

  # POST /previa_groups/1/reject_previa_invitation
  # POST /previa_groups/1/reject_previa_invitation.json
  def reject_previa_invitation
    set_previa_group
    previa_invitation = PreviaInvitation.find(params[:previa_invitation_id])
    RejectPreviaInvitation.call(@previa_group, previa_invitation)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'Invitation was successfully rejected.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_previa_group
      @previa_group = PreviaGroup.find(params[:id])
    end

    def set_user
      @user = User.find(session[:current_user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def previa_group_params
      params.fetch(:previa_group, {})
      params.require(:previa_group).permit(:user_id, :name, :active, :date, :leader_id,:group_attributes, :members, :invited_users, :banned_users, :banned_groups, :matched_groups, :previa_invitations)
    end
end

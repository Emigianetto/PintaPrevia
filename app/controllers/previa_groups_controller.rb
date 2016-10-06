class PreviaGroupsController < ApplicationController
  before_action :set_previa_group, only: [:show, :edit, :update, :destroy]

  # GET /previa_groups
  # GET /previa_groups.json
  def index
    @previa_groups = PreviaGroup.all
  end

  # GET /previa_groups/1
  # GET /previa_groups/1.json
  def show
    @users = GetInvitableUsers.call(@previa_group)
  end

  # GET /previa_groups/new
  def new
    @previa_group = PreviaGroup.new(:active => true, :leader => User.find(params[:format]))
  end

  # GET /previa_groups/1/edit
  def edit
  end

  # POST /previa_groups
  # POST /previa_groups.json
  def create
    user = User.find(298486374)
    @previa_group = CreatePreviaGroup.call(previa_group_params, user)   

    respond_to do |format|
      if @previa_group.persisted?
        format.html { redirect_to previa_groups_url, notice: 'Previa group was successfully created.' }
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

  # POST /previa_groups/1/invite_user
  # POST /previa_groups/1/invite_user.json
  def invite_user
    set_previa_group
    user = User.find(params[:user_id])
    InviteUser.call(@previa_group, user)

    respond_to do |format|
      format.html { redirect_to @previa_group, notice: 'User was successfully invited.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_previa_group
      @previa_group = PreviaGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def previa_group_params
      params.fetch(:previa_group, {})
      params.require(:previa_group).permit(:user_id, :name, :active, :date, :leader_id,:group_attributes, :members, :invited_users, :banned_users, :banned_groups, :matched_groups, :previa_invitations)
    end
end

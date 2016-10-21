class UsersController < ApplicationController
  before_action :set_user, :except => [:new, :login, :create]
  before_filter :authorize, :except => [:new, :login, :create]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        #url_for(:controller => :frontend, :action => :index)
        format.html { redirect_to root_path, notice: 'User was successfully created.'}
        format.json { redirect_to root_path, status: :ok} #TODO
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /users/login
  # POST /users/login.json
  def login
    @user = AuthenticateUser.call(params[:users][:email], params[:users][:pass])
    respond_to do |format|
      if !@user.nil?
        session[:current_user_id] = @user.id
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to url_for(:controller => :frontend, :action => :index), notice: 'User was NOT logged in.'}
        format.json { } #TODO
      end
    end
  end

  # POST /users/logout
  # POST /users/logout.json
  def logout
    session.delete(:current_user_id)
    
    respond_to do |format|
      format.html { redirect_to url_for(:controller => :frontend, :action => :index), notice: 'User was successfully logged out.'}
      format.json { head :no_content }
    end
  end
  
  # POST /users/1/invitation
  # POST /users/1/invitation.json
  def accept_invitation
    previa_group = PreviaGroup.find(params[:previa_group_id])
    AcceptGroupInvitation.call(@user, previa_group)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'Invitation was successfully accepted.' }
      format.json { head :no_content }
    end
  end

  # GET /users/1/invitations
  # GET /users/1/invitations.json
  def invitations
    @invitations = GetInvitationsForUser.call(@user)
  end

  # GET /users/1/groups
  # GET /users/1/groups.json
  def groups
  end

  # GET /users/1/groups_leading
  # GET /users/1/groups_leading.json
  def groups_leading
    @groups_leading = GetGroupsLeading.call(@user)
  end

  # POST /users/1/ban_group
  # POST /users/1/ban_group.json
  def ban_group
    previa_group = PreviaGroup.find(params[:previa_group_id])
    BanGroupFromUser.call(@user, previa_group)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'Group was successfully banned.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: session[:current_user_id])
      #@user = User.find(params[:id])
    end

    def authorize
      if session[:current_user_id].nil?
        redirect_to(root_path)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:previa_group_id, :first_name, :last_name, :email, :pass, :birth_date, :gender, :city_id)
    end
end

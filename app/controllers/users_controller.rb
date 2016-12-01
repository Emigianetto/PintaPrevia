class UsersController < ApplicationController
  before_action { flash.clear }
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
    @user = CreateUser.call(user_params)
    #@user = User.new(user_params)
    puts "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"
    puts @user
    puts @user.valid?
    puts "GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG"

    respond_to do |format|
      if @user.valid?
        puts "VAPORELIF"
        #url_for(:controller => :frontend, :action => :index)
        format.html { redirect_to root_path, notice: 'El usuario fue creado con éxito.'}
        format.json { redirect_to root_path, status: :ok} #TODO
      else
        puts "VAPORELELSE"
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
        format.html { redirect_to @user, notice: 'El usuario fue modificado con éxito.' }
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
      format.html { redirect_to users_url, notice: 'El usuario fue borrado con éxito.' }
      format.json { head :no_content }
    end
  end

  # POST /users/login
  # POST /users/login.json
  def login
    @user = AuthenticateUser.call(params[:email], params[:pass])
    respond_to do |format|
      if !@user.nil?
        session[:current_user_id] = @user.id
        format.html { redirect_to @user }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { redirect_to url_for(:controller => :frontend, :action => :index), notice: 'Mail y/o clave incorrectas.'}
        format.json { } #TODO
      end
    end
  end

  # POST /users/logout
  # POST /users/logout.json
  def logout
    session.delete(:current_user_id)
    
    respond_to do |format|
      format.html { redirect_to url_for(:controller => :frontend, :action => :index), notice: 'Se ha cerrado la sesión con éxito.'}
      format.json { head :no_content }
    end
  end
  
  # POST /users/1/accept_invitation
  # POST /users/1/accept_invitation.json
  def accept_invitation
    previa_group = PreviaGroup.find(params[:invitation_id])
    AcceptGroupInvitation.call(@user, previa_group)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'La invitación fue aceptada con éxito.' }
      format.json { head :no_content }
    end
  end

  # POST /users/1/reject_invitation
  # POST /users/1/reject_invitation.json
  def reject_invitation
    previa_group = PreviaGroup.find(params[:invitation_id])
    RejectGroupInvitation.call(@user, previa_group)

    respond_to do |format|
      format.html { redirect_to @user, notice: 'La invitación fue rechazada con éxito.' }
      format.json { head :no_content }
    end
  end

  # GET /users/1/invitations
  # GET /users/1/invitations.json
  def invitations
    @invitations = GetInvitationsForUser.call(@user)
  end

  # GET /users/1/previa_invitations
  # GET /users/1/previa_invitations.json
  def previa_invitations
    @previa_invitations = GetPreviaInvitations.call(@user)
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
      format.html { redirect_to @user, notice: 'El grupo de previa fue bloqueado con éxito.' }
      format.json { head :no_content }
    end
  end

  # POST /users/1/leave_group
  # POST /users/1/leave_group.json
  def leave_group
    previa_group = PreviaGroup.find(params[:id])
    LeavePreviaGroup.call(@user, previa_group)

    respond_to do |format|
      format.html { redirect_to user_groups_path(@user), notice: 'El grupo de previa fue abandonado con éxito.' }
      format.json { head :no_content }
    end
  end

  # GET /users/1/inbox
  # GET /users/1/inbox.json
  def inbox
    @groups_leading = GetGroupsLeading.call(@user)
  end

  # GET /users/1/gallery
  # GET /users/1/gallery.json
  def gallery
  end

  # GET /users/1/edit_gallery
  # GET /users/1/edit_gallery.json
  def edit_gallery
  end

  # GET /users/1/notifications
  # GET /users/1/notifications.json
  def notifications
    @notifications = GetNotificationsForUser.call(@user)
  end

  # POST /users/1/delete_notification
  # POST /users/1/delete_notification.json
  def delete_notification
    notification = Notification.find(params[:notification_id])
    DeleteNotification.call(@user, notification)

    respond_to do |format|
      format.html { redirect_to user_notifications_path(@user), notice: 'La notificacion fue eliminada con éxito.' }
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
      params.require(:user).permit(:previa_group_id, :first_name, :last_name, :email, :email_confirmation, :pass, :pass_confirmation, :birth_date, :gender, :city_id, :image)
    end
end

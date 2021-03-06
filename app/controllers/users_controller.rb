class UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    # increase the limit as the user base of the app grows
    @users = User.limit(10000).all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if params[:user][:avatar]
      result = User.upload(params[:user][:avatar].tempfile, params[:user][:avatar].original_filename, content_type: params[:user][:avatar].content_type)
      @user.avatar = {"__type"=>"File", "name"=>result['name'], "url"=>result['url']}
    end

    if @user.save
      session[:user_id] = @user.id
      UserMailer.welcome_email(@user).deliver
      redirect_to new_team_path, notice: "User was successfully created! We'll need you to verify through email before you can log in."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :avatar)
  end

  def find_user
    @user = User.find(params[:id])
  end

end

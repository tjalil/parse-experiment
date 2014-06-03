class SessionsController < ApplicationController

  def index
  end

  def new
  end

  def create
    @user = User.authenticate(params[:username], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out!"
  end

end
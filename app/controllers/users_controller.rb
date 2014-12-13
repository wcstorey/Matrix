class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login(@user)
      redirect_to root_path
    else
      session[:error] = @user.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end

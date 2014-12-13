class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new admin_params
    if @admin.save
      login(@admin)
      redirect_to admin_path(@admin)
    else
      render :new
    end
  end

  def destroy

  end

  def update
  end

  def show

  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email, :password)
  end
end

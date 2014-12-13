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

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
   @admin = Admin.find(params[:id])
   @admin.update_attributes(username: admin_params[:username], email:admin_params[:email])
   redirect_to admin_path(@admin)
  end

  def show
    @admin = Admin.find params[:id]
    render :show
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email, :password)
  end
end

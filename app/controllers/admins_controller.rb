class AdminsController < ApplicationController
  def index
    @admin = ""
  end

  def check
    @admin = params[:admin_id]
    if @admin == "Matrix"
      session[:valid] = true
      redirect_to new_admin_path
    else
      redirect_to admins_path
    end
  end

  def new
    if session[:valid] == true
      @admin = Admin.new
    else
      redirect_to admins_path
    end
  end

  def create
    @admin = Admin.new admin_params
    if @admin.save
      login(@admin)
      redirect_to admin_path(@admin)
    else
      flash[:danger] = @admin.errors.messages
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
    @category = Category.new
    render :show
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :email, :password, :id)
  end
end

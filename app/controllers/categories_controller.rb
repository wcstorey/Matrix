class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def create
    p "*"*30
    p category_params
    @admin = Admin.find(session[:admin_id])
    @admin.categories.create(category_params[:name])
    redirect_to root_path
  end

private
  def category_params
    params.require(:category).permit(:name, :admin_id)
  end
end

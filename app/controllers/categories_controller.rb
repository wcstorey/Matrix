class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    # @posts_search_results = Post.search(params[:search])
  end

end

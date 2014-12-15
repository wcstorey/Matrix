class PostsController < ApplicationController

  def index
    @posts = Category.find(params[:category_id]).posts.where(parent_id: nil)
  end

  def show
    @category = Category.find(params[:category_id])
    @post = @category.posts.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.new
  end

  def create
    category = Category.find(params[:category_id])
    @post = category.posts.new(post_params)
    @post.update(user_id: current_user.id)
    if @post.save
      if @post.parent.nil?
        redirect_to category_post_path id: @post
      else
        @original_page = Post.find(params[:post][:page_id])
        redirect_to category_post_path id: @original_page
      end
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      if @post.parent_id
        redirect_to category_post_path id: @post.parent_id
      else
        redirect_to category_post_path id: @post.id
      end
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.parent.nil?
      @post.destroy
      redirect_to categories_path
    else
      @original_page = Post.find(params[:page_id])
      @post.destroy
      redirect_to category_post_path id: @original_page
    end
  end

  def searched

    @posts_search_results = Post.search(params[:search])
  end



  private

  def post_params
    params.require(:post).permit(:title, :content, :parent_id, :search)
  end
end

class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @post = Post.find_by params[:id]
    @vote = @post.votes.build voteable_id: @post.id, user_id: current_user.id
    if @vote.save
      redirect_to category_post_path(@post.category_id, @post.id)
    end
  end


  def destroy
    @post = Post.find params[:id]
    @post.votes.last.destroy
    redirect_to category_post_path(@post.category_id, @post.id)

  end
  # private
  # def vote_params
  #   params.require(:vote).permit(:voteable_id, :user_id)
  # end

end
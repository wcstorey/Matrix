class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @post = Post.find params[:post]
    @vote = @post.votes.build voteable_id: @post.id, user_id: current_user.id
    if @vote.save
      redirect_to category_post_path(@post.category_id, @post.id)
    else
      redirect_to category_post_path(@post.category_id, @post.id)
    end
  end



  def destroy
    @post = Post.find params[:post]
    if !@post.votes.empty?
      @post.votes.last.destroy if @post.votes.any? { |vote| vote.id != current_user.id}
    end
    redirect_to category_post_path(@post.category_id, @post.id)
  end
  # private
  # def vote_params
  #   params.require(:vote).permit(:voteable_id, :user_id)
  # end

end
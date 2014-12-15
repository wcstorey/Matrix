class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    respond_to do |format|

        @post = Post.find params[:post]
        @upvote = @post.votes.find_or_initialize_by(user_id: current_user.id)
        @upvote.update_attributes(postive_vote: true)

      if @upvote.valid?
        if @post.parent_id.nil?
          format.html{
          vote_count(@post)
          redirect_to category_post_path(@post.category_id, @post.id)
        }
        format.js{
          @post = Post.find params[:post]
          vote_count(@post)
          @post.vote_count
        }

        else
          format.html{
          vote_count(@post)
          redirect_to category_post_path(@post.category_id, @post.parent_id)
        }
        format.js{
          @post = Post.find params[:post]
          vote_count(@post)
          @post.vote_count
        }
        end
      end

    end
    # @original_page = Post.find(params[:page_id])
    # redirect_to category_post_path(@original_page.category_id, @original_page.id)
  end


  def destroy
    respond_to do |format|

    @post = Post.find params[:post]
    @downvote = @post.votes.find_or_initialize_by(user_id: current_user.id)
    @downvote.update_attributes(postive_vote: false)
    if @downvote.valid?
      if @post.parent_id.nil?
        format.html{
        p "1" * 50
        vote_count(@post)
        redirect_to category_post_path(@post.category_id, @post.id)
        }
        format.js{
          p "" * 50
          @post = Post.find params[:post]
          vote_count(@post)
          @post.vote_count
        }
      else
        format.html{
          p "3" * 50
        vote_count(@post)
        redirect_to category_post_path(@post.category_id, @post.parent_id)
        }
        format.js{
          p "4" * 50
          @post = Post.find params[:post]
          vote_count(@post)
          @post.vote_count
        }
      end
    end
  end
end


  private

  def vote_count(post)
    count = post.votes.where(postive_vote: true).count - post.votes.where(postive_vote: false).count
    post.update_attributes(vote_count: count)
  end

end

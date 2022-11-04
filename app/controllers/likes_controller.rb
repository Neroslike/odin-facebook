class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to posts_path
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to posts_path
  end

  def index
    if params[:post_id]
      @likes = Post.find(params[:post_id]).likes
    else
      @likes = Comment.find(params[:comment_id]).likes
    end
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id, :comment_id)
  end
end

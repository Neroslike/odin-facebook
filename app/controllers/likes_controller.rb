class LikesController < ApplicationController
  def create
    @like = Like.create(like_params)
    redirect_to posts_path
  end

  def destroy
    Like.find(params[:id]).destroy
    redirect_to posts_path
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id, :comment_id)
  end
end

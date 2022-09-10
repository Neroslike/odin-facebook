class CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id, :parent_id)
  end
end

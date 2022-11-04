class CommentsController < ApplicationController
  def index
    @comments = Post.find(params[:post_id]).comments
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Post.find(params[:post_id]).comments.build(comment_params)
    @comment.assign_identifier

    respond_to do |format|
      if @comment.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :picture, :parent_id)
  end
end

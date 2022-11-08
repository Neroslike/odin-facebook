class PostsController < ApplicationController
  def index
    @pagy, @posts = pagy_countless(Post.build_feed(current_user).order(created_at: :desc), items: 5)

    render "scrollable_list" if params[:page]
    @like = Like.new
    @users = User.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path, status: :see_other
  end

  def create_comment
    @comment = Post.find(params[:id]).comments.create(comment_params)
  end

  def new_shared_post
    @post = Post.new
  end

  def share_post
    @post = Post.new(share_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def share_params
    params.require(:post).permit(:user_id, :body, :shared_post_id)
  end

  def post_params
    params.require(:post).permit(:body, :user_id, pictures: [])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :parent_id, :post_id)
  end
end

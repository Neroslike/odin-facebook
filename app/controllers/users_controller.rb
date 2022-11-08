class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def create_friend_request
    @user = User.find(params[:user_id])
    @last_request = current_user.send_friend_request(@user)
    redirect_back(fallback_location: root_path)
  end

  def create_friendship
    @user = User.find(params[:user_id])
    current_user.accept_friend_request(@user)
    redirect_back(fallback_location: root_path)
  end

  def decline_friend_request
    @user = User.find(params[:user_id])
    current_user.remove_pending_request(@user)
    redirect_back(fallback_location: root_path)
  end

  def delete_friend
    @user = User.find(params[:user_id])
    current_user.remove_friend(@user)
  end

  def edit_user_profile
    @user = User.find(params[:id])
  end

  def update_user_profile
    @user = User.find(params[:id])

    if @user.update(user_details)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def friends
    @friends = User.find(params[:id]).friends
  end

  def posts
    @posts = User.find(params[:id]).posts
  end

  private

  def user_details
    params.require(:user).permit(:school, :company, :country, :birthday, :occupation, :profile_pic, :background_pic, :quote)
  end
end

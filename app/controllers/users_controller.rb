class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
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
end

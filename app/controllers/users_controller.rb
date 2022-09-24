class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def create_friendship
    @user = User.find(params[:user_id])
    current_user.friends << @user
    @user.friends << current_user
  end
end

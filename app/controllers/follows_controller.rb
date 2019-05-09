class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def follow
    current_user.follow(@user)
    @follow = Follow.find_by(follower: current_user, followable: @user)
    NotifierMailer.follow_user(@user, current_user).deliver
    respond_to :js
  end

  def unfollow
    current_user.stop_following(@user)
    respond_to :js
  end

  def all_follows
    @all_follows = @user.user_followers
  end

  def all_following
    @all_following = @user.following_users
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:error] = "user_not_found"
    redirect_to root_path
  end
end

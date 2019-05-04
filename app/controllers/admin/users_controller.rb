class Admin::UsersController < ApplicationController
  before_action :load_user, only: %i(show destroy)

  def index
    @users = User.page(params[:page]).per Settings.per_page
  end

  def show
    @info = User.find_by user_id: params[:id]
    return if @info
    flash[:error] = t(".user_not_found")
    redirect_to admin_users_path
  end

  def destroy
    if @user.destroy
      flash[:success] = t(".deleted")
      redirect_to admin_users_path
    else
      flash[:error] = t(".delete_failed")
      redirect_to admin_users_path
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:error] = t(".user_not_found")
    redirect_to admin_users_path
  end
end

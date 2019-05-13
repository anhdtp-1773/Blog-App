class UsersController < ApplicationController
  before_action :load_user

  def show
    @entries = Entry.where(user_id: @user.id)
    return if @entries
    flash[:error] = t(".not_found_any_entry")
    redirect_to root_path
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:error] = t(".user_not_found")
    redirect_to root_path
  end
end

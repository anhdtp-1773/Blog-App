class Admin::UsersController < Admin::BasesController
  before_action :load_user, only: %i(show destroy)

  def index
    @users = User.by_lastest.page(params[:page]).per Settings.per_page
  end

  def show; end

  def destroy
    if @user.destroy
      NotifierMailer.warning_user(@user).deliver
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

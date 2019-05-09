class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  protect_from_forgery with: :exception
  helper_method :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  add_attributes = [:name, :is_admin, :nick_name, :email, :password, :password_confirmation, :current_password, :is_female, :date_of_birth]
    devise_parameter_sanitizer.permit :sign_in, keys: [:name]
    devise_parameter_sanitizer.permit :sign_up, keys: add_attributes
    devise_parameter_sanitizer.permit :account_update, keys: add_attributes
  end

  def verify_admin!
    return if user_signed_in? && current_user.is_admin
    redirect_to(root_url)
  end
end

class UsersController < Devise::SessionsController
  def create
    super
  end

  protected
    def after_sign_in_path_for(resource)
      if current_user.information_user
        root_path
      else
        new_information_user_path
      end
    end
end

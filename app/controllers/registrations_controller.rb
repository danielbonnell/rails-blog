class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    user_path(user)
  end

  private

  def register_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :role,
      :email,
      :avatar_link,
      :password,
      :password_confirmation,
      :remove_avatar
    )
  end

  def account_update_params
    params.require(:user).permit(
      :avatar,
      :username,
      :website,
      :first_name,
      :last_name,
      :role,
      :email,
      :avatar_link,
      :password,
      :password_confirmation,
      :current_password,
      :remove_avatar
    )
  end
end

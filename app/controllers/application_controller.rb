class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception
  helper :avatar

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [
      :avatar,
      :email,
      :username,
      :first_name,
      :last_name,
      :role,
      :website,
      :avatar_link,
      :password,
      :password_confirmation,
      :current_password,
      :remove_avatar
    ]
  end
end

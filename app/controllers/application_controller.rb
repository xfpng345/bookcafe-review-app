# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username image])
  end

  def after_update_path_for(*)
    user_path(@user)
  end

  def after_sign_in_path_for(_resource)
    shops_path
  end
end

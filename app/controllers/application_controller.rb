class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    my_page_path
  end

  def after_sign_up_path_for(_resource)
    my_page_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name])
  end
end

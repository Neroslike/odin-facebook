class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery except: :sign_in
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end

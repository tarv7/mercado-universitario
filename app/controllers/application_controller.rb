class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :course_id,
                                                       :semester, :address_id])
  end

  def current_actor
    session[:restricted_area] ? current_user.seller : current_user
  end
  helper_method :current_actor
end

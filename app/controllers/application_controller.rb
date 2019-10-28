class ApplicationController < ActionController::Base
  layout :layout_by_resource
  before_action :change_locale
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def change_locale
    cookies[:locale] = params[:locale] if params[:locale]

    if cookies[:locale]
      I18n.locale = cookies[:locale] if I18n.locale != cookies[:locale]
    end

    redirect_to products_path if request.env['REQUEST_PATH'] == change_locale_path
  end

  protected

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || categories_path
  end

  def layout_by_resource
    if devise_controller? && resource_name == :user &&
       %w[passwords sessions].include?(controller_name) && action_name == 'new'
      'login'
    else
      'application'
    end
  end

  # Permite que alguns parâmetros extras sejam enviados para o controller
  # do devise
  def configure_permitted_parameters
    params[:nav_active] = 'users'
    devise_parameter_sanitizer
      .permit(:sign_up,
              keys: [:name, :course_id, :semester, :whatsapp,
                     addresses_attributes: %i[id street neighborhood complement
                                              number city_id _destroy]])

    devise_parameter_sanitizer
      .permit(:account_update,
              keys: [:name, :university_id, :course_id, :semester, :whatsapp, :image,
                     addresses_attributes: %i[id street neighborhood complement
                                              number city_id _destroy]])
  end

  # Define o ator em questão de acordo com a área restrita
  def current_actor
    session[:restricted_area] ? current_user.seller : current_user
  end

  # Está na área restrita se o ator em questão for do tipo vendedor
  def restricted_area?
    current_actor.is_a?(Seller)
  end
  helper_method :current_actor, :restricted_area?
end

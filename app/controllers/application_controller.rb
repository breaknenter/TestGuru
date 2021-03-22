class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :set_locale
  before_action :authenticate_user!
  before_action :devise_params, if: :devise_controller?

  add_flash_types :success, :danger, :warning, :info

  def default_url_options
    { lang: (I18n.locale == I18n.default_locale ? nil : I18n.locale) }
  end

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  def devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email first_name last_name password])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      flash[:notice] = t("misc.welcome", user_name: current_user.first_name)

      tests_path
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end

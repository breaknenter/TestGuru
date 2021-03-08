class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :authenticate_user!
  before_action :devise_params, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  protected

  def devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email first_name last_name password])
  end

  def after_sign_in_path_for(resource)
    if current_user.admin?
      admin_tests_path
    else
      flash[:notice] = "Добро пожаловать в TestGuru, #{current_user.first_name}!"

      tests_path
    end
  end
end

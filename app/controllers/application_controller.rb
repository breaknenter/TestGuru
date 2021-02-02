class ApplicationController < ActionController::Base
  before_action :ref_url
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user, :logged_in?, :ref_url

  private

  def authenticate_user!
    redirect_to login_path, alert: "Войдите или зарегистрируйтесь" unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def ref_url
    cookies[:url] = request.url
  end

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end

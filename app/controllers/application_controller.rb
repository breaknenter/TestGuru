class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user, :logged_in?

  private

  def authenticate_user!
    unless current_user
      cookies[:ref_url] = request.url
      redirect_to login_path, alert: "Войдите или зарегистрируйтесь"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end

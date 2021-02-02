class SessionsController < ApplicationController
  skip_before_action :ref_url
  skip_before_action :authenticate_user!, only: %i[new create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to cookies[:url] || root_path
    else
      flash.now[:alert] = "Неправильный email или пароль"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    current_user = nil
    
    redirect_to root_path
  end
end

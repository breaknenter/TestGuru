class ContactsController < ApplicationController
  ERRORS = {
    title: "укажите заголовок",
    email: "укажите email",
    text:  "укажите сообщение" }.freeze

  skip_before_action :authenticate_user!
  before_action      :contacts_params, only: :create

  def show
  end

  def create
    if params_valid?(@params)
      ContactsMailer.send_message(@params).deliver_now

      redirect_to contacts_path, notice: t(".success")
    else
      flash.now[:alert] = t(".fail")

      render :show
    end
  end

  private

  def contacts_params
    @params = params
                .require(:contact)
                .permit(:email, :title, :text)
                .to_h
                .symbolize_keys
  end

  def params_valid?(params)
    @errors = []

    ERRORS.each do |key, message|
      @errors << message if params[key].blank?
    end

    @errors.empty?
  end
end

class ContactsMailer < ApplicationMailer
  CONTACT_EMAIL = "testgururails@gmail.com".freeze

  def send_message(email:, title:, text:)
    @text = text

    mail from: email, to: CONTACT_EMAIL, subject: title
  end
end

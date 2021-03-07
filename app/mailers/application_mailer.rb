class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <mail@testguru.io>}
  layout "mailer"
end

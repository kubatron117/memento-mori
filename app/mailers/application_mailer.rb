class ApplicationMailer < ActionMailer::Base
  default from: "Memorian <reminder@no-reply.memorian.io>"
  layout "mailer"
end

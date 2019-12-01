class NewUserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_user_mailer.new_user_signup.subject
  #
  def new_user_signup
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

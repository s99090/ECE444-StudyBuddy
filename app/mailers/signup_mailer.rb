class SignupMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_mailer.new_signup.subject
  #
  def new_signup(user)
    @user = user
    @greeting = "Hi"

    mail to: user.email, subject: "new subject"
  end
end

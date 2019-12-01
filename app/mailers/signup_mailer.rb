class SignupMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.signup_mailer.new_signup.subject
  #
  def new_signup(user, buddy)
    @user = user
    @buddy = buddy
    @greeting = "Hi"

    mail to: user.email, subject: "New Buddy Registration | StudyBuddy"
  end
end

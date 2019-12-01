# Preview all emails at http://localhost:3000/rails/mailers/signup_mailer
class SignupMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/signup_mailer/new_signup
  def new_signup
    SignupMailer.new_signup
  end

end

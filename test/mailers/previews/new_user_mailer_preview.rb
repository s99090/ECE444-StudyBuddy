# Preview all emails at http://localhost:3000/rails/mailers/new_user_mailer
class NewUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_user_mailer/new_user_signup
  def new_user_signup
    NewUserMailer.new_user_signup
  end

end

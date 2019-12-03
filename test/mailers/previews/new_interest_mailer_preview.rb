# Preview all emails at http://localhost:3000/rails/mailers/new_interest_mailer
class NewInterestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/new_interest_mailer/notify_buddy_about_new_interest
  def notify_buddy_about_new_interest
    NewInterestMailer.notify_buddy_about_new_interest
  end

end

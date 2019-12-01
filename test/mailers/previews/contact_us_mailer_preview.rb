# Preview all emails at http://localhost:3000/rails/mailers/contact_us_mailer
class ContactUsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_us_mailer/new_issue
  def new_issue
    ContactUsMailer.new_issue
  end

end

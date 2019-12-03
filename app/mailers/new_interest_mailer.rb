class NewInterestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.new_interest_mailer.notify_buddy_about_new_interest.subject
  #
  def notify_buddy_about_new_interest(buddy, student)
    @buddy = buddy
    @student = student
    mail to: @buddy.email, subject: "New Interest From Student | StudyBuddy"
  end
end

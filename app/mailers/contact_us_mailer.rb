class ContactUsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_us_mailer.new_issue.subject
  #
  def new_issue(name, email, message)

    @name = name
    @email = email
    @message = message

    mail to: ["Anirudh.sampath@mail.utoronto.ca", "syedrokib@gmail.com", " harold.xi@mail.utoronto.ca"],
         subject: "New 'Contact Us' Inquiry | StudyBuddy"
  end

end

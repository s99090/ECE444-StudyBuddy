class MeetingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.meeting_mailer.notify_student_about_meeting.subject
  #
  def notify_student_about_meeting(student, buddy, meeting)
    @student = student
    @buddy = buddy
    @meeting = meeting

    mail to: @student.email, subject: "New Meeting Request | StudyBuddy"

  end
end

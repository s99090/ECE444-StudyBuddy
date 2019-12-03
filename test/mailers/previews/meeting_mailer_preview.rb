# Preview all emails at http://localhost:3000/rails/mailers/meeting_mailer
class MeetingMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/meeting_mailer/notify_student_about_meeting
  def notify_student_about_meeting
    MeetingMailer.notify_student_about_meeting
  end

end

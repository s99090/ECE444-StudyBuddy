require 'test_helper'

class MeetingMailerTest < ActionMailer::TestCase
  test "notify_student_about_meeting" do
    mail = MeetingMailer.notify_student_about_meeting
    assert_equal "Notify student about meeting", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

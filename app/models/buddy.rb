class Buddy < ApplicationRecord
  has_many :meetings
  validates :username, uniqueness: true, presence: true
  validates :hourly_rate, format: {with: /\A\d{1,6}(\.\d{0,2})?\z/,
                                   message: "does not match expected format"}
  validates :fname, presence: true, allow_blank: false
  validates :lname, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false

  def set_confirmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

  def validate_email
    self.email_confirmed = true
    self.confirm_token = nil
  end

end
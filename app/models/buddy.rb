class Buddy < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :hourly_rate, format: {with: /\A\d{1,6}(\.\d{0,2})?\z/,
                                   message: "does not match expected format"}
  validates :fname, presence: true, allow_blank: false
  validates :lname, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
end
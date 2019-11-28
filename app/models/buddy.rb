class Buddy < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  DOLLAR_AMOUNT_REGEXP = /^\d{1,6}(\.\d{0,2})?$/
  validates :hourly_rate, numericality: true, :format => { :with => DOLLAR_AMOUNT_REGEXP,
                                                           :message => "You provided an invalid dollar amount",
                                                           :multiline => true}
end

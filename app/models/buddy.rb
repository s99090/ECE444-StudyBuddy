class Buddy < ApplicationRecord
  validates :username, uniqueness: true, presence: true
end

class Group < ApplicationRecord
  validates :name, presence: true
  has_many :group_announcement
  has_many :group_meeting
end

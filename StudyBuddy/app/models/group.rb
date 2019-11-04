class Group < ApplicationRecord
  has_many: group_announcement
  has_many: group_meeting
  validates :name, presence: true
end

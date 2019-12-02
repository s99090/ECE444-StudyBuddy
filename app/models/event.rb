class Event < ApplicationRecord
  belongs_to :group
  has_many :comments, as: :commentable, dependent: :delete_all

  validates :event_type, presence: true
  validates :name, presence: true
end

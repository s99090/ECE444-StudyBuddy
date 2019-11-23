class Event < ApplicationRecord
  belongs_to :group
  has_many :comments, as: :commentable
end

class Professor < ApplicationRecord
  has_and_belongs_to_many :courses
  has_one_attached :avatar
  validates :name, presence: true
end

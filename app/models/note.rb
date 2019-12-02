class Note < ApplicationRecord
  belongs_to :course
  belongs_to :user
  # has_many_attached :noteFiles
  has_one_attached :noteFile
end

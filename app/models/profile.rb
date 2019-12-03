class Profile < ApplicationRecord
  has_one_attached :avatar
  belongs_to :user

  validates :phone, :numericality => true, :allow_blank => true,
                    :length => { :minimum => 10, :maximum => 15 }
end

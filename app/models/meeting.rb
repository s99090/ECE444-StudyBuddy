class Meeting < ApplicationRecord
    belongs_to :buddy
    #belongs_to :user
    has_many :comments, as: :commentable, dependent: :delete_all
end

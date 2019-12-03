class Meeting < ApplicationRecord
    belongs_to :buddy
    #belongs_to :user
    has_many :comments, as: :commentable, dependent: :delete_all
    # validates :fname, presence: true, allow_blank: false
    validates :name, presence: true, allow_blank: false
    validates :initial_post, presence: true, allow_blank: false

end

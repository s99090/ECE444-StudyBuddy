class Course < ApplicationRecord
    has_many :links
    has_many :discussions
    has_many :notes
end

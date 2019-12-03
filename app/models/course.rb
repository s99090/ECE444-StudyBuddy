class Course < ApplicationRecord
    has_many :links
    has_many :discussions
    has_many :notes
    has_and_belongs_to_many :professors
end

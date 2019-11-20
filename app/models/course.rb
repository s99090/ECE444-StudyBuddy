class Course < ApplicationRecord
    has_many :links
    has_many :notes
end

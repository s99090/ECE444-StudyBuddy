class Note < ApplicationRecord
  belongs_to :noteowner, polymorphic: true
end

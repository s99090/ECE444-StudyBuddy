class AddCoursesToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :courses, :string
  end
end

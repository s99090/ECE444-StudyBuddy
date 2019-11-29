class AddLnmaeToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :lname, :string
  end
end

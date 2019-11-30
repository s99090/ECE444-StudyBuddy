class AddFnameToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :fname, :string
  end
end

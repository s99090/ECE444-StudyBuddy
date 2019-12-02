class AddAboutToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :about, :string
  end
end

class AddDownvotesToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :downvotes, :string, array: true, default: []
  end
end

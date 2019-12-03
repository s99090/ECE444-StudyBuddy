class AddUpvotesToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :upvotes, :string, array: true, default: []
  end
end

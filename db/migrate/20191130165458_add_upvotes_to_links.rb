class AddUpvotesToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :upvotes, :string, array: true, default: []
  end
end

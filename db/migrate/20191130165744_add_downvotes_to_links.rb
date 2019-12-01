class AddDownvotesToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :downvotes, :string, array: true, default: []
  end
end

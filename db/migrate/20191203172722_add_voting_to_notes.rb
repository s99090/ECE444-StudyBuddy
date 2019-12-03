class AddVotingToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :upvotes, :string, array: true, default: []
    add_column :notes, :downvotes, :string, array: true, default: []
  end
end

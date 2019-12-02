class AddMeetingsToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :meetings, :string, array: true, default: []
  end
end

class AddInvitedMeetingsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :invited_meetings, :string, array: true, default: []
  end
end

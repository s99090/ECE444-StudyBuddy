class AddInviteeToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :invitee, :string, default: ""
  end
end

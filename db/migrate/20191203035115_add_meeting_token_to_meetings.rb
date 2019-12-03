class AddMeetingTokenToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :meeting_token, :string
  end
end

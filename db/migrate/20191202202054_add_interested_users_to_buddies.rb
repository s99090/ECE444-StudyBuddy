class AddInterestedUsersToBuddies < ActiveRecord::Migration[6.0]
  def change
    add_column :buddies, :interested_users, :string, array: true, default: []
  end
end

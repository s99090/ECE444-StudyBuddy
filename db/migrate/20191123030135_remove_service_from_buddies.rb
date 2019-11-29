class RemoveServiceFromBuddies < ActiveRecord::Migration[6.0]
  def change

    remove_column :buddies, :service, :string
  end
end

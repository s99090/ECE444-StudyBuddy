class CreateBuddies < ActiveRecord::Migration[6.0]
  def change
    create_table :buddies do |t|
      t.string :username
      t.string :service
      t.text :description
      t.string :hourly_rate

      t.timestamps
    end
  end
end

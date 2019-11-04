class CreateGroupMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :group_meetings do |t|
      t.references :group, null: false, foreign_key: true
      t.datetime :time
      t.text :place
      t.text :description

      t.timestamps
    end
  end
end

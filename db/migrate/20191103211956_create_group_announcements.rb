class CreateGroupAnnouncements < ActiveRecord::Migration[6.0]
  def change
    create_table :group_announcements do |t|
      t.string :creator
      t.text :body
      t.references :group, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end

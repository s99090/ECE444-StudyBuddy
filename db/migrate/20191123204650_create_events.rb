class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :name
      t.text :content
      t.datetime :datetime
      t.integer :creater_id, null:false
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end

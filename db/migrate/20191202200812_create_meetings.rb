class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.references :buddy
      t.string :name
      t.text :initial_post
      t.timestamps
    end
  end
end

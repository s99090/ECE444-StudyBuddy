class CreateGroupchats < ActiveRecord::Migration[6.0]
  def change
    create_table :groupchats do |t|
      t.references :group
      t.string :groupchat_id
      t.string :groupchat_name
      t.string :groupchat_administrator
      t.string :initial_post
      t.integer :creater_id, null:false
      t.timestamps
    end
  end
end

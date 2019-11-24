class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :creater_id, null:false
      t.references :commentable, polymorphic: true, null: false

      t.timestamps
    end
  end
end

class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :course
      t.string :link_name 
      t.string :link_url
      t.string :creater_id
      t.timestamps
    end
  end
end

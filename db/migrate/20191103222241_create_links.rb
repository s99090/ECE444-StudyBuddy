class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :course
      t.string :link_name 
      t.string :link_url
      t.timestamps
    end
  end
end

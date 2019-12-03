class CreateProfessors < ActiveRecord::Migration[6.0]
  def change
    create_table :professors do |t|
      t.string :name
      t.string :department
      t.string :position
      t.string :about
      t.integer :rating

      t.timestamps
    end
  end
end

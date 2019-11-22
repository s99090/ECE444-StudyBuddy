class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :note_id
      t.string :title
      t.string :author
      t.references :course
      t.text :description

      t.timestamps
    end
  end
end

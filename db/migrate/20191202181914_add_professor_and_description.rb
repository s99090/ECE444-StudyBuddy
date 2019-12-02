class AddProfessorAndDescription < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :description, :string
    add_column :courses, :professor, :string
  end
end

class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|

      t.string :course_id
      t.string :name
      t.text :subject
      t.string :term
      t.string :course_code
      t.string :students
      t.text :notes
      t.string :links
      t.string :discussions
      t.string :groups

      t.timestamps
    end
  end
end


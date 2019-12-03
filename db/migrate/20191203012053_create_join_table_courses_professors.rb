class CreateJoinTableCoursesProfessors < ActiveRecord::Migration[6.0]
  def change
    create_join_table :courses, :professors do |t|
      t.index :course_id
      t.index :professor_id
    end
  end
end

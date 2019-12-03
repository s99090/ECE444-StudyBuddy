class SetDefaultForProfRating < ActiveRecord::Migration[6.0]
  def change
    change_column_default :professors, :rating, 0
  end
end

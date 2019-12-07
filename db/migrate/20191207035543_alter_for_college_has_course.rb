class AlterForCollegeHasCourse < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :course, foreign_key: true
    remove_index :courses, column: %i[name shift college_id]
    remove_reference :courses, :college, foreign_key: true

    add_reference :users, :college_has_course, foreign_key: true
  end
end

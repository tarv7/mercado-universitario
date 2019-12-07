class TransferCourseToCollege < ActiveRecord::Migration[5.2]
  def change
    remove_index :courses, column: %i[name shift university_id]
    remove_reference :courses, :university, index: :true

    add_reference :courses, :college, foreign_key: :true
    add_index :courses, %i[name shift college_id],
      name: 'index_courses_on_name_and_shift_and_college_id',
      unique: true
  end
end

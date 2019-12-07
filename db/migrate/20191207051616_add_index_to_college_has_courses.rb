class AddIndexToCollegeHasCourses < ActiveRecord::Migration[5.2]
  def change
    add_index :college_has_courses, %i[course_id college_id],
      name: 'index_courses_id_and_college_id_and_unique',
      unique: true
  end
end

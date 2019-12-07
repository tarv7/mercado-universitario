class CreateCollegeHasCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :college_has_courses do |t|
      t.references :college,  foreign_key: true, null: false
      t.references :course,   foreign_key: true, null: false

      t.timestamps
    end
  end
end

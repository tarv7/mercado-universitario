class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :name,           null: false
      t.integer :shift,         null: false
      t.references :university, null: false, foreign_key: true,
                                dependent: :destroy

      t.timestamps
    end

    add_index :courses, %i[name shift university_id], unique: true
  end
end

class CreateColleges < ActiveRecord::Migration[5.2]
  def change
    create_table :colleges do |t|
      t.string :name,           null: false
      t.references :address,    null: false, foreign_key: true,
                                dependent: :destroy
      t.references :university, null: false, foreign_key: true,
                                dependent: :destroy

      t.timestamps
    end

    add_index :colleges, %i[name university_id], unique: true
  end
end

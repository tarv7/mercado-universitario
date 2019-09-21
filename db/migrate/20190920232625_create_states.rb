class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.string :name,         null: false
      t.string :abbreviation, null: false, limit: 2

      t.timestamps
    end
  end
end

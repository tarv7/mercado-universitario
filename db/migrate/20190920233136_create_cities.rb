class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name,       null: false
      t.references :state,  null: false, foreign_key: true, dependent: :destroy

      t.timestamps
    end

    add_index :cities, :name
    add_index :cities, %i[name state_id], unique: true
  end
end

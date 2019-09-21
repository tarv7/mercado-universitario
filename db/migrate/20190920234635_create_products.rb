class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name,       null: false
      t.float :price,       null: false
      t.text :description
      t.references :seller, null: false, foreign_key: true, dependent: :destroy

      t.timestamps
    end
  end
end

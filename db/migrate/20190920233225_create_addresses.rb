class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street,       null: false
      t.string :neighborhood, null: false
      t.string :complement
      t.integer :number
      t.references :city,     null: false, foreign_key: true,
                              dependent: :destroy

      t.timestamps
    end
  end
end

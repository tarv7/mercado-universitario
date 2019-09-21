class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :note,         null: false, limit: 300
      t.integer :status,    null: false
      t.references :seller, null: false, foreign_key: true, dependent: :destroy
      t.references :user,   null: false, foreign_key: true, dependent: :destroy

      t.timestamps
    end
  end
end

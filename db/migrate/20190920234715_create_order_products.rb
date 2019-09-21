class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :quantity,    null: false
      t.references :product,  null: false, foreign_key: true,
                              dependent: :destroy
      t.references :order,    foreign_key: true, dependent: :destroy
      
      t.timestamps
    end
  end
end

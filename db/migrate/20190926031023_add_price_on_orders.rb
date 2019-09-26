class AddPriceOnOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :price, :float, null: false
  end
end

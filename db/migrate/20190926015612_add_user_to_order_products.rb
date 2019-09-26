class AddUserToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_products, :user, null: false, foreign_key: true

    add_index :order_products, %i[product_id order_id user_id], unique: true
  end
end

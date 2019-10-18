class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :address, foreign_key: true
  end
end

class AddConfirmedToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :confirmed, :boolean, default: false
  end
end

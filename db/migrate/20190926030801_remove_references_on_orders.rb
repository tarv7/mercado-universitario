class RemoveReferencesOnOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :seller, index: true, foreign_key: true
    remove_reference :orders, :user, index: true, foreign_key: true
  end
end

class AddCategoryToProduct < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sellers, :category, index: true, foreign_key: true
    add_reference :products, :category, null: false, foreign_key: true
  end
end

class AddImageToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :image, :string, null: false
  end
end

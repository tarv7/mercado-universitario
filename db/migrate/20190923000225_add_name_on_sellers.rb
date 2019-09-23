class AddNameOnSellers < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :name, :string, null: false
    add_index :sellers, :name
  end
end

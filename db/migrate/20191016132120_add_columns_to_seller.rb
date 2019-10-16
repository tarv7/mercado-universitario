class AddColumnsToSeller < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :whatsapp, :string
    add_column :sellers, :instagram, :string
  end
end

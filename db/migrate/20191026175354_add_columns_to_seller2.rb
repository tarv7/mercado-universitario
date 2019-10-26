class AddColumnsToSeller2 < ActiveRecord::Migration[5.2]
  def change
    add_column :sellers, :description, :text
    add_column :sellers, :open, :boolean,     default: true
    add_column :sellers, :delivery, :boolean, default: true
  end
end

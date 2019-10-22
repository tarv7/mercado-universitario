class AddWhatappToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :whatsapp, :string
  end
end

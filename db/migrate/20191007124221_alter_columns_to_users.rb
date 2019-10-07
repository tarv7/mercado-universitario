class AlterColumnsToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :semester, :integer, null: true
    remove_reference :users, :address, index: true, foreign_key: true
  end

  def down
    add_reference :users, :address, index: true, foreign_key: true
  end
end

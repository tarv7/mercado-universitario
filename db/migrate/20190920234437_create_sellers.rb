class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.references :user,     null: false, foreign_key: true,
                              dependent: :destroy, unique: true
      t.references :category, null: false, foreign_key: true,
                              dependent: :destroy

      t.timestamps
    end
  end
end

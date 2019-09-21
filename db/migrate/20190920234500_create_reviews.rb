class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :value,     null: false
      t.text :comment,      limit: 300
      t.references :seller, null: false, foreign_key: true, dependent: :destroy
      t.references :user,   null: false, foreign_key: true, dependent: :destroy

      t.timestamps
    end

    add_index :reviews, %i[seller_id user_id], unique: true
  end
end

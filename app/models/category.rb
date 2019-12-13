class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  validates :name, presence: true
  validates :image, presence: true
end

class Product < ApplicationRecord
  belongs_to :seller

  has_many :order_products

  validates :name, presence: true
  validates :price, presence: true, numericality: true
end

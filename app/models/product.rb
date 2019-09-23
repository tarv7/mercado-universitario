class Product < ApplicationRecord
  belongs_to :seller

  has_many :order_products

  validates :name, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { maximum: 300 }
end

class Order < ApplicationRecord
  belongs_to :seller
  belongs_to :user

  has_many :order_products
end

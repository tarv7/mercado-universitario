class Order < ApplicationRecord
  belongs_to :seller
  belongs_to :user

  has_many :order_products

  validates :note, presence: true, length: { maximum: 300 }
  validates :status, presence: true, numericality: { only_integer: true }
end

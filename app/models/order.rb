class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy

  enum status: %i[not_seen preparing on_the_way delivered canceled]

  validates :note, presence: true, length: { maximum: 300 }
  validates :status, presence: true
end
